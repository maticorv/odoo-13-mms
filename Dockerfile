FROM odoo:13

# Run as root
USER root
# Copy the requirements file to the container
COPY requirements.txt /tmp/

# Install the dependencies
RUN set -x; \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-pip \
        libsasl2-dev \
        libldap2-dev \
        git \
        libssl-dev && \
    pip3 install --upgrade pip && \
    pip3 install -r /tmp/requirements.txt && \
    apt-get remove -y \
        python3-pip \
        libsasl2-dev \
        libldap2-dev \
        git \
        libssl-dev && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
