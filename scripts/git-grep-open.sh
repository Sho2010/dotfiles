#!/bin/bash

result=$(git grep --color=always pass | fzf --ansi)

${EDITOR} $(echo $result | cut -d: -f1)

