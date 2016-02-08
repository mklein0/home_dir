#!/bin/false

REPO_BASE_DIR=${HOME}/Repository/
function repo() {
    cd ${REPO_BASE_DIR}$@;
}

_repo() {

    local cur="$2"
    local basePath=${REPO_BASE_DIR}

    COMPREPLY=( $(compgen -d -- "$basePath$cur" | \
                  sed -e "s,^$basePath,," -e 's,$,/,' ) )

}; complete -F _repo -o nospace repo
