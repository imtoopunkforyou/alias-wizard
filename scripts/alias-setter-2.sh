#!/bin/bash

yaml_file="./aliases.yaml"
output_dir="${HOME}/Alias-wizard"
output_file="${output_dir}/.alias-wizard"

mkdir -p "${output_dir}"
> "${output_file}"

yq e 'keys | .[]' "${yaml_file}" | while read -r key; do
    command=$(yq e ".${key}.command" "${yaml_file}")
    echo "alias ${key}=\"${command}\"" >> "${output_file}"
done


echo "Generated ${output_file}"
echo "To start using aliases, add to your shell config:"
echo -e "\033[33msource ${output_file}\033[0m"
echo -e "✅ Success!"
