=================================
DOCKER IMAGE FOR BUGGENIE TESTING
=================================

This docker image, is meant to be used for allowing to test buggenie development.

Original source code:
* https://github.com/thebuggenie/thebuggenie

=====
BUILD
=====

.. highlight:: bash
    $ docker build efestolab/buggenie .


===
RUN
===

.. highlight:: bash
    $ docker run -p 80:80 -v /opt/buggenie:/efesto/buggenie efestolab/buggenie

