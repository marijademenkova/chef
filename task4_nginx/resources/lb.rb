resource_name :lb

property :role, String, default: 'default'

action :attach do

  file '/etc/nginx/conf.d/default.conf' do
    action :delete
  end

  template '/etc/nginx/conf.d/nginx.conf' do
    source 'nginx.conf'
  end

  directory '/etc/nginx/upstreams' 

  nodes = search(:node, "role:#{role}")

  nodes.each do |node|
    file "/etc/nginx/upstreams/#{node['network']['interfaces']['enp0s8']['routes'][0]['src']}.conf" do
      content " server #{node['network']['interfaces']['enp0s8']['routes'][0]['src']};"
    end
  end

  service "nginx" do
    action :restart
  end 
end

action :detach do

  nodes = search(:node, "role:#{role}")

  nodes.each do |node|
    file "/etc/nginx/upstreams/#{node['network']['interfaces']['enp0s8']['routes'][0]['src']}.conf" do
      action :delete
    end
  end

  service "nginx" do
    action :restart
  end
end