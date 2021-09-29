# Enable Workload Management

Enabling Workload Management in a vSphere cluster will provide Kubernetes ready infrastructure by providing a Cluster API control plane for self service to Guest/Workload Kubernetes clusters.

---

## Prerequisites

* vSphere Administrator console and user credentials

---

## Steps

1. Using the vSphere Administrator console and credentials, login to the VC Web UI.

2. Navigate to **Menu > Workload Management**; from the *Getting Started with Workload Management* drop-down, select the ***vCenter_Server_Name***; select **Enable**.

3. Verify Workload Management recognizes the *vSphere_Cluster_Name* as compatible. If not, revisit [vSphere with Tanzu System Requirements and Topologies](https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-kubernetes/GUID-B1388E77-2EEC-41E2-8681-5AE549D50C77.html) and address any issues preventing workload management compatibility.

4. Select the compatible ***vSphere_Cluster_Name***. Then, select **Next**.

5. For the Control Plane Size option, select **Small**. The, select **Next**.

6. Continue through both *Network* and *Storage* sections, populating all fields for integration with the test environment infrastructure. For additional guidance, reference: [Enable vSphere with Tanzu on a Cluster with NSX-T Data Center](https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-kubernetes/GUID-287138F0-1FFD-4774-BBB9-A1FAB932D1C4.html).

7. Verify that the *Review and Confirm* section reports successful completion of all sections for the planned SC configuration. Then, select **FINISH** to enable the SC.

8. If not automatically redirected, navigate to **Workload Management > Clusters** and periodically monitor the *Config Status* field for configuration updates.
    >Note: During the SC configuration process, disregard any vSphere Recent Tasks errors reporting `HTTP communication could not be complete with status 404` and Config Status errors reporting `Guest operation for the Master node VM with identifier vm-xxxx timed out`. These events represent attempts to contact the control-plane nodes while waiting on the API interface to transition online.

    This step is complete when the *Config Status* value transitions from `Configuring` to `Running`

9. Select the **radio button** to the left of the ***vSphere_Cluster_Name*** then select **EXPORT LOGS** and download the log bundle to a *local directory*.

10. Extract the downloaded log bundle and compressed files for each of the control-node VMs.

11. Explore sample contents in the extracted control-node VMs' directories such as log, command, and verify the manifest files are readable with a text editor.

12. Return to the VC WebUI and navigate to **Workload Management > Clusters**. Record the <i>`Control Plane Node IP Address`</i>. All test cases will reference this value as the <b><i>SC_API_VIP</i></b>>.