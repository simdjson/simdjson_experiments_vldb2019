FROM gcc:9.1
COPY . /usr/src/
WORKDIR /usr/src/experiments/minified_inputs
RUN ./build.sh
CMD ["bash", "run.sh"]
