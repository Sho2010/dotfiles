#!/bin/bash

# This script provides functions to compare two YAML files by converting them to sorted JSON and running the diff command.

convert_yaml_to_sorted_json() {
  input_file=$1

  yq e -o=json "$input_file" | jq --sort-keys
}

diff_sorted_yaml() {
  if [[ $# -lt 2 ]]; then
    echo "Usage: diff_sorted_yaml_files <file1.yaml> <file2.yaml> [diff_options]"
    return 1
  fi

  file1=$1
  file2=$2
  diff_options=${3:-} # Set the third argument as diff_options or use an empty string if not provided

  # Convert and sort YAML files
  sorted_json1=$(convert_yaml_to_sorted_json "$file1")
  sorted_json2=$(convert_yaml_to_sorted_json "$file2")

  # Save sorted JSON to temporary files
  temp_json1=$(mktemp)
  temp_json2=$(mktemp)
  echo "$sorted_json1" > "$temp_json1"
  echo "$sorted_json2" > "$temp_json2"

  # Run diff command with provided options
  diff $diff_options "$temp_json1" "$temp_json2"

  # Clean up temporary files
  rm "$temp_json1" "$temp_json2"
}

diff_sorted_yaml "$@"
