apt-get update
apt-get install -y libxml2-dev
apt-get install -y --no-install-recommends clang

mkdir -p $HOME/.R && printf "CXX=clang++ -ftemplate-depth-256\nCC=clang\n" > $HOME/.R/Makevars
