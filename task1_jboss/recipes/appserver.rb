package 'java-1.8.0-openjdk-devel'


user 'jboss' do
  home '/home/jboss'
  shell '/bin/bash'
  password 'jboss'
end


remote_file '/tmp/wildfly-10.1.0.Final.tar.gz' do 
  source 'http://download.jboss.org/wildfly/10.1.0.Final/wildfly-10.1.0.Final.tar.gz'
  owner 'jboss'
  mode '0755'
end

bash "unpack" do
  code <<-EOH
  tar -zxf /tmp/wildfly-10.1.0.Final.tar.gz -C /opt
  echo "JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.141-1.b16.el7_3.x86_64/jre"" >> /opt/wildfly-10.1.0.Final/bin/standalone.conf
  EOH
end

directory '/opt/wildfly-10.1.0.Final.tar.gz' do
  owner 'jboss'
  mode '0755'
  action [:create]
end

template '/etc/systemd/system/jboss.service' do
  source 'jboss.service'
  owner 'jboss'
  mode '777'
  action [:create]
end

template '/opt/wildfly-10.1.0.Final/standalone/deployments/mnt-lab.war' do
  source 'mnt-lab.war'
  owner 'jboss'
  mode '0755'
  action [:create]
end

service 'jboss' do
  action [:enable, :start]
end