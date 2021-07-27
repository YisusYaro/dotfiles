#!/bin/bash

while true; do
    open=$(ls ~/Projects --group-directories-first --file-type | dmenu "$@")
    if [[ -d "$open" ]]; then
        cd "$open"
    else
        if [[ "$open" != "" ]]; then
            code ~/Projects/${open}
        fi
        exit 0
    fi
done
