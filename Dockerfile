FROM ghcr.io/vanilla-s-lab/busybox-static:0.1@sha256:e213690b36bed5c16b4483eb0bd5a8f9f14785f24148e61fc0090c4c24ba0079 as index-data

# https://github.com/zlib-searcher/index/releases
# https://developers.cloudflare.com/web3/how-to/use-ipfs-gateway/
ENV cid="bafybeifkxsjvacd4ldgonjqergjlgtkr3tad23vvuxfu5yhcqcfu2kpemq"

ADD https://cloudflare-ipfs.com/ipfs/${cid}/index_0.8.2_20230113.zip /root/
RUN ls -al /root && mkdir /index && /bin/unzip /root/index_0.8.2_20230113.zip -d /

FROM ghcr.io/book-searcher-org/book-searcher:0.8.2@sha256:11e0798c656af8482218756b79bd451fa51fa0c27882515bc556c9e9108ef0c1
COPY --from=index-data /index /index
