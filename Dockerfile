FROM ubuntu:22.04 AS builder

RUN apt-get update && \
    apt-get install -y cmake g++ git  && \
    rm -rf /var/lib/apt/lists/* \

WORKDIR /app
COPY . .

RUN rm -rf build cmake-build-debag && \
    cmake -B build && \
    cmake --build build --target matrix_calculator

CMD ["./build/matrix_calculator"]