#!/usr/bin/env bash

set -e

diff --color -u <(for file in $(find ~/Documents/my_notes/web_designing -type f)
do
	sed -n "/^tags$/,/^title:/p" "${file}" | grep "^ - " | cut -d'"' -f 2
done | sort -u) <(basename -s .md tags/*.md | sort -u)
