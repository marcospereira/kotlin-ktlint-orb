FROM cimg/openjdk:21.0.2

COPY src/scripts/install.sh /install.sh

ENV KTLINT_VERBOSE_INSTALL=true
ENTRYPOINT [ "/install.sh" ]
