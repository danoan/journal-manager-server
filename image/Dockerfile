FROM alpine:3.14

RUN apk add --update --no-cache \
bash \
git \
python3 \
py3-pip \
nodejs \
npm \
entr \
gcc \
python3-dev \
musl-dev

WORKDIR /journals

COPY scripts/init-stage/install-journal-manager /journals/scripts/init-stage/install-journal-manager

ENV JOURNAL_MANAGER_CONFIG_FOLDER="/journals/.config/journal-manager"
RUN /journals/scripts/init-stage/install-journal-manager/install-journal-manager.sh


COPY http-server/ /journals/http-server/
RUN cd http-server && npm install

COPY scripts/execution-stage /journals/scripts/execution-stage


# Fix file watcher on Mac (see: https://github.com/eradman/entr/issues/3)
ENV ENTR_INOTIFY_WORKAROUND 1 

# ENTRYPOINT ["scripts/execution-stage/monitor-files/monitor-files.sh"]
ENTRYPOINT ["scripts/execution-stage/start-script/start-script.sh"]

