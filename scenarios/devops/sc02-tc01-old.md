# 1. Cluster creation

### Success Criteria: 
Cluster creation: When I envoke the workload cluster creation process via UI and/or CLI a new conformant Kubernetes cluster will be generated with my given parameters....cluster should have given params, cluster should be ready state and access granted,..

--------------

## Cluster Creation via kubectl-vSphere CLI plugin 

#### Connect to Supervisor Cluster via kubectl vSphere plugin cli

```execute
kubectl vsphere login --server=[server] --vsphere-username [username] --insecure-skip-tls-verify
```

Enter password #######

<<<<<<< HEAD
* Completion of [SC01-TC01](../operator/sc01-tc01.md), [SC01-TC02](../operator/sc01-tc02.md)
* vSphere Administrator console and user credentials
* DevOps Engineer console and user credentials
* VC content library subscribed/imported for TKC nodes images and synchronized
=======
```execute
kubectl config use-context [SUPERVISOR-CONTEXT-NAME-IP]
```
>>>>>>> d5667161e583d43c3f634433206e1d6e5c8f45a3

#### Get provisioned vSphere namespaces(Resource pools) on vSphere cluster. 
    
```execute
kubectl get namespace
```

Note:- You can also leverage namespace service to provision an new vSphere namespaces(Resoluce pools) on vSphere cluster. 

Connect to vSphere namespace 

```execute
kubectl config use-context [vSphere-namespace-name]
```

Now check the provisioned cluster and deploy a new TKG cluster in the namespace

```execute
kubectl get tkc
```

Run kubectl create to create a Tanzu Kubernetes cluster. Refer .yaml file for sample  configs

```
apiVersion: run.tanzu.vmware.com/v1alpha1
kind: TanzuKubernetesCluster
metadata:
  name: tkc-1
spec:
  distribution:
    version: v1.18
  topology:
    controlPlane:
      class: guaranteed-medium
      count: 1
      storageClass: vsan-default-storage-policy
    workers:
      class: guaranteed-xlarge
      count: 1
      storageClass: vsan-default-storage-policy
  settings:
    storage:
      classes: ["vsan-default-storage-policy"]              
      defaultClass: vsan-default-storage-policy                    
```

```execute
kubectl apply -f tkg.yaml -n [vSphere-namespace-name]
```

Check newly created cluster

```execute
kubectl get tkc
```

<!-- --------------

## Cluster Creation via Tanzu CLI  


[Install the Tanzu CLI and Other Tools](https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid/1.3/vmware-tanzu-kubernetes-grid-13/GUID-install-cli.html)

 Note :- On workshop environment(bootstrap machine) vSphere pliugin for kubectl is already installed

[Use the Tanzu CLI with a vSphere with Tanzu Supervisor Cluster](https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid/1.3/vmware-tanzu-kubernetes-grid-13/GUID-tanzu-k8s-clusters-connect-vsphere7.html)


#### Connect to Supervisor Cluster via kubectl vSphere plugin cli

    ```execute
    ```

    Enter password #######

    ```execute
    kubectl config use-context [SUPERVISOR-CONTEXT-NAME-IP]
    ```


Run the tanzu login command, passing in the KUBECONFIG_PATH value 
    
    ```execute
    tanzu login --kubeconfig ~/.kube/config
    ```

Set variables to define the storage classes, VM classes, service domain, namespace, and other required values with which to create your cluster. For information about all of the configuration parameters that you can set when deploying Tanzu Kubernetes clusters to vSphere with Tanzu, see Configuration Parameters for Provisioning Tanzu Kubernetes Clusters in the vSphere with Tanzu documentation. Include them in the cluster configuration file passed to the tanzu CLI --file option.


#### Create a Cluster

Determine the versioned Tanzu Kubernetes release (TKr) for the cluster. Obtain the list of TKr that are available in the supervisor cluster.

    ```execute
    tanzu kubernetes-release get 
    ```

    From the command output, record the desired value listed under NAME, for example v1.18.9---vmware.1-tkg.1.a87f261. The tkr NAME is the same as its VERSION but with + changed to ---.

Determine the namespace for the cluster. Obtain the list of namespaces.
        
    ```execute    
    kubectl get namespaces
    ```

    From the command output, record the namespace that includes the Supervisor cluster, for example test-gc-e2e-demo-ns. 
        
Decide on the cluster plan: dev, prod, or a custom plan.

Note:- You can customize or create cluster plans with files in the ~/.tanzu/tkg/providers/infrastructure-tkg-service-vsphere directory. See Configure Tanzu Kubernetes Plans and Clusters for details.



Run tanzu cluster create with the namespace and tkr NAME values above to create a Tanzu Kubernetes cluster. Refer vsphere.yaml file for sample cluster configs

    CONTROL_PLANE_VM_CLASS: guaranteed-small
    DEFAULT_STORAGE_CLASS: tanzu
    WORKER_STORAGE_CLASS: tanzu
    CONTROL_PLANE_STORAGE_CLASS: tanzu
    WORKER_VM_CLASS: guaranteed-small
    NAMESPACE: developer
    CLUSTER_PLAN: dev
    INFRASTRUCTURE_PROVIDER: tkg-service-vsphere
    SERVICE_DOMAIN: cluster.local

    ```execute

    tanzu cluster create my-cluster --tkr v1.18.5---vmware.1-tkg.1.c40d30d --file vsphere.yaml
    ```

Check and access newly created cluster
        
    ```execute
    tanzu cluster list
    ```

    ```execute
    tanzu cluster kubeconfig get my-cluster -n developer --admin
    ```

    ```execute

    kubectl config use-context my-cluster-admin@my-cluster
    ```
-------------------- -->

### [Add a Workload Cluster into Tanzu Mission Control Management](https://docs.vmware.com/en/VMware-Tanzu-Mission-Control/services/tanzumc-using/GUID-78908829-CB4E-459F-AA81-BEA415EC9A11.html)

--------------------


## Cluster creation via TMC - wizard based

Use VMware Tanzu Mission Control to provision the necessary resources and create a new Tanzu Kubernetes cluster. 

[TMC cluster provisioning in vSphere with Tanzu](https://docs.vmware.com/en/VMware-Tanzu-Mission-Control/services/tanzumc-using/GUID-0A1AEC6A-3E5C-424F-8EBC-1DDFC14D2688.html) 


## View/Access provisioned clusters

#### [Relaxing Pod Security in a Provisioned Cluster](https://docs.vmware.com/en/VMware-Tanzu-Mission-Control/services/tanzumc-using/GUID-CE452A50-44A6-48E7-B4F6-866BA2161614.html)

Apply a less restrictive pod security policy to a provisioned cluster to allow for privileged pods. To keep your provisioned clusters secure by default a restrictive pod security policy that prevents the use of privileged options in your containers is applied, such as running a container as root or using privileged mode.

To enable privileged mode for an entire cluster, bind the privileged role to the group containing all authenticated users.

    ```execute
    kubectl create clusterrolebinding default-tkg-admin-privileged-binding --clusterrole=psp:vmware-system-privileged --group=system:authenticated
    ```execute


#### Now you are ready to deploy/test a worload on cluster.

------------------