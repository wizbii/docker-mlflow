FROM continuumio/miniconda3

WORKDIR /app

ENV HADOOP_HOME /app/hadoop-2.9.2
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

RUN mkdir /usr/share/man/man1/
RUN mkdir /data

RUN apt update -y
RUN apt install default-jdk-headless nano wget -y

RUN wget http://archive.apache.org/dist/hadoop/core/hadoop-2.9.2/hadoop-2.9.2.tar.gz
RUN tar -xvzf hadoop-2.9.2.tar.gz
RUN cp hadoop-2.9.2/lib/native/libhdfs.so hadoop-2.9.2/

SHELL ["/bin/bash", "--login", "-c"]

RUN conda create -n wizbii python=3.8.1
RUN conda init bash
RUN conda activate wizbii
RUN conda install -c conda-forge pyarrow mlflow scikit-learn=0.22.1 pandas