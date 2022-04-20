FROM python:3.7.13-slim-bullseye
#checkov:skip=CKV_DOCKER_9:Accepted risk of using APT
RUN apt update && \
    apt-get install python3-dev python3-pip libssl-dev sudo curl \
        -y --no-install-recommends
RUN pip install opencanary && \
    pip uninstall markupsafe -y && \
    pip install -Iv markupsafe==2.0.1
RUN useradd -ms /bin/bash canary && \
    echo 'canary  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
COPY ./opencanary.conf /etc/opencanaryd/opencanary.conf
COPY ./customLogin /usr/local/lib/python3.7/site-packages/opencanary/modules/data/http/skin/customLogin
HEALTHCHECK --interval=30s --retries=3 --start-period=30s --timeout=3s \
    CMD curl --fail http://localhost || exit 1
USER canary
ENTRYPOINT /usr/local/bin/opencanaryd --start && /bin/bash
