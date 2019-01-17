FROM docker:18

RUN apk add --no-cache nodejs nodejs-npm

WORKDIR /workdir

COPY package.json /workdir

RUN npm install 
COPY cli.js /workdir
COPY index.js /workdir

RUN npm run-script pretest
RUN npm run-script test

entrypoint ["/workdir/cli.js"]





