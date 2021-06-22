# what will be the image on the bottom?
FROM ubuntu:18.04

# Port used is 5000
EXPOSE 5000

# set workdir
WORKDIR /usr/src/app/

# copy files
COPY . .

# install curl
RUN apt-get update && apt-get install -y curl

# load via curl: node
RUN curl -sL https:/deb.nodesource.com/setup_14.x | bash

# install nodejs
RUN apt install -y nodejs

# install npm
RUN npm install

# check them node related installations
RUN node -v && npm -v 

# create npm build 
RUN npm run build

# install npm dependency 'serve'
RUN npm install -g serve

# give directions to run the app
CMD ["serve", "-s", "-l", "5000", "build"]
