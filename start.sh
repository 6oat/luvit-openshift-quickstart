#!/bin/sh

LUVIT_VERSION="0.4.0"

cd $OPENSHIFT_DATA_DIR

if [ -d "luvit" ] && [ "`cat luvit/VERSION`" == $LUVIT_VERSION ]; then

  echo "Luvit $LUVIT_VERSION already installed"

else

  echo "Installing Luvit ${LUVIT_VERSION}"

  if [ -d "luvit" ]; then
    rm -rf luvit
  fi

  curl -o luvit.tar.gz "https://raw.github.com/luvit/luvit-releases/master/${LUVIT_VERSION}/luvit-${LUVIT_VERSION}.tar.gz"

  tar -xf luvit.tar.gz
  rm luvit.tar.gz

  cd luvit-${LUVIT_VERSION}

  ./configure --prefix=${OPENSHIFT_DATA_DIR}luvit
  make
  make install

  cd ..

  echo $LUVIT_VERSION > luvit/VERSION

  rm -rf luvit-${LUVIT_VERSION}

fi

PATH="${OPENSHIFT_DATA_DIR}luvit/bin:$PATH"

cd $OPENSHIFT_REPO_DIR

CMD="luvit server.lua"

nohup $CMD > $OPENSHIFT_LOG_DIR/luvit.log 2>&1 &

echo $! > ${OPENSHIFT_RUNTIME_DIR}luvit.pid