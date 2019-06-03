FROM gcc:9.1
COPY . /usr/src/
WORKDIR /usr/src/experiments/vectorized_classification
RUN ./build.sh
CMD ["bash", "run.sh"]
