FROM grafana/grafana:latest

# install https://github.com/noqcks/gucci (CLI templating)
USER root
RUN export VERSION=1.2.2 && cd /tmp && \
    wget -q https://github.com/noqcks/gucci/releases/download/${VERSION}/gucci-v${VERSION}-linux-amd64 && \
    chmod +x gucci-v${VERSION}-linux-amd64 && \
    mv gucci-v${VERSION}-linux-amd64 /usr/local/bin/gucci
USER grafana

ENV GF_SECURITY_ADMIN_PASSWORD $INITIAL_ADMIN_PASSWORD
COPY datasource.tpl.yaml /tmp/datasource.tpl.yaml

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["gucci /tmp/datasource.tpl.yaml > /etc/grafana/provisioning/datasources/loki.yml && /run.sh"]
