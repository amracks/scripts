ssh -D 60001 \
    -L 8090:10.116.11.1:80 \
    -L 25565:localhost:25565 \
    -L 9050:localhost:9050 \
    ridge.amrx.net
