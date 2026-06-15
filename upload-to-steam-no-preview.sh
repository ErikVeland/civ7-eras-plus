#!/usr/bin/env bash
set -euo pipefail

EXPECTED_PUBLISHED_FILE_ID="3736792223"
VDF="/Users/veland/SteamWorkshopUploads/ErasPlus/eras-plus-workshop-no-preview.vdf"

/Users/veland/SteamWorkshopUploads/scripts/prepare-workshop-upload.mjs ErasPlus

if ! grep -q '"publishedfileid"[[:space:]]*"'"$EXPECTED_PUBLISHED_FILE_ID"'"' "$VDF"; then
  echo "Refusing to upload Eras+: $VDF is not bound to Workshop item $EXPECTED_PUBLISHED_FILE_ID" >&2
  exit 1
fi

steamcmd +login erikveland +workshop_build_item "$VDF" +quit
node /Users/veland/SteamWorkshopUploads/scripts/record-upload.mjs ErasPlus
