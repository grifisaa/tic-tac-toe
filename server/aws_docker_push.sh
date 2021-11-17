#!/bin/bash -e

if [ -z "$TRAVIS_PULL_REQUEST" ] || [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    if [ "$TRAVIS_BRANCH" == "develop" ] ; then
        # Build and push
        docker --version
        pip install --user awscli
        export PATH=$PATH:$HOME/.local/bin
        eval $(aws ecr get-login --no-include-email --region us-east-2)
        docker build -t "$LIVE_APP_NAME:latest" .
        docker tag "$LIVE_APP_NAME:latest" "$AWS_URL/$LIVE_APP_NAME:$TRAVIS_COMMIT"
        docker tag "$LIVE_APP_NAME:latest" "$AWS_URL/$LIVE_APP_NAME:latest"
        docker push "$AWS_URL/$LIVE_APP_NAME:$TRAVIS_COMMIT"
        docker push "$AWS_URL/$LIVE_APP_NAME:latest"
    fi
fi