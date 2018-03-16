FROM halplatform/hal-build-environments:php7.0-centos7
### docker build -t lci ./.circleci
### Install git-core if running locally

#TODO do i need this?
#RUN curl -sLk https://git/pages/circleci/prepare-environment/prepare.sh | bash -

# Install yarn RPMs and GPG keys
RUN curl -sS https://dl.yarnpkg.com/rpm/yarn.repo >> /etc/yum.repos.d/yarn.repo \
 && curl -sS https://dl.yarnpkg.com/rpm/pubkey.gpg >> /etc/pki/rpm-gpg/RPM-GPG-KEY-yarn \
 && rpm --import etc/pki/rpm-gpg/RPM-GPG-KEY-yarn \
 && wget --no-check-certificate https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
 && yum -y install nodejs \
 firefox \
 java-1.8.0-openjdk \
 nginx \
 php-mcrypt \
 google-chrome-stable_current_x86_64.rpm \
 yarn