#!/usr/bin/false

REPOS_HOME=${HOME}/Repositories/
GIT_REPOS_HOME=${REPOS_HOME}/git/
HG_REPOS_HOME=${REPOS_HOME}/hg/
SVN_REPOS_HOME=${REPOS_HOME}/svn/

function repo() {
	if [ -z "${PUSHD}" ]; then
		cd ${REPOS_HOME}$@;
	else
		pushd ${REPOS_HOME}$@;
	fi
}

function repo_git() {
	if [ -z "${PUSHD}" ]; then
		cd ${GIT_REPOS_HOME}$@;
	else
		pushd ${GIT_REPOS_HOME}$@;
	fi
}

_repo_home_comp() {
    local cur="$2"
    local basePath=$1

    COMPREPLY=( $(compgen -d -- "$basePath$cur" | sed -e "s,^$basePath,," -e 's,$,/,' ) )
}

_repo() {
	_repo_home_comp $REPOS_HOME "$2"
}
_repo_git() {
	_repo_home_comp $GIT_REPOS_HOME "$2"
}

complete -F _repo -o nospace repo
complete -F _repo_git -o nospace repo_git
