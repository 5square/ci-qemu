#-------------------------------------------------------------------------------
# Base Image Spec
#-------------------------------------------------------------------------------
ARG BASE_IMAGE=
ARG BASE_IMAGE_TAG=
ARG BASE_IMAGE_NAMESPACE=

FROM ${BASE_IMAGE_NAMESPACE}${BASE_IMAGE}:${BASE_IMAGE_TAG}

ENV QEMU_EXECVE 1

COPY image_files .

RUN [ "/usr/bin/qemu-arm-static", "/bin/sh", "-c", "ln -s /usr/bin/resin-xbuild /usr/bin/cross-build-start; ln -s /usr/bin/resin-xbuild /usr/bin/cross-build-end; ln /bin/sh /bin/sh.real" ]

#--------------------------------------------------------------------------------
# Labelling
#--------------------------------------------------------------------------------

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL de.5square.homesmarthome.build-date=$BUILD_DATE \
      de.5square.homesmarthome.name="${BASE_IMAGE_NAMESPACE}${BASE_IMAGE}" \
      de.5square.homesmarthome.description="MQTT Broker" \
      de.5square.homesmarthome.url="homesmarthome.5square.de" \
      de.5square.homesmarthome.vcs-ref=$VCS_REF \
      de.5square.homesmarthome.vcs-url="$VCS_URL" \
      de.5square.homesmarthome.vendor="5square" \
      de.5square.homesmarthome.version=$VERSION \
      de.5square.homesmarthome.schema-version="1.0"
