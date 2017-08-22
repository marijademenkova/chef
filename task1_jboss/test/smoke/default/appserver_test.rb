describe package('java-1.8.0-openjdk-devel') do
  it { should be_installed }
end

describe service('jboss') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
end

describe user('jboss') do
  it { should exist }
end