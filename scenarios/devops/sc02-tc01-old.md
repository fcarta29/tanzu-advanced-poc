# SC02-TC01: Provision a Tanzu Kubernetes Cluster Using the Tanzu Kubernetes Grid Service

A Tanzu Kubernetes cluster is a full distribution of the open-source Kubernetes software that is packaged, signed, and supported by VMware. In the context of vSphere with Kubernetes, DevOps Engineers can use the Tanzu Kubernetes Grid Service to provision Tanzu Kubernetes clusters on the Supervisor Cluster. They can invoke the Tanzu Kubernetes Grid Service API declaratively by using kubectl and a YAML definition. A Tanzu Kubernetes cluster resides in a Supervisor Namespace and DevOps and Developers can deploy workloads and services to Tanzu Kubernetes clusters using the same tools as they would with standard Kubernetes clusters.

---

## Test Case Summary

This test case procedure demonstrates a DevOps Engineer creating a Tanzu Kubernetes cluster in the SC namespace.  Next, it demonstrates the DevOps Engineer accessing the TKC cluster API, authenticating, and browsing API resources and default settings. Lastly, it demonstrates visibility into the TKC cluster from the perspective of the vSphere Administrator.

---

## Prerequisites

* Completion of [SC01-TC01](../operator/sc01-tc01.md), [SC01-TC02](../operator/sc01-tc02.md)
* vSphere Administrator console and user credentials
* DevOps Engineer console and user credentials
* VC content library subscribed/imported for TKC nodes images and synchronized

---

## Test Procedure

1. Using the vSphere Administrator console and credentials, login to the VC Web UI. Navigate to **Menu > Workload Management**. Select the **Clusters** tab then, select the ***vSphere_Cluster_Name*** hyperlink.

2. Select the **Configure** tab and under *Namespaces*, select **General**. In the *Content Library* section, select **Edit**. Then select the **radio button** next to the content library hosting the TKC node images. Select **OK** to save and close the window.

3. Using the **DevOps Engineer** console and credentials, login to the SC API. 

    <pre>kubectl vsphere login --vsphere-username ***DevOps_UserName***@vsphere.local --server=https://<b><i>SC_API_VIP</i></b>--insecure-skip-tls-verify</pre>

    Expected:
    <pre>Logged in successfully. <br> You have access to the following contexts: <br> <b><i>SC_API_VIP</i></b><br> ns01</pre> 

4. Set the context for the *ns01* namespace with the command

    ```execute
    kubectl config use-context ns01
    ```

5. Identify the vSphere storage-policy name, also the Kubernetes storage class name, by describing the namespace storage quota. Record the resource name, which is *`Storage_Resource_Name`*`.storageclass.storage.k8s.io/requests.storage`; omit the first "**`.`**" and everything to the right of it.

    ```execute
    kubectl describe resourcequota ns01-storagequota
    ```

6. List the virtual machine image class options with the command

    ```execute
    kubectl describe virtualmachineclasses
    ```

7. List the virtual machine images available in the content library with the command

    ```execute
    kubectl get virtualmachineimages
    ```

8. Describe the virtualmachineimage(s) to identify details such as the Kubernetes version and vSphere compatibility
    <pre>kubectl describe virtualmachineimage <i><b>VirtualMachine_Image_Name</b></i></pre>

9. Using a text-editor, open the *sc01/tkc01-mm-small.yaml* file. Update *`spec.distribution.version`* with the ***`VirtualMachine_Image_Name`*** identified in Step 7. Update *`spec.topology.controlPlane.storageClass`*, *`spec.topology.workers.storageClass`*, and *`spec.settings.storage.defaultClass`* with the ***`Storage_Resource_Name`*** identified in Step 5. 
Note: Enter the storage policy name in all lower-case. For example, "wrkldmgmt-storage-policy". 
Save and close the file.

    >Note: Only enter the latter portion of the `VirtualMachine_Image_Name` starting with "**`v`**" and everything to the right. For example, "*`v1.16.8---vmware.1-TKC.3.60d2ffd`*"

