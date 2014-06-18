### Dockermized Newbler-2.9.0
## use the dockerfile/ubuntu base image provided by https://index.docker.io/u/dockerfile/ubuntu/
# The environment is ubuntu-14.04
FROM dockerfile/python

MAINTAINER David Weng weng@email.arizona.edu
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

## Step 1: Install the basic tools to set up the environment.
# Install the wget, gcc, make tools, handling the lib dependency problem.
RUN apt-get install -y wget
RUN apt-get install -y g++

## Step 2: Get the all the libs that needed for executing the newbler 
# Back to the /home/vagrant/ directory
RUN sudo apt-get install -y zlib1g libxi6 libxtst6 libxaw7
#RUN sudo apt-get install -y ia32-libs-multiarch
#RUN sudo apt-get install -y ia32-libs

## Step 3: Download the binary file.
# Make sure the working directory is Vagrant.
WORKDIR /home/vagrant
RUN wget http://454.com/downloads/DataAnalysis_2.9_All_20130530_1559.tgz
RUN tar xvzf DataAnalysis_2.9_All_20130530_1559.tgz
WORKDIR DataAnalysis_2.9_All

## Step 4: Make and Install Trinity
RUN sudo ./setup.sh

## Step 5: Add the executables directory to the Path.
#ENV PATH /home/vagrant/trinityrnaseq_r20140413:$PATH
#ENTRYPOINT ["/home/vagrant/trinityrnaseq_r20140413/Trinity"]
