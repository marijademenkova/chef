#8. Write tests:
#
#check main page
#application is deployed
#(2-3 tests of your choice, java version installed etc)


describe service('jboss') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe port(8080) do
  it { should be_listening }
end

describe http('http://192.168.56.90:8080/') do
  its('status') { should eq 200 }
end


describe http('http://192.168.56.90:8080/helloworld/hi.jsp') do
  its('body') { should match /Hello, World/}
end

describe package('java-1.8.0-openjdk') do
it { should be_installed }
its('version') { should eq '1.8.0.141-1.b16.el7_3' }
end