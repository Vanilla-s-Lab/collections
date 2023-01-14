FROM ghcr.io/vanilla-s-lab/busybox-static:0.1@sha256:e213690b36bed5c16b4483eb0bd5a8f9f14785f24148e61fc0090c4c24ba0079 as index-data

# https://github.com/zlib-searcher/index/releases
# https://developers.cloudflare.com/web3/how-to/use-ipfs-gateway/
ENV cid="bafybeigbxhuaytlhrqti6qxv4onzphe5uvylre3w62b24gcftpumjywecu"

ADD https://cloudflare-ipfs.com/ipfs/${cid}/index_zstd_0.8.3.zip /root/
RUN ls -al /root && mkdir /index && /bin/unzip /root/index_zstd_0.8.3.zip -d /

FROM ghcr.io/book-searcher-org/book-searcher:0.8.3@sha256:a90e13a5f52aaa2b2894c5b92fb91dceb8434f8634677a0db856eaedb0d0e7a4
COPY --from=index-data /index /index
