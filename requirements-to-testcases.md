### Requirements to Test Cases
ID | Requirement Description | Test Case ID(s) | Complete |
--- | --- | --- | --- |
RQ01&#8239;-&#8239;01 | CaaS control plane shall provide tools to support multiple tenants/clients | [SC01-TC02](scenarios/operator/sc01-tc02.md) | |
RQ02&#8239;-&#8239;01 | CaaS platform shall provide automation/tools/API for governing the configuration of the clusters | [SC01-TC02](scenarios/operator/sc01-tc02.md) , [SC01-TC03](scenarios/operator/sc01-tc03.md) | |
RQ03&#8239;-&#8239;01 | CaaS platform shall integrate with SSO solution available in charter | vCenter Overview , [SC01-TC02](scenarios/operator/sc01-tc02.md), TMC Overview | |
RQ03&#8239;-&#8239;02 | CaaS platform shall provide role based access control by integrating with identity system(Active directory) in charter | vCenter Overview , [SC01-TC02](scenarios/operator/sc01-tc02.md) | |
RQ04&#8239;-&#8239;01 | CaaS control plane shall provide automation/tools/API for onboarding existing kubernetes clusters | [SC01-TC05](scenerios/operator/sc01-tc05.md) | |
RQ05&#8239;-&#8239;01 | CaaS platform shall provide automation/tools/API for auditing/validating the configuration of the clusters | T[SC01-TC05](scenerios/operator/sc01-tc06.md) | |
RQ06&#8239;-&#8239;01 | CaaS control plane shall provide tools for accessing the underlying virtual machines that power the kubernetes clusters in a secure way | [SC01-TC04](scenarios/operator/sc01-tc04.md) | |
RQ07&#8239;-&#8239;01 | CaaS control plane shall provide automation/tools/API for creation of kubernetes clusters | [SC02-TC01](scenarios/devops/sc02-tc01.md) | |
RQ08&#8239;-&#8239;01 | CaaS control plane shall provide automation/tools/API for modifying the kubernetes clusters | [SC02-TC04](scenarios/devops/sc02-tc04.md) | |
RQ09&#8239;-&#8239;01 | CaaS control plane shall provide automation/tools/API for deleting the kubernetes clusters | [SC02-TC05](scenarios/devops/sc02-tc05.md) | |
RQ10&#8239;-&#8239;01 | CaaS platform shall provide capabilities to create manage clusters in various cloud providers (AWS in particular) | TMC Overview | |
RQ11&#8239;-&#8239;01 | CaaS platform shall provide the role based access control for kubernetes clusters as well | [SC02-TC02](scenarios/devops/sc02-tc02.md) | |
RQ12&#8239;-&#8239;01 | CaaS platform shall provide necessary kubernetes primitives (CRDs, operators etc) for declaratively configure ingress/load balancer | TODO[] | |
RQ13&#8239;-&#8239;01 | CaaS control plane shall support integration to log aggregators(Splunk) | [SC01-TC04](scenarios/operator/sc01-tc04.md), [SC02-TC06](scenarios/devops/sc02-tc06.md) | |
RQ14&#8239;-&#8239;01 | CaaS control plane shall provide tools for monitoring the infrastructure(virtual machines, pods, containers, ingress) of the kubernetes clusters | TO Oveview [dbott] | |
RQ15&#8239;-&#8239;01 | CaaS control plane shall alert based on thresholds | TO Oveview [dbott] | |
RQ16&#8239;-&#8239;01 | CaaS control plane shall support integration to Charter situation manager(MoogSoft) | TO Oveview [dbott] | |
RQ17&#8239;-&#8239;01 | CaaS platform shall provide monitoring dashboards for operators | TO Oveview [dbott] | |
RQ18&#8239;-&#8239;01 | CaaS platform shall provide monitoring dashboards for developers | TO Oveview [dbott] | |
RQ19&#8239;-&#8239;01 | CaaS platform shall provide options to create modify dashboards | TO Oveview [dbott] | |
RQ20&#8239;-&#8239;01 | CaaS control plane shall provide curated platform(JVM, NodeJS, Python, Go) images | [SC02-TC07](scenarios/devops/sc02-tc07.md) | |
RQ21&#8239;-&#8239;01 | CaaS control plane shall provide support for canary releases - app with 2 versions | [SC02-TC09](scenarios/devops/sc02-tc09.md) | |
RQ22&#8239;-&#8239;01 | CaaS platform shall provide tools to monitor load balancer/ ingress of the applications deployed in kubernetes clusters | TO Oveview [dbott] | |
RQ23&#8239;-&#8239;01 | CaaS control plane shall provide tools for collecting metrics from application level objects(JVM, application traces) | TO Oveview [dbott] | |
RQ24&#8239;-&#8239;01 | CaaS control plane shall provide tools for provisioning load balancers/ingress for the kubernetes clusters |  | |
RQ25&#8239;-&#8239;01 | CaaS platform shall provide delegated DNS for applications hosted in kubernetes clusters | [SC02-TC11](scenarios/devops/sc02-tc11.md) | |
RQ26&#8239;-&#8239;01 | CaaS control plane shall provide GSLB features for applications hosted in kubernetes clusters |  | |
RQ27&#8239;-&#8239;01 | CaaS control plane shall provide tools to modify load balancer configuration(application timeout, http2 being default) | [SC02-TC10](scenarios/devops/sc02-tc10.md) | |
RQ28&#8239;-&#8239;01 | CaaS control plane shall provide L7 routing features based on user or http header information | [SC02-TC10](scenarios/devops/sc02-tc10.md) | |
RQ29&#8239;-&#8239;01 | CaaS control plane shall provide end to end mutual TLS for application connectivity |  | |
RQ30&#8239;-&#8239;01 | CaaS control plane shall provide lifecycle management functions(create, modify, delete) for Service mesh | [SC02-TC08](scenarios/devops/sc02-tc08.md) | |
RQ31&#8239;-&#8239;01 | CaaS platform shall provide application connectivity across deployment technologies(VM, kubernetes clusters |  | |
RQ32&#8239;-&#8239;01 | CaaS platform shall provide policies for controlling traffic inside the kubernetes network | [Antrea](https://antrea.io/), [Kubernetes Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/) | |
RQ33&#8239;-&#8239;01 | CaaS platform shall provide necessary kubernetes primitives(CRDs, operators etc) for declaratively configure GSLB |  | |
