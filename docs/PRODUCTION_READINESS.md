# Production Readiness

Eras+ is a compact data mod. Loading risk is low; tuning confidence depends on
per-age playtests.

## Release gates

- Run `/Users/veland/SteamWorkshopUploads/scripts/validate-mods.mjs ErasPlus`.
- Confirm `content/` contains no `.DS_Store` or archive debris.
- Confirm XML/modinfo parsing passes.

## Setup/profile smoke test

- Start a new game with each profile: Vanilla, Balanced Extended, Balanced
  Extended+, Balanced Extended+ / Modern Stretch, MP Pace, Modern Stretch, Custom.
- For Custom, verify each per-age length loads only the intended age SQL.
- Confirm the in-game readout shows the active pacing profile.
- Confirm tech/civic costs, age-point caps, future tech/civic pressure, growth,
  military production/maintenance, routes, railroads, and Modern victory project
  costs match the selected profile.

## Playtest targets

- Record the approximate age-end turn for Standard, Abbreviated, and Long speeds.
- Record whether players hit repeatable techs/civics too early.
- Record whether Modern victory projects remain achievable.
- Keep MP Pace as the conservative multiplayer-facing profile.
- Avoid broad rewrites; prefer small, explainable tuning changes.
