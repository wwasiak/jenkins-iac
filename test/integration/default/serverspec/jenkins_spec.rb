require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('jenkins') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8080) do
  it { should be_listening }
end

describe command("curl localhost:8080") do
  its(:stdout) { should match /login\?from\=\%2F/ }
  its(:stdout) { should match /Authentication required/ }
end

describe file("/opt/mount1/jenkins/config.xml") do
  it { should exist }
  it { should be_owned_by 'jenkins' }
end
