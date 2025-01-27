#!/usr/bin/env sh

CUR_ROOT="$(cd "$( dirname "$0" )" >/dev/null && pwd)"
cd "${CUR_ROOT}"

# Create docker image
TAG="{{ user.GITHUB }}/{{ vcs.GITHUB }}"
docker build --tag=$TAG .
docker push $TAG