FROM cimg/openjdk:17.0.11

COPY src/scripts/install.sh /install.sh

ENV KTLINT_VERBOSE_INSTALL=true
ENTRYPOINT [ "/install.sh" ]
