## Version 1.0.0 - 2024-Mar-16

### Configuration changes

- [ktlint 1.2.1](https://github.com/pinterest/ktlint/releases/tag/1.2.1) as the new default

### Dependencies updates

- #10 chore(deps): update orb-tools orb to v12.1.0
- #9 chore(deps): update cimg/openjdk docker tag to v17.0.10
- #8 chore(deps): pin orb-tools orb to 12.0.4
- #7 chore(deps): update cimg/openjdk docker tag to v21
- #6 chore(deps): update shellcheck orb to v3.2.0
- #5 chore(deps): update orb-tools orb to v12.1.0
- #3 chore(deps): update cimg/openjdk docker tag to v17.0.10

## Version 0.0.6 - 2024-Feb-21

- Verbose does not impact `curl` commands anymore. Only sets `set -x` in the installation script. 

## Version 0.0.5 - 2024-Feb-21

- Fix check for verbose parameter in the installation script.

## Version 0.0.4 - 2024-Feb-21

- Fix usage example
- Also pass `version` and `verbose` as YAML strings to `install` job.

## Version 0.0.3 - 2024-Feb-21

- Pass `version` and `verbose` parameter to install script as YAML strings.

## Version 0.0.2 - 2024-Feb-21

- Better latest version detection
- Minor documentation improvements

## Version 0.0.1 - 2024-Feb-21

Initial release of the Kotlin Ktlint Orb

- Provides a command to install ktlint.
