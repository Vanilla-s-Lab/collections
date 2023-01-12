FROM ghcr.io/vanilla-s-lab/busybox:0.1@sha256:ec08d71829e6b20137eeeec10fcfdd703e9ba6daa56cae856b73f3798eb77b25 as index-data

ADD https://github.com/zlib-searcher/index/releases/download/0.8.2/index_all_0.8.2.zip /root/
RUN ls -al /root && mkdir /index && /bin/unzip /root/index_all_0.8.2.zip -d /

FROM ghcr.io/book-searcher-org/book-searcher:0.8.2@sha256:11e0798c656af8482218756b79bd451fa51fa0c27882515bc556c9e9108ef0c1
COPY --from=index-data /index /index
