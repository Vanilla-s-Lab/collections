FROM ghcr.io/vanilla-s-lab/busybox:0.1 as index-data

ADD https://github.com/zlib-searcher/index/releases/download/0.9.0/index_chinese.zip /root/
RUN ls -al /root && mkdir /index && /bin/unzip /root/index_chinese.zip -d /index

FROM ghcr.io/book-searcher-org/book-searcher:0.8.0
COPY --from=index-data /index /index
