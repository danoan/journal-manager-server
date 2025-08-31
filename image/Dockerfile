FROM alpine:3.22.1

RUN apk add --update --no-cache \
bash \
python3 \
py3-pip \
nodejs \
npm \
entr \
gcc \
python3-dev \
pipx \
musl-dev

WORKDIR /journals

COPY scripts/init-stage/install-journal-manager /journals/scripts/init-stage/install-journal-manager

RUN python -m venv venv
ENV PATH="/journals/venv/bin:${PATH}"

ARG BUILD_MODE
COPY deploy-package /journals/deploy-package

COPY templates /journals/templates-temp/
ENV JOURNAL_MANAGER_CONFIG_FOLDER="/journals/.config/journal-manager"
RUN /journals/scripts/init-stage/install-journal-manager/install-journal-manager.sh $BUILD_MODE


COPY http-server/ /journals/http-server/
RUN cd http-server && npm install

COPY scripts/execution-stage /journals/scripts/execution-stage


# Fix file watcher on Mac (see: https://github.com/eradman/entr/issues/3)
ENV ENTR_INOTIFY_WORKAROUND 1 

# ENTRYPOINT ["scripts/execution-stage/monitor-files/monitor-files.sh"]
ENTRYPOINT ["scripts/execution-stage/start-script/start-script.sh"]

