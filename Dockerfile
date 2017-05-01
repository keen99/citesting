FROM ubuntu:14.04

##make sure deb related stuff knows we cant interact!  why this isn't part of the default images...well...
ENV DEBIAN_FRONTEND noninteractive


RUN sudo pip install awscli

## use same packages we use from ansible - ish, since we dont enforce versions in either.





RUN touch "test-$(date)"
