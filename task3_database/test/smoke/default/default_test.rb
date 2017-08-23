# # encoding: utf-8

# Inspec test for recipe task3_database::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
describe service('mysql-mysql_service') do  
  it { should be_enabled }  
  it { should be_running }
end

describe port 3306 do
  it { should be_listening }
  its('protocols') { should include('tcp') }
end

describe command("mysql -S /var/run/mysql-mysql_service/mysqld.sock -uroot -ppassword -e 'show databases'") do
  its('stdout') { should include 'task3' }
end