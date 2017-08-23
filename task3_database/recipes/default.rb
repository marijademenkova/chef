#
# Cookbook:: task3_database
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute 'mysql-community-repo' do
	command 'yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm -y'
	action :run
end

mysql_service 'mysql_service' do
  port '3306'
  version '5.7'
  initial_root_password 'password'
  bind_address '0.0.0.0'
  action [:create, :start]
end

bash "create db" do
  code <<-EOH
  mysql -S /var/run/mysql-mysql_service/mysqld.sock -uroot -ppassword -e "create database task3 character set utf8 collate utf8_bin"  
  EOH
end