FROM ubuntu:20.04
COPY . /usr/src/
WORKDIR /usr/src/experiments/growing
RUN apt-get update -y 
RUN apt-get install -y make gcc g++ python2  python-is-python2
RUN /usr/src/experiments/growing/build.sh
CMD ["bash", "run.sh"]
