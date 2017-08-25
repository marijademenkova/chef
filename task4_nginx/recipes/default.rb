#
# Cookbook:: task4_nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'nginx'

#template '/etc/nginx/nginx.conf' do
#  source 'nginx.conf'
#end

service 'nginx' do
  action [:enable, :start]
end

lb "apache_server" do
  role "apache_server"
  action :attach
end

lb "jboss_server" do
  role "jboss_server"
  action :attach
end