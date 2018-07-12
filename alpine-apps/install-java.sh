# Step 1: Make Java Install dirs
mkdir -p /opt/java
cd /opt/java
jvMaj=10
jvMin=0
jvBld=1
jvEdt=jdk
# Step 2: Download XXX-XXX-linux-x64.tar.gz from either the JRE or JDK section
#curl -L -C - -b "oraclelicense=accept-securebackup-cookie" -O http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.tar.gz
#tar -zxvf jdk-10.0.1_linux-x64_bin.tar.gz
#rm jdk-10.0.1_linux-x64_bin.tar.gz
curl -L -C - -b "oraclelicense=accept-securebackup-cookie" -O http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jre-10.0.1_linux-x64_bin.tar.gz
tar -zxvf jre-10.0.1_linux-x64_bin.tar.gz
rm jre-10.0.1_linux-x64_bin.tar.gz

# Step 3: create a symbol link as the current version:
#ln -s /opt/java/jdk-10.0.1 /opt/java/current
ln -s /opt/java/jre-10.0.1 /opt/java/current
# Step 4: Create a file in /etc/profile.d/java.sh
#echo "export JAVA_HOME=/opt/java/current" > /etc/profile.d/java.sh
#echo "export PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile.d/java.sh
export JAVA_HOME=/opt/java/current
export PATH=$PATH:$JAVA_HOME/bin

# Step 5: Execute this script to add the variables to the current environment:
#sh  /etc/profile.d/java.sh
#debug
echo "JH = '${JAVA_HOME}'"
echo $PATH

# Step 6: Now in your /opt/java/XXX/bin folder let it execute:
#paxctl -c /opt/java/jdk-10.0.1/bin/java
#paxctl -m /opt/java/jdk-10.0.1/bin/java
#paxctl -c /opt/java/jdk-10.0.1/bin/javac
#paxctl -m /opt/java/jdk-10.0.1/bin/javac

paxctl -c /opt/java/jre-10.0.1/bin/java
paxctl -m /opt/java/jre-10.0.1/bin/java