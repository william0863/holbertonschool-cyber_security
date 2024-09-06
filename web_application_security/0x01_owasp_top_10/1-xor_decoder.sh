#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 {xor_encoded_string}"
    exit 1
fi

encoded_string="${1#"{xor}"}"

if ! decoded_base64=$(echo "$encoded_string" | base64 --decode 2>/dev/null); then
    exit 1
fi

xor_key=95
decoded_password=""

for (( i=0; i<${#decoded_base64}; i++ )); do
    ascii_value=$(printf "%d" "'${decoded_base64:i:1}'")
    xor_char=$((ascii_value ^ xor_key))
    decoded_password+=$(printf "\\$(printf '%03o' "$xor_char")")
done

echo "$decoded_password"

