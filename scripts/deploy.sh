#!/bin/bash

#Assignment of variables
project_dir=$(pwd)
SECONDS=0

#Installation and Configuration Glusterfs & Heketi Cluster
function deploy_cluster() {
    ansible-playbook $project_dir/cluster.yml -i inventory
    if [ $? -eq 0 ];
    then
        echo "Cluster installation was successful!"
        echo "---------------------------------"
    else
        echo "Installation failed!"
        exit 1
    fi
}

function main() {
    deploy_cluster
    echo "---------------------------------"
    echo "Time spent deploying Cassandra Cluster: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
}

main
