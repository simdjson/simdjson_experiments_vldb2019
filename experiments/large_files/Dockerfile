FROM gcc:9.1
COPY . /usr/src/
WORKDIR /usr/src/experiments/large_files
RUN ./build.sh
CMD ["bash", "run.sh"]
