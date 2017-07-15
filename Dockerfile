FROM alpine:3.6

ARG kubectl_version=v1.6.4
ARG helm_version=v2.4.2

# Install kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/${kubectl_version}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN set -x && \
    apk add --no-cache \
        curl \
        ca-certificates \
        wget \
        python \
        git \
        bash \
        openssh-client && \
    \
    chmod +x /usr/local/bin/kubectl && \
    \
    # Create non-root user (with a randomly chosen UID/GUI).
    adduser kubectl -Du 2342 -h /config && \
    \
    # Basic check it works.
    kubectl version --client

# Install Helm
ENV FILENAME helm-${helm_version}-linux-amd64.tar.gz
ADD https://kubernetes-helm.storage.googleapis.com/${FILENAME} /tmp
RUN if [ -f /tmp/${FILENAME} ]; then tar zxvf -C /tmp ${FILENAME}; fi \
    && mv /tmp/linux-amd64/helm /usr/local/bin/helm \
    && rm -rf /tmp

RUN helm init --client-only

# Add github to known hosts
RUN ssh-keyscan github.com | tee /etc/ssh/ssh_known_hosts

ENV HOME /home/helm
WORKDIR /home/helm
