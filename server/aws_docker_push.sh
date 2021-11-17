#!/bin/bash -e

aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 565338450378.dkr.ecr.us-east-2.amazonaws.com
docker tag tictactoe:latest 565338450378.dkr.ecr.us-east-2.amazonaws.com/tictactoe:latest
docker push 565338450378.dkr.ecr.us-east-2.amazonaws.com/tictactoe:latest