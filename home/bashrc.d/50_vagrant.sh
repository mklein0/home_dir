#!/usr/bin/false

VAGRANT_DIR=${GIT_REPOS_HOME}vagrant

function _vchk() {
	vagrant status $1 2>&1  | \
		perl -ne 'BEGIN { $status=0; } if (/\brunning\b/) { $status=1; } END { exit $status; }'
		# 1 - if vm running, otherwise 0
	return $?
}


function vssh() {
	local	vm_name=default

	pushd ${VAGRANT_DIR}
	if [[ -n "$1" && "$1" != "--" ]]; then
		vm_name=$1
	else
		# vm_name == (ALL)
		vm_name=
	fi
	if _vchk ${vm_name}; then
		# Need to start vagrant
		vagrant up ${vm_name}
	fi
	vagrant ssh $@
	popd
}

function vhalt() {
	local	vm_name=default

	pushd ${VAGRANT_DIR}
	if [[ -n "$1" && "$1" != "--" ]]; then
		vm_name=$1
	else
		# vm_name == (ALL)
		vm_name=
	fi

	if ! _vchk ${vm_name}; then
		# Need to stop vagrant
		vagrant halt ${vm_name}
	fi
	popd
}
