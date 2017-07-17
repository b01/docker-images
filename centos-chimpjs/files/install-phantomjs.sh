mkdir -p /opt/phantomjs && cd /opt/phantomjs

wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
# Use this if you are on a Company VPN and have not figured out how to add the
# companies self-signed certificates
#wget --no-check-certificate https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2

tar -xjvf ./phantomjs-*.tar.bz2 --strip-components=1

ln -s /opt/phantomjs/bin/phantomjs /usr/bin/phantomjs