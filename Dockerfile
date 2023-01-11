FROM ghcr.io/vanilla-s-lab/busybox:0.1@sha256:ec08d71829e6b20137eeeec10fcfdd703e9ba6daa56cae856b73f3798eb77b25 as index-data

ADD https://github.com/zlib-searcher/index/releases/download/0.9.0/index_chinese.zip /root/
RUN ls -al /root && mkdir /index && /bin/unzip /root/index_chinese.zip -d /

FROM ghcr.io/book-searcher-org/book-searcher:0.8.0@sha256:ac6d5a88cfab8a5c896149123d48cef571388aa12a7d4f2b87147b81a56785f9
COPY --from=index-data /index /index
