FROM softartdev/android-fastlane
# Node.js
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN $GITHUB_TOKEN
ENV NODE_VERSION=v16.13.2

SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
RUN source /root/.bashrc && nvm install $NODE_VERSION && nvm use $NODE_VERSION && corepack enable && git config --global url."git@github.com:".insteadOf "https://github.com/"
RUN yarn global add react-native-cli
SHELL ["/bin/bash", "--login", "-c"]

COPY . /usr/src/app
WORKDIR /usr/src/app
RUN cd android && bundle install
CMD ["echo", "Docker image with fastlane, nvm, node and react-native-cli"]
