FROM gcc:9.1
COPY . /usr/src/
WORKDIR /usr/src/experiments/time_distribution
RUN ./build.sh
CMD ["bash", "run.sh"]
