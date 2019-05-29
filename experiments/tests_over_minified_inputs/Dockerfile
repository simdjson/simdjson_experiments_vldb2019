FROM gcc:9.1
COPY . /usr/src/
WORKDIR /usr/src/experiments/tests_over_minified_inputs
RUN ./build.sh
CMD ["bash", "parser.sh"]
