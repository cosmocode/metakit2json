# set up build chain
apt-get update
apt-get install -y --no-install-recommends \
        python \
        python-dev \
        build-essential \
        ca-certificates \
        git

# compile metakit
git clone https://github.com/pooryorick/metakit.git
cd metakit
mkdir builds
cd builds
sh ../unix/configure
make test
cd ../python/
python setup.py clean build install

# fix permissions
chmod 755 /bin/metakit2json.py

# remove build chain
apt-get remove -y --purge \
        python-dev \
        build-essential \
        ca-certificates \
        git
apt-get clean -y
rm -rf /var/lib/apt/lists/*
