#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec /Users/veland/SteamWorkshopUploads/civ7developmenttools/launch-workshop-uploader.sh "$SCRIPT_DIR/eras-plus-workshop-no-preview.vdf"
