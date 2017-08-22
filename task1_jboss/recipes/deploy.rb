template '/opt/wildfly-10.1.0.Final/standalone/deployments' do
  source '/home/student/Downloads/mnt-lab.war'
  owner 'jboss'
  group 'jboss'
  mode '0755'
end
