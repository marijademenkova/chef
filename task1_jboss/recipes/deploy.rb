#7. Recipe  should download, unpack and put application jars to Jboss deploy folder. Then restart Jboss.
remote_file '/tmp/HelloWorldWebApp.zip' do 
  source 'http://centerkey.com/jboss/HelloWorldWebApp.zip'
  owner 'jboss'
  mode '0755'
end

bash "unpack" do
  code <<-EOH
  unzip /tmp/HelloWorldWebApp.zip HellowWorld/helloworld.war -d /tmp/
  mv /tmp/HellowWorld/helloworld.war /opt/wildfly-10.1.0.Final/standalone/deployments/
  EOH
end

service 'jboss' do
  action [:restart]
end

execute 'wait for jboss' do  
	command 'sleep 1m'
end