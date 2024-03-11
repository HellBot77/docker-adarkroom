FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/doublespeakgames/adarkroom.git && \
    cd adarkroom && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM lipanski/docker-static-website

COPY --from=base /git/adarkroom .
