#!/bin/false

REPO_BASE_DIR2=${HOME}/Repository/git/vagrant/

function repo2() {
    cd ${REPO_BASE_DIR2}$@;
}

_repo2() {

    local cur="$2"
    local basePath=${REPO_BASE_DIR2}

    COMPREPLY=( $(compgen -d -- "$basePath$cur" | \
                  sed -e "s,^$basePath,," -e 's,$,/,' ) )

}; complete -F _repo2 -o nospace repo2
