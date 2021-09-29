#!/bin/bash
username=''
password=''
server=''
namespace=''
cluster=''

trap 'catch' ERR

print_usage() {
   # Display Help
   echo
   echo "The vauth application will authenticate to a VMware vCenter Supervisor Cluster for the DevOps container."
   echo
   echo "Syntax: reauth [-u|p|n|c]"
   echo "options:"
   echo "u     Supervisor Cluster username"
   echo "p     Supervisor Cluster password"
   echo "s     Supervisor Cluster server"
   echo "n     Supervisor Cluster namespace"
   echo "c     Workload Cluster name"
   echo
}

catch() {
  # Make sure when authentication fails to clean up
  unset KUBECTL_VSPHERE_PASSWORD
  cp ~/.kube/config-tmp ~/.kube/config
}

while getopts 'u:p:s:n:c:' flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        p) password=${OPTARG};;
        s) server=${OPTARG};;
        n) namespace=${OPTARG};;
        c) cluster=${OPTARG};;
        *) # Invalid option
         echo "Error: Invalid option"
         print_usage
         exit;;
    esac
done

if [ -z "$username" ] ; then
        echo 'Missing -u <username>' >&2
        print_usage
        exit 1
fi

if [ -z "$password" ] ; then
        echo 'Missing -p <password>' >&2
        print_usage
        exit 1
fi

if [ -z "$server" ]; then
        echo 'Missing -s or <server>' >&2
        print_usage
        exit 1
fi
_cmd="kubectl vsphere login --vsphere-username $username --server=$server --insecure-skip-tls-verify"

if [ ! -z "$namespace" ]; then
    _cmd+=" --tanzu-kubernetes-cluster-namespace $namespace"
fi

if [ ! -z "$cluster" ]; then
    _cmd+=" --tanzu-kubernetes-cluster-name $cluster"
fi

eval "mv ~/.kube/config ~/.kube/config-tmp \
    && export KUBECTL_VSPHERE_PASSWORD='$password' \
    && $_cmd \
    && unset KUBECTL_VSPHERE_PASSWORD \
    && cp ~/.kube/config ./config/kube.conf \
    && cp ~/.kube/config-tmp ~/.kube/config"







