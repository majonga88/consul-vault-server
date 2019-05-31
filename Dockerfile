FROM alpine:3.7

ENV VAULT_VERSION=1.1.2 \
  CONSUL_VERSION=1.5.1

RUN apk --no-cache add \
          bash \
          ca-certificates \
          wget \
  && wget -O /tmp/vault.zip "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" \
  && unzip -d /bin /tmp/vault.zip \
  && chmod 755 /bin/vault \
  && rm /tmp/vault.zip \
  && wget -O /tmp/consul.zip "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" \
  && unzip -d /bin /tmp/consul.zip \
  && chmod 755 /bin/consul \
  && rm /tmp/consul.zip \
  && rm -rf /var/lib/apt/lists/*

VOLUME "/mnt/data"
CMD ["/bin/bash"]
