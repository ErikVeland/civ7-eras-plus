# Release Notes

## Steam Workshop

- Workshop ID: `3736818422`
- Upload descriptor: `eras-plus-workshop-no-preview.vdf`
- Upload command: `./upload-to-steam-no-preview.sh`
- Content folder: `content/`

## Preflight

```sh
for f in $(find content \( -name '*.xml' -o -name '*.modinfo' \)); do xmllint --noout "$f" || exit 1; done
find content -name '.DS_Store' -o -name '__MACOSX' -o -name '*.zip' -o -name '*.7z' -o -name '*.rar' -o -name '*.exe'
```

The `xmlns="ModInfo"` warning from `xmllint` is expected.

## Post-Publish Verification

```sh
steamcmd +force_install_dir /tmp/civ7-workshop-test +login erikveland +workshop_download_item 1295660 3736818422 validate +quit
```

Run preflight checks against the downloaded Workshop payload.

## In-Game Smoke Test

- Start a new game.
- Confirm the mod appears in the mod list with localized name and description.
- Confirm early tech/civic costs and Age pacing reflect the intended slower curve.
- Confirm road movement feels faster.
- Confirm Modern victory projects remain available.
