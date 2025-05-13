FROM ubuntu:latest

LABEL maintainer="eu4ng97@gmail.com"
LABEL version="0.1.0"
LABEL description=""

# 패키치 설치 및 업데이트
RUN apt-get update  \
    && apt-get install -y tzdata curl libicu-dev jq \
    && apt-get clean

ENV TZ=Asia/Seoul  \
    RUNNER_ALLOW_RUNASROOT=1  \
    GITHUB_ORGANIZATION=ORG

# 작업 디렉토리 설정
WORKDIR /actions-runner

# init.sh 파일 추가
COPY init.sh init.sh
RUN chmod +x init.sh

# runner 설치
RUN curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz  \
    && tar xzf ./actions-runner-linux-x64-2.323.0.tar.gz  \
    && rm -rf actions-runner-linux-x64-2.323.0.tar.gz

ENTRYPOINT [ "./init.sh" ]
