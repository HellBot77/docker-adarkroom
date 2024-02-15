FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/doublespeakgames/adarkroom.git && \
    cd adarkroom && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM pierrezemb/gostatic

COPY --from=base /git/adarkroom /srv/http
EXPOSE 8043
