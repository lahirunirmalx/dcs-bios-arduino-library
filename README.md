# DCS-BIOS Arduino Library

> DCS-Skunkworks is looking for additional contributors for this repository.  If you have strong C coding skills and a passion for DCS-BIOS, please contact talbotmcinnis@alumni.uwo.ca

This is an Arduino library that makes it easy to write sketches that talk to DCS-BIOS.

For more information and documentation, see the [DCS-BIOS FlightPanels Project](https://github.com/DCSFlightpanels).  The example "OneOfEverything" is a good place to start looking for controls to use.

## Origins

DCS-BIOS was originally developed here, [DCS-BIOS project.](https://github.com/dcs-bios/dcs-bios)  DCS-BIOS Flightpanels forked all of DCS-BIOS in order to initially provide support for Saitek Flight Panels.  As of Nov, 2020, the original project has received limited support (despite a major update for HUB), and FlightPanels is gaining in popularity due to it's support.  Late in 2020, this fork of the arduino-only portion was created to become the "official" branch associated with the FlightPanels DCS-BIOS side.

## Support & Documentation

This is a community maintained plugin.  Support is best found at the DCS-Flightpanels discord channel.  The wiki is very much a work in progress, and can be found here: https://github.com/DCSFlightpanels/dcs-bios-arduino-library/wiki

## Releasing

1. Bump `version` in `library.properties` and add a `## v<version>` section to `releasenotes.md`.
2. Merge to `master`, then push a tag with the same version number, e.g. `git tag 0.3.14 && git push origin 0.3.14`.
3. The `Release` GitHub workflow checks that the tag matches `library.properties`, builds `dcs-bios-arduino-library-<version>.zip` with `scripts/make_release.sh`, and publishes a GitHub release with that zip and the release notes.

The Arduino Library Manager and the PlatformIO registry pick the new version up from the tag.

To build the zip locally run `scripts/make_release.sh` (Linux/macOS, needs `zip`) or `make_release.ps1` (Windows); both write to `Releases/`.

## Continuous integration

The `Compile examples` workflow compiles the examples with the Arduino CLI on Uno, Mega 2560 and Leonardo on every push and pull request. Examples that only build on a specific board are listed per board in `.github/workflows/compile-examples.yml`.
