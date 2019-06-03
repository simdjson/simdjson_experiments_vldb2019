FROM gcc:9.1
COPY . /usr/src/
WORKDIR /usr/src/experiments/fast_flatten
RUN ./build.sh
CMD ["bash", "run.sh"]