10. Apply the TanzuKubernetesCluster spec to the SC namespace, *ns01*

    ```execute
    kubectl apply -f sc01/tkc01-mm-small.yaml TODO[fcarta] - update link
    ```

11. Monitor the TKC cluster deployment progress with the following commands. This step is complete when the output from `kubectl get tanzukubernetesclusters tkc01-mm-small` reports *`PHASE`* as **`running`** and `kubectl describe tanzukubernetesclusters tkc01-mm-small` reports the *`Node Status`* for all nodes as *`ready`*.

    ```execute
    kubectl get tanzukubernetesclusters
    kubectl describe tanzukubernetescluster tkc01-mm-small 
    ```

12. Using the **DevOps Engineer** console and credentials, login to the TKC API. Reference the [Configuration Supplement](../supplements/client-configuration.md##-Login-to-a-Tanzu-Kubernetes-Cluster-as-a-vCenter-Single-Sign-On-User) for details on obtaining the CLI tools and command syntax.

13. Switch context to use the TKC context configuration

    ```execute
    kubectl config use-context tkc01-mm-small
    ```

14. Verify status of SC, Kubernetes master and URL with the command

    ```execute
    kubectl cluster-info
    ```

15. Verify status for all control-plane nodes and worker nodes

    ```execute
    kubectl get nodes
    ```

16. Review the available TKC API resources with the command

    ```execute
    kubectl api-resources
    ```

17. Review the available TKC API versions with the command

    ```execute
    kubectl api-versions
    ```

18. Run to verify all TKC pods report either “Running” or “Completed”

    ```execute
    kubectl get pods -A
    ```

19. Verify the default storage class is set to the vSphere storage policy with the command

    ```execute
    kubectl get sc
    ```

20. Review the default clusterRoleBindings with the following command. Identify the clusterrolebindings for `group:vsphere.local:administrators` and `group:`*`Domain_Name:DevOps_GroupName`* or if user-level permissions set on namespace, `user:`*`Domain_Name:DevOps_UserName`*

    ```execute
    kubectl get clusterrolebindings
    ```

21. View the associated `ClusterRole` and `Subject` for `group:vsphere.local:administrators` with the command

    ```execute
    kubectl describe clusterrolebinding vmware-system-auth-sync-wcp:ns01:group:vsphere.local:administrators
    ```

22. View the associated ClusterRole and Subject for `group:`*`Domain_Name:DevOps_GroupName`* or  `user:`*`Domain_Name:DevOps_UserName`* with the command
    <pre>kubectl describe clusterrolebinding vmware-system-auth-sync-wcp:ns01:<i><b>group:Domain_Name:DevOps_GroupName</b></i></pre> 
    >Note: If applying user-level permissions, in the above command replace <i><b>group:Domain_Name:DevOps_GroupName</b></i> with <i><b>user:Domain_Name:DevOps_UserName</b></i>

23. Using the vSphere Administrator console and credentials, login to the vCenter Web UI and navigate to **Menu > Workload Management**. Select the **Clusters** tab then, select the ***vSphere_Cluster_Name*** hyperlink. In the left pane, expand the **Namespaces** resource pool, then select the **ns01** namespace.

24. From the ns01 *Summary* view, verify *Tanzu Kubernetes* tile reports one (1) Tanzu Kubernetes Cluster, and one (1) healthy, control plane node

25. Select the **Compute** tab, expand **VMware Resources**, and select **Tanzu Kubernetes**. Review the summary information for tkc01-mm-small confirm *Phase* reports ***Running***

26. In the left pane, expand the **ns01** object and select the **tkc01-mm-small** resource pool

27. From tkc01-mm-small *Summary* view, expand **Resource Setting** to view *CPU* and *Memory* configuration

28. Select the **Monitor** tab > **Utilization** to view TKC cluster resources usage

29. Select the **VMs** tab to list all TKC cluster nodes and verify the *Status* reports ***Normal***

---
## Status Pass/Fail

* [  ] Pass
* [  ] Fail

Return to [Test Cases Inventory](../README.md###Test-Cases-Inventory)