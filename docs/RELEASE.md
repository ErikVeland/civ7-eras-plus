# Release Notes

## Steam Workshop

- Workshop ID: `3736792223`
- Upload descriptor: `eras-plus-workshop-no-preview.vdf`
- Upload command: `./upload-to-steam-no-preview.sh`
- Content folder: `content/`

## Preflight

```sh
for f in $(find content \( -name '*.xml' -o -name '*.modinfo' \)); do xmllint --noout "$f" || exit 1; done
find content -name '.DS_Store' -o -name '__MACOSX' -o -name '*.zip' -o -name '*.7z' -o -name '*.rar' -o -name '*.exe'
```

The `xmlns="ModInfo"` warning from `xmllint` is expected.

## Workshop Text Preflight

The upload scripts run the shared release-prep validator before SteamCMD. You can also run it manually from any mod root:

```sh
/Users/veland/SteamWorkshopUploads/scripts/prepare-workshop-upload.mjs
```

The validator checks every supported Workshop language, regenerates the VDF description from the English source block, and refuses to continue if a descriptor is missing the canonical `publishedfileid`. Never remove `publishedfileid`; SteamCMD would create a new Workshop item.

SteamCMD stores multi-line VDF values with KeyValues newline escapes. The validator decodes the field before upload and fails if the public Workshop text would contain visible `\n`, `/n`, or broken list markers.

## Full Validation

Run the shared validator before publishing or after changing localisation, Workshop copy, VDF metadata, JavaScript, XML, or upload scripts:

```sh
/Users/veland/SteamWorkshopUploads/scripts/validate-mods.mjs
```

This does not upload anything. It validates Workshop descriptions, regenerates VDF metadata, checks JavaScript syntax, XML/modinfo parsing, shell upload scripts, runtime localisation coverage, and forbidden package debris.

## Post-Publish Verification

```sh
steamcmd +force_install_dir /tmp/civ7-workshop-test +login erikveland +workshop_download_item 1295660 3736792223 validate +quit
```

Run preflight checks against the downloaded Workshop payload.

## In-Game Smoke Test

- Start a new game.
- Confirm the mod appears in the mod list with localized name and description.
- Confirm early tech/civic costs and Age pacing reflect the intended slower curve.
- Confirm road movement feels faster.
- Confirm Modern victory projects remain available.
