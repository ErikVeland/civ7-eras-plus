# Eras+

Eras+ extends Civilization VII Age pacing within the currently exposed modding API.

Steam Workshop ID: 3736818422

## What It Does

- Raises Age point caps.
- Slows tech and civic pacing.
- Reduces some milestone and repeatable future tech/civic Age pressure.
- Slightly slows settlement growth.
- Adds light production and maintenance pressure to trainable combat units.
- Speeds up roads and railroads so longer ages stay mobile.
- Slows Modern victory projects modestly without blocking victory routes.

## Design Intent

Eras+ is for players who want more time inside each age, not an endless age-stop mode. It stretches pacing while preserving the game's three-age structure.

## User-Facing Defaults

- Save-affecting gameplay changes.
- Best used with a new game.
- Designed around ToT 1.4.0+.

## Layout

- `content/` contains the mod package uploaded to Steam Workshop.
- `eras-plus-workshop-no-preview.vdf` is the SteamCMD upload descriptor.
- `upload-to-steam-no-preview.sh` uploads the current package without changing the preview image.
- `docs/` contains maintainer notes for release and testing.

## Development

Tuning lives in `content/data/`. Prefer small, explainable pacing changes over broad rewrites so players can understand what changed.

## Release

See [docs/RELEASE.md](docs/RELEASE.md).
