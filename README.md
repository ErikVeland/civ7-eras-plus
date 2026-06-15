# Eras+

Eras+ extends Civilization VII Age pacing within the currently exposed modding API.

Steam Workshop ID: 3736792223

## What It Does

- Adds a game setup option: `Eras+ Pacing`.
- Offers `Vanilla`, `Balanced Extended`, `Balanced Extended+`, `MP Pace`, and `Modern Stretch` presets.
- Raises Age point caps depending on the selected preset.
- Slows tech and civic pacing depending on the selected preset.
- Reduces some milestone and repeatable future tech/civic Age pressure.
- Slightly slows settlement growth.
- Adds light production and maintenance pressure to trainable combat units.
- Speeds up roads and railroads so longer ages stay mobile.
- Slows Modern victory projects modestly without blocking victory routes.
- `Balanced Extended+` keeps production, growth, maintenance, and victory projects close to Standard while using Epic-style tech/civic costs.

## Design Intent

Eras+ is for players who want more time inside each age, not an endless age-stop mode. It stretches pacing while preserving the game's three-age structure.

## User-Facing Defaults

- Save-affecting gameplay changes.
- `Balanced Extended+` is the recommended default and the lighter Epic-research option requested by players.
- `Balanced Extended` remains available as a clearly stronger single-player stretch than `Balanced Extended+`.
- Current `Balanced Extended` research scaling is visibly above the Epic-style default: Antiquity tech/civics use 1.75x/1.90x, Exploration uses 2.05x/2.20x, and Modern uses 2.50x/2.65x.
- `MP Pace` is the safest multiplayer-facing option when repeatable techs/civics are arriving before the Age timer catches up.
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
