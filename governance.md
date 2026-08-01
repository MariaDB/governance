# Governance of MariaDB Server

This document describes how MariaDB Server is governed: the roles people hold, how maintainers are appointed and removed, how decisions are made, what a maintainer may do alone, and how disagreements and non-responses are resolved. It applies to every maintainer of every subsystem equally, regardless of employer or affiliation. It does not cover individual procedures, policies, and standards, such as
[AI Policy](ai-policy.md),
[Code of Conduct](code-of-conduct.md),
[Committers](committers.md),
[Deprecation Policy](deprecation-policy.md),
[Maintainers](maintainers.md),
[Quality Development Rules](quality-development-rules.md),
[Response Times](response-times.md),
[Security Policy](security-policy.md),
and others.

## 1. Roles

**Contributor** — anyone who submits a change, report, or review. No standing commitment. Anyone may review a change and such input is welcome, but it does not constitute a formal approval of the contribution.

**Committer** — a contributor, who is granted commit rights to the repository. Committer status is sponsored by one or more maintainers, who may revoke it. A committer is required to update Jira tickets corresponding to their work, but is not held responsible for any subsystem and has no approval right.

**Reviewer** — a committer recognized by the maintainers of a subsystem as a reliable reviewer for it. May review and formally approve contributions and is responsible for the quality of contributions they approve. A reviewer cannot self-approve, unless the change is trivial.

**Maintainer** — a reviewer who is held responsible for a subsystem. Maintainer is responsible for the overall architecture of their subsystem, and is accountable for its health. More than one maintainer may be responsible for the same subsystem, with equal authority. A maintainer for a subsystem is a committer for other subsystems. See [Maintainers](maintainers.md) for the list of maintainers and their subsystems.

**Steward** — a reviewer, who has maintainer rights but not maintainer responsibilities. See [Maintainers](maintainers.md) for the list of stewards. Participates in project-wide decisions with other maintainers and can serve as a tie-breaker in maintainer disputes.

All maintainers and stewards together form a **Maintainer Council**.

## 2. Maintainers

### 2.1 Becoming a maintainer

A new maintainer is nominated by an existing maintainer of the subsystem, or by a steward. The nomination is confirmed by the existing maintainer(s) of that subsystem (if any) and at least one steward.

### 2.2. Ceasing to be a maintainer

A person ceases to be a maintainer in one of the three ways:

* A maintainer can step down voluntarily at any time and for any reason

* A maintainer can be removed for inactivity. This means not fulfilling their project duties for a [specified period of time](response-times.md) without a prior notice. Inactive maintainers have no responsibilities or decision powers but may be reinstated on return.

* A maintainer can be removed for cause. That is for serious or repeated breach of the maintainer responsibilities or [Code of Conduct](code-of-conduct.md). This is an extreme measure and should only happen when there is no other way to ensure the continued maintenance of the subsystem at the appropriate quality level.

### 2.3 Subsystems without a maintainer (orphaned)

When a subsystem loses its last maintainer, the stewards [review the subsystem](response-times.md) and either arrange for an interim coverage, or decide to merge the orphaned subsystem with another, maintained, subsystem.

## 3. Decision making

### 3.1 General guidelines

Anyone can decide within the responsibilities of their role. If a subsystem has multiple maintainers they are generally expected to be in agreement on decisions, conflicts must be escalated. Decisions that affect multiple subsystems need all corresponding maintainers to agree. Project-wide decisions are made by the Maintainer Council. Changing the list of subsystems is a project-wide decision. Non-technical aspects might need to involve the MariaDB Foundation.

All decisions are explicit — staying silent does not count as an approval — and recorded — on Github or in Jira.

Anyone can escalate by promoting the decision from the reviewer to the maintainer or to the Council. For example, a reviewer can notice that a contribution changes how a subsystem communicates with other subsystems, and alert maintainers and stewards. Additionally refusal to participate in a decision by not responding causes an escalation too.

### 3.2 Conflict resolution

When maintainers cannot reach a decision, they can ask a steward to be a tie-breaker. Any single steward can do it.

A conflict between stewards is resolved by voting in the Council, simple majority rule. Changes to this document require a 2/3rd supermajority. In case of a tie, the MariaDB Foundation CEO, who must not be a member of the Council, casts the decisive vote.

### 3.3 Veto right

Every Council member has a veto right that they can invoke at most once every three years in Council decision making. A veto halts the decision and forces the Council to reconsider it. A veto can be overridden by a 2/3rd supermajority. A veto and its reasons are recorded.
