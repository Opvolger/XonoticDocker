# docker build -t opvolger/xonotic .
# docker run -i -p 26000:26000/udp -p 26000:26000/tcp --name xonotic opvolger/xonotic
FROM ubuntu:18.04 AS build

WORKDIR /xonotic
RUN apt-get update
RUN apt-get install wget unzip -y
RUN wget https://dl.xonotic.org/xonotic-0.8.2.zip
RUN unzip xonotic-0.8.2.zip -d .

FROM ubuntu:18.04 AS runtime

ENV hostname="Opvolgers Xonotic Server"

EXPOSE 26000

# Add the user UID:1000, GID:1000, home at /xonotic
RUN groupadd -r xonotic -g 1000 && useradd -u 1000 -r -g xonotic -m -d /xonotic -s /sbin/nologin -c "xonotic user" xonotic && \
    chmod 755 /xonotic
	
WORKDIR /xonotic
COPY --from=build /xonotic/Xonotic ./

USER xonotic

ENTRYPOINT ./xonotic-linux64-dedicated +set hostname 

