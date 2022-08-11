# Node.js
ARG NODE_VERSION=16.14.2
FROM reactnativecommunity/react-native-android
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN $GITHUB_TOKEN
ENV NODE_VERSION=16.15.1

# SHELL ["/bin/bash", "--login", "-i", "-c"]
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
# RUN source /root/.bashrc && nvm install $NODE_VERSION && nvm use $NODE_VERSION && corepack enable
# RUN yarn global add  detox-cli
# SHELL ["/bin/bash", "--login", "-c"]

COPY . /usr/src/app
WORKDIR /usr/src/app
# ARG IMAGE="system-images;android-31;default;x86_64"
# RUN sdkmanager --install "${IMAGE}"
# RUN cd android && bundle install
CMD ["node", "-v"]