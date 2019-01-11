echo "====== Building Docker Images ======"
# if you're having trouble try using --no-cache
docker-compose build --no-cache
#docker-compose build

echo "====== Cloning sakaiproject/sakai ======"
# Select the fork/branch you wish to clone. Defaults to master.
#git clone -b 11.x https://github.com/sakaiproject/sakai.git maven/src
#git clone -b 12.x https://github.com/sakaiproject/sakai.git maven/src
git clone https://github.com/sakaiproject/sakai.git maven/src

echo "====== Building Sakai ======"
docker run -it --rm --name sakai-maven \
  -v "$PWD/maven/src":/usr/src/mymaven/src \
  -v "$PWD/maven/target":/usr/src/mymaven/target \
  -v "$PWD/maven/.m2":/root/.m2 \
  sakaimasterdocker_maven mvn -T 2C \
  -f src \
  clean install

echo "====== Deploying Sakai ======"
docker run -it --rm --name sakai-maven \
  -v "$PWD/maven/src":/usr/src/mymaven/src \
  -v "$PWD/maven/target":/usr/src/mymaven/target \
  -v "$PWD/maven/.m2":/root/.m2 \
  sakaimasterdocker_maven mvn -T 2C \
  -f src \
  sakai:deploy

echo "====== Building duke-default skin ======"
docker run -it --rm --name sakai-maven \
  -v "$PWD/maven/src":/usr/src/mymaven/src \
  -v "$PWD/maven/target":/usr/src/mymaven/target \
  -v "$PWD/maven/.m2":/root/.m2 \
  sakaimasterdocker_maven mvn \
  -f src/library \
  clean install \
  -Pcompile-skin \
  -Dsakai.skin.source=duke-default \
  -Dsakai.skin.target=duke-default \
  sakai:deploy

echo "====== Starting Docker Compose ======"
docker-compose up


