FROM alpine:3.6

# Install kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl

ENV HOME /

RUN set -x && \
    apk add --no-cache curl ca-certificates wget python git bash && \
    chmod +x /usr/local/bin/kubectl && \
    \
    # Create non-root user (with a randomly chosen UID/GUI).
    adduser kubectl -Du 2342 -h /config && \
    \
    # Basic check it works.
    kubectl version --client

# Install Helm
ENV HELM_VERSION v2.4.2
ENV FILENAME helm-${HELM_VERSION}-linux-amd64.tar.gz
ADD https://kubernetes-helm.storage.googleapis.com/${FILENAME} /tmp
RUN if [ -f /tmp/${FILENAME} ]; then tar zxvf -C /tmp ${FILENAME}; fi \
    && mv /tmp/linux-amd64/helm /usr/local/bin/helm \
    && rm -rf /tmp

RUN helm init --client-only
