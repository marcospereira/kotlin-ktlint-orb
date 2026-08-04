FROM cimg/openjdk:25.0.4

COPY src/scripts/install.sh /install.sh

ENV KTLINT_VERBOSE_INSTALL=true
ENTRYPOINT [ "/install.sh" ]
