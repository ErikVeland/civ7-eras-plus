# Maintenance

## Tuning

Keep changes transparent and explainable. Eras+ should stretch pacing, not rewrite the age system.

When tuning values, check:

- Age point caps.
- Tech and civic cost scaling.
- Milestone pressure.
- Future tech and civic pressure.
- Growth pacing.
- Unit cost and maintenance pressure.
- Road and railroad mobility.

Keep `Balanced Extended` visibly distinct from `Balanced Extended+`. `Balanced Extended+` is the lighter Epic-style preset, while `Balanced Extended` should be obvious from the opening tech/civic turn estimates.

## Save Compatibility

This is a save-affecting gameplay mod. Recommend a new game after substantial tuning changes.

## Localization

Mod browser strings and Workshop descriptions need to stay aligned with the actual tuning.

## Workshop Descriptions

`workshop-description-translations-bbcode.md` is the source of truth for public Workshop descriptions. Keep all supported languages in the same BBCode structure:

- `[h1]` title.
- Clear feature sections.
- Lists using `[*]` only.
- Compatibility notes.
- Support link to `https://www.buymeacoffee.com/generik`.

Run `/Users/veland/SteamWorkshopUploads/scripts/prepare-workshop-upload.mjs <ModDirectory>` after changing Workshop copy. It updates the VDF safely and verifies that SteamCMD will update the existing Workshop item rather than creating a new one.
