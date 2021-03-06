FROM alpine:3.8

RUN apk add --no-cache python3 make automake gcc g++ subversion python3-dev git && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache && \
    pip install twint && \
    pip install --upgrade -e git+https://github.com/twintproject/twint.git@origin/master#egg=twint
