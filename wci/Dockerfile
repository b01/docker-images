FROM halplatform/hal-build-environments:php7.0-centos7
### docker build -t lci ./.circleci
### Install git-core if running locally

#TODO do i need this?
#RUN curl -sLk https://git/pages/circleci/prepare-environment/prepare.sh | bash -
RUN yum -y install nodejs firefox java-1.8.0-openjdk nginx php-mcrypt \
 && wget --no-check-certificate https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
 && yum -y install google-chrome-stable_current_x86_64.rpm \
 && nginx && php-fpm -D