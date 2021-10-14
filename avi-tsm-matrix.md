# NSX-LB(Avi) and TSM feature mapping

ID | Requirement Description | AVI UI | AKO/AMKO* | TSM | Persona |
--- | --- | --- | --- | --- | --- |
| RQ21 - 01 |  CaaS control plane shall provide support for canary releases - app with 2 versions | ** | ** | X | DevOps/Developer |
RQ25 - 01 | CaaS platform shall provide delegated DNS for applications hosted in kubernetes cluster | X | X | N/A | DevOps |
RQ26 - 01 | CaaS control plane shall provide GSLB features for applications hosted in kubernetes clusters | X | ** | N/A | DevOps |
RQ27 - 01 | CaaS control plane shall provide tools to modify load balancer configuration(application timeout, http2 being default) | X | --- | X | DevOps/Developer |
RQ28 - 01 | CaaS control plane shall provide L7 routing features based on user or http header information | X | --- | X | DevOps/Developer |
RQ29 - 01 | CaaS control plane shall provide end to end mutual TLS for application connectivity | N/A | N/A | X | DevOps/Developer |
RQ30 - 01 | CaaS control plane shall provide lifecycle management functions(create, modify, delete) for Service mesh | N/A | N/A | X | DevOps/Developer |
RQ31 - 01  | CaaS platform shall provide application connectivity across deployment technologies(VM, kubernetes clusters) | X | ** | ** | DevOps/Developer |
RQ32 - 01 | CaaS platform shall provide policies for controlling traffic inside the kubernetes network | N/A | N/A | N/A | DevOps/Developer |
RQ32 - 01 | CaaS platform shall provide necessary kubernetes primitives(CRDs, operators etc) for declaratively configure GSLB | N/A | ** | ** | DevOps/Developer |


** Coming Soon
