# Prerequisites

## Ensure the following prerequisites

* vSphere Administrator console and user credentials
* [Licensing for vSphere with Tanzu](https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-kubernetes/GUID-9A190942-BDB1-4A19-BA09-728820A716F2.html) ; vSAN Advanced only required if using vSAN
* [vSphere with Tanzu System Requirements and Topologies](https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-kubernetes/GUID-B1388E77-2EEC-41E2-8681-5AE549D50C77.html)
* [Create Storage Policies for vSphere with Tanzu](https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-kubernetes/GUID-544286A2-A403-4CA5-9C73-8EFF261545E7.html)
* [Configure vSphere with Tanzu to Use NSX-T Data Center](https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-kubernetes/GUID-8D0E905F-9ABB-4CFB-A206-C027F847FAAC.html)

## Working environments

TODO[fcarta] - clean up this summary and maybe make educates primary when its complete
Running the Tanzu Advanced POC scenarios / testcases can be done in a few different ways. If desired, you can run through the test cases from your local machine if the required CLIs are installed. If you do not want to install all the different CLIs, you can run the supplied DevOps container which comes prepackaged with all the CLIs. Finally this POC content comes with an educates workshop framework that allows you to run the testcases from a single portal.

### Local

* Must have the following installed:
  * *kubectl* cli
  * *kubectl-vsphere* cli plugin
  * *tanzu* cli
  * *tanzu plugins* cli
  * *tanzu extensions*
  * *carvel* toolset
  * *helm* cli
  * *kpack* cli
  * *istioctl* cli

### DevOps Container (Local Container)

* Must have the following installed:
  * *docker*
  * *kubectl* cli
  * *kubectl-vsphere* cli plugin
* Optional installation:
  * *make* installed
* Files:
  * [tanzu-advanced-poc.dockerfile](../../tanzu-advanced-poc.dockerfile)
  * [makefile](../../makefile)
  * [vauth.sh](../../vauth.sh)

#### Running DevOps Container

1. Build DevOps Container

    ```sh
    make build
    ```

2. Run DevOps Container

    ```sh
    make run
    ```

3. Connect to already running DevOps Container

    ```sh
    make join
    ```

4. Manually Start/Stop DevOps Container

    ```sh
    make start
    ```

    or

    ```sh
    make stop
    ```

#### DevOps Container authenticating to SC

  > NOTE: Have to run this outside of the container on cmd line of host running local machine. Issue seems to be with how the plugin connects to authenticate.

1. Authenticating as Administrator

    ```sh
    ./vauth.sh -u administrator@vsphere.local -p <b><i>ADMIN_PASSWORD</i></b -s https://<b><i>SC_API_VIP</i></b -n <b><i>SC_CLUSTER_NAMESPACE</i></b -c <b><i>SC_CLUSTER_NAME</i></b
    ```

2. Authenticating as DevOps Engineer

    ```sh
    ./vauth.sh -u ***DevOps_UserName***@vsphere.local -p <b><i>DEVOPS_PASSWORD</i></b -s https://<b><i>SC_API_VIP</i></b -n <b><i>SC_CLUSTER_NAMESPACE</i></b -c <b><i>SC_CLUSTER_NAME</i></b
    ```

### Educates Workshop

TODO[fcarta,ssamar]

---
