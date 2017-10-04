FROM ubuntu:14.04

##make sure deb related stuff knows we cant interact!  why this isn't part of the default images...well...
ENV DEBIAN_FRONTEND noninteractive

RUN echo "$date" >  "/first-build-$(date)"


## no awscli, we dont do docker inside docker
#https://github.com/Shippable/support/issues/2945
#http://docs.shippable.com/tutorials/ci/hub-amazon-ecr-custom-ci-image/
#RUN apt-get update && apt-get install -y awscli
#no pip
#RUN sudo pip install awscli

## use same packages we use from ansible - ish, since we dont enforce versions in either.





RUN touch "test-$(date)"

RUN echo "$date" >  "/next-build-$(date)" && ls -l /*build*

ENV DEBIAN_FRONTEND teletype
