FROM alpine:stable AS lockrun
RUN apk add gcc musl-dev \
    ; cd /tmp \
    ; wget -O lockrun.c http://unixwiz.net/tools/lockrun.c \
    ; gcc lockrun.c -o lockrun

FROM alpine:stable
COPY --from=lockrun /tmp/lockrun /usr/bin/lockrun
