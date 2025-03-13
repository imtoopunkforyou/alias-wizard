#!/usr/bin/env bash
set -euo pipefail

script_path="$(realpath "$0")"
tmp_dir="$(mktemp -d -t aw_scripts.XXXXXX)"

cleanup() {
    rm -rf "${tmp_dir}"
    rm -f "${script_path}"
    exit
}

trap cleanup EXIT

curl -sS -o "${tmp_dir}/check-deps-0.sh" \
    "https://raw.githubusercontent.com/imtoopunkforyou/alias-wizard/refs/heads/main/scripts/check-deps-0.sh"
curl -sS -o "${tmp_dir}/conf-downloader-1.sh" \
    "https://raw.githubusercontent.com/imtoopunkforyou/alias-wizard/refs/heads/main/scripts/conf-downloader-1.sh"
curl -sS -o "${tmp_dir}/alias-setter-2.sh" \
    "https://raw.githubusercontent.com/imtoopunkforyou/alias-wizard/refs/heads/main/scripts/alias-setter-2.sh"

chmod +x "${tmp_dir}/"*.sh

(
    cd "${tmp_dir}"
    ./check-deps-0.sh
    ./conf-downloader-1.sh
    ./alias-setter-2.sh
)
