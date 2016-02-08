#!/bin/bash

pushd $(dirname ${BASH_SOURCE[0]}) 1>/dev/null
repo_dir=$(pwd)
popd 1>/dev/null

base_dir=${repo_dir}/home
home_dir=${HOME}


# See base_dir is part of home dir, determine relative name
if [ "x${base_dir:0:${#home_dir}}" == "x${home_dir}" ]; then
    # absolute path includes home_dir, lets use relative pathing instead.
    # Remove home dir
    relative_dir=${base_dir:${#home_dir} + 1}
else
    relative_dir=${base_dir}
fi

# Setup symbolic links to repo versions of files and directories.
for i in ${base_dir}/*;
do
    bname=$(basename $i)

    if [ ! -e .$bname ]; then
        echo ln -s ${relative_dir}/${bname} ${home_dir}/.${bname}
        ln -s ${relative_dir}/${bname} ${home_dir}/.${bname}
    fi
done
