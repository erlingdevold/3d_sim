# FROM ubuntu:22.04

FROM rust:latest
RUN apt-get update && apt-get -y install cmake 
RUN apt-get install -y x11-apps

RUN apt-get install -y libsdl2-dev

WORKDIR /app

# COPY . . 
COPY Cargo.toml . 
COPY Cargo.lock . 
COPY src ./src

RUN cargo build

COPY entry_saturn.sh .
COPY monox ./monox 
COPY saturn ./saturn
ENTRYPOINT ["./entry_saturn.sh"]