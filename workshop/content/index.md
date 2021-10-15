<br/>
In this workshop environment you can get hands on with Tanzu products. Below is the list of scenario test cases you can try by selecting the scenario test case you want to test and then clicking `Start Workshop` at the bottom of the page to start the workshop.

-----------------------------------------------

## Operator

-----------------------------------------------

**SC01-TC01: Enable a vSphere Cluster for Kubernetes Workloads**

```execute
sh deploy.sh scenarios/operator/sc01-tc01.md
```

**SC01-TC02: Create and Configure a Supervisor Cluster Namespace(s) with RBAC**

```execute
sh deploy.sh scenarios/operator/sc01-tc02.md
```

**SC01-TC03: Create and Configure a Supervisor Cluster Namespace(s) with Resource Limitations**

```execute
sh deploy.sh scenarios/operator/sc01-tc03.md
```

**SC01-TC04: Supervisor Cluster Control Plane Access and Logging**

```execute
sh deploy.sh scenarios/operator/sc01-tc04.md
```

-----------------------------------------------

## Devops

-----------------------------------------------

**SC02-TC01: Provision a Tanzu Kubernetes Cluster Using the Tanzu Kubernetes Grid Service**

```execute
sh deploy.sh scenarios/devops/sc02-tc01.md
```

**SC02-TC02: Apply RBAC to a Tanzu Kubernetes Grid Cluster and Granting Developer Access**

```execute
sh deploy.sh scenarios/devops/sc02-tc02.md
```

**SC02-TC03: Use Pod Security Policies with a Tanzu Kubernetes Cluster(s)**

```execute
sh deploy.sh scenarios/devops/sc02-tc03.md
```

**SC02-TC06: Configure Guest Workload Cluster for Logging with Tanzu Extension of Fluentbit**

```execute
sh deploy.sh scenarios/devops/sc02-tc06.md
```

**SC02-TC07: CaaS control plane shall provide curated platform(JVM, NodeJS, Python, Go) images**

```execute
sh deploy.sh scenarios/devops/sc02-tc07.md
```

**SC02-TC08: CaaS control plane shall provide lifecycle management functions(create, modify, delete) for Service mesh**

```execute
sh deploy.sh scenarios/devops/sc02-tc08.md
```

**SC02-TC09: CaaS control plane shall provide support for canary releases - app with 2 versions**

```execute
sh deploy.sh scenarios/devops/sc02-tc09.md
```

**SC02-TC010: CaaS control plane shall provide tools to modify load balancer configuration(application timeout, http2 being default)**

```execute
sh deploy.sh scenarios/devops/sc02-tc10.md
```

**SC02-TC11: CaaS platform shall provide delegated DNS for applications hosted in kubernetes clusters**

```execute
sh deploy.sh scenarios/devops/sc02-tc11.md
```

**SC02-TC12: CaaS platform shall provide policies for controlling traffic inside the kubernetes network**

```execute
sh deploy.sh scenarios/devops/sc02-tc12.md
```

-----------------------------------------------
<br/>