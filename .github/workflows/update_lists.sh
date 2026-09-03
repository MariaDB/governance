#!/bin/bash

# A script to synchronize selected GitHub org teams with the lists in this repo.

# GitHub logins that must remain on both teams even if absent from the lists.
PROTECTED=(vuvova gkodinov)

set -euo pipefail
lowercase() {
  tr '[:upper:]' '[:lower:]'
}

extract_logins() {
  local file="$1"
  if [[ ! -f "$file" ]]; then
    echo "error: missing $file" >&2
    return 1
  fi
  grep -E '^[[:space:]]*\*[[:space:]]+\[[^]]+\]\(https://github\.com/[a-zA-Z0-9_-]+\)$' "$file" \
    | sed -E 's|.*https://github\.com/([a-zA-Z0-9_-]+)\)$|\1|' \
    | lowercase \
    | sort -u
}

list_team_members() {
  local team="$1"
  gh api --paginate "orgs/MariaDB/teams/${team}/members" --jq '.[].login' \
    | lowercase \
    | sort -u
}

add_member() {
  local team="$1" user="$2"
  echo "ADD  ${team}: ${user}"
  gh api --silent -X PUT "orgs/MariaDB/teams/${team}/memberships/${user}" -f role=member
}

remove_member() {
  local team="$1" user="$2"
  echo "REMOVE ${team}: ${user}"
  gh api --silent -X DELETE "orgs/MariaDB/teams/${team}/memberships/${user}"
}

in_list() {
  local needle="$1"
  shift
  local item
  for item in "$@"; do
    [[ "$item" == "$needle" ]] && return 0
  done
  return 1
}

sync_team() {
  local team="$1"
  local list_file="$2"
  echo "::group::Sync org team '${team}' from ${list_file}"
  desired=()
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -n "$line" ]] && desired+=("$line")
  done < <(extract_logins "$list_file")
  current=()
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -n "$line" ]] && current+=("$line")
  done < <(list_team_members "$team")
  # Protected accounts stay on the team regardless of list contents.
  local user
  for user in "${PROTECTED[@]}"; do
    user="$(printf '%s' "$user" | lowercase)"
    if ! in_list "$user" "${desired[@]+"${desired[@]}"}"; then
      desired+=("$user")
    fi
  done
  echo "Desired ($(printf '%s' "${#desired[@]}")): ${desired[*]:-}"
  echo "Current ($(printf '%s' "${#current[@]}")): ${current[*]:-}"
  local failed=0
  for user in "${current[@]+"${current[@]}"}"; do
    [[ -n "$user" ]] || continue
    if in_list "$user" "${PROTECTED[@]}"; then
      continue
    fi
    if ! in_list "$user" "${desired[@]+"${desired[@]}"}"; then
      if ! remove_member "$team" "$user"; then
        echo "::error::Failed to remove ${user} from ${team}"
        failed=1
      fi
    fi
  done
  for user in "${desired[@]+"${desired[@]}"}"; do
    [[ -n "$user" ]] || continue
    if ! in_list "$user" "${current[@]+"${current[@]}"}"; then
      if ! add_member "$team" "$user"; then
        echo "::error::Failed to add ${user} to ${team} (must already be an org member)"
        failed=1
      fi
    fi
  done
  echo "::endgroup::"
  return "$failed"
}


status=0
sync_team committers lists/committers.md || status=1
sync_team reviewers lists/reviewers.md || status=1
exit "$status"
