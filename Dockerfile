FROM alpine:latest AS lockrun
RUN apk add gcc musl-dev \
    # && wget -O lockrun.c http://unixwiz.net/tools/lockrun.c \
    && wget -O lockrun.c https://github.com/libreofficedocker/lockrun.c/raw/main/lockrun.c \
    && gcc lockrun.c -o lockrun

FROM alpine:latest
COPY --from=lockrun /lockrun /usr/bin/lockrun
