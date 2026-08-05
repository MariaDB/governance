# Maintainers

## Maintainers and Subsystems

This document records who maintains MariaDB Server and its subsystems, and tracks each subsystem through its lifecycle. The rules themselves — how maintainers are appointed and removed, how decisions are made, and how disputes are resolved — are in [Governance](governance.md).

### Subsystem

A subsystem is a part of MariaDB Server that is maintained as a unit — a feature, a feature set, a component, or a plugin. Subsystems are how responsibility for the server is divided: every part of the codebase belongs to exactly one subsystem, and each subsystem has its own maintainers, reviewers, and lifecycle. Any code that is not a part of a specific subsystem belongs to the **Server Core**, the default subsystem. All subsystems, taken together, cover the whole server.

### Orphaned subsystems

A subsystem is orphaned from the moment it loses its last permanent maintainer and until its situation is resolved. An orphaned subsystem is never left unmaintained: the stewards review it within the time set in the [Response Times](response-times.md) table and either arrange for an interim coverage — a guardian maintainer who keeps it working meanwhile — or fold it into another subsystem, making it a responsibility of that subsystem maintainer.

Stable subsystems that are not in active development may stay orphaned for a long time; occasional security issues and critical bugs these are handled by interim maintainers the stewards assign. Example: FederatedX, CONNECT.

An orphan is eventually resolved in one of three ways: a permanent maintainer is appointed; it is merged into another, maintained subsystem; or it is retired. Merging and retiring both change the list of subsystems and are therefore Council decisions ([Governance. Decision making](governance.md#3-decision-making)).

### Deprecating and retiring a subsystem

Listing a subsystem in this file is not a commitment to maintain it indefinitely. A subsystem may reach a point where maintaining it costs more than it is worth, at which point it can be deprecated and eventually retired. This can happen at any time — the trigger is a judgement that continued maintenance is no longer worthwhile, based on factors such as user base, incoming bug load, and available maintainers. Both orphaned and actively maintained subsystems can be deprecated.

Because it affects users, a deprecation decision states a rationale and, for anything with external users, a migration or compatibility path where possible. The user-facing timing and compatibility guarantees are defined in the [Deprecation Policy](deprecation-policy.md).

**Coverage continues.** A deprecated subsystem still has a maintainer — dedicated or interim — and still receives security and critical fixes for the whole deprecation period, until it is actually removed. Deprecation marks a feature for removal; it does not leave it unmaintained in the meantime.

**Retirement.** After the deprecation period defined in the Deprecation Policy, the subsystem is retired: its code removed or moved out of the active tree and its entry moved to the retired list below, recording when and why. Retirement with on-disk format, wire format, or compatibility implications follows the project's normal release and breaking-change process.

## The list of Stewards, Subsystems, and Maintainers

See [here](lists/maintainers.md)

### How to read the list

Each subsystem specifies:

* **Scope** — what the subsystem covers; optionally the source paths or directories it owns.  
* **Status** — one of: Active (fully maintained, new features accepted) · Maintained (fixes only, limited new development) · Retired (removed). Can be optionally followed by any of: Orphaned (no permanent maintainer; under interim coverage until resolved — see [Governance. Orphaned subsystems](#orphaned-subsystems)) · Deprecated (intended for removal; see [Deprecating and retiring](#deprecating-and-retiring-a-subsystem)).  
* **Jira project / component** — where the subsystem's issues are tracked.

Additionally not retired subsystems specify:

* **Maintainer(s)** — name, affiliation, and contact. Affiliation is recorded for transparency only and confers no difference in authority ([Governance](governance.md)).  
* **List / channel** — the mailing list or channel where the subsystem works in the open. Doesn’t need to be specified if it’s [developers@lists.mariadb.org](mailto:developers@lists.mariadb.org)

Affiliation values: Community · MariaDB plc · \[Other company\].

### Stewards

Stewards hold maintainer-level rights across the whole server without being tied to a single subsystem. They take part in project-wide decisions and can act as tie-breaker in maintainer disputes.

### Emeritus maintainers

Former maintainers, removed for inactivity, but recognized for past stewardship. May be reinstated on return ([Governance. Ceasing to be a maintainer](governance.md#22-ceasing-to-be-a-maintainer)).

### Updating the list

Additions, removals, emeritus transitions, and subsystem status changes are recorded here once confirmed under [Governance. Becoming a maintainer](governance.md#21-becoming-a-maintainer), [Governance. Ceasing to be a maintainer](governance.md#22-ceasing-to-be-a-maintainer), or the [Deprecation policy](deprecation-policy.md).





