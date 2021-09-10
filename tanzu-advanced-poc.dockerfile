FROM harbor.tanzu.frankcarta.com/builders/tanzu-globals-se-devops:latest
LABEL maintainer="Frank Carta <fcarta@vmware.com>"

ENV KUBECTL_VERSION=v1.19.6
ENV ARGOCD_CLI_VERSION=v1.7.7
ENV ARGOCD_VERSION=v2.0.1
ENV KPACK_VERSION=0.3.0
ENV ISTIO_VERSION=1.7.4
ENV TKN_VERSION=0.17.2
ENV KPDEMO_VERSION=v0.3.0
ENV TANZU_CLI_VERSION=v1.3.1

# Leave Container Running for SSH Access - SHOULD REMOVE
ENTRYPOINT ["tail", "-f", "/dev/null"]

