#
# Author:: Dario Blanco (<dario@darioblanco.com>)
# Cookbook Name:: uwsgi_server
# Recipes:: proxy
#
# Copyright 2013, Dario Blanco
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "iptables"
include_recipe "nginx"

# Create nginx site
template "#{node['nginx']['dir']}/sites-available/uwsgi-site" do
  source "uwsgi-site.erb"
  notifies :reload, "service[nginx]"
end

nginx_site "uwsgi-site"
directory "#{node['nginx']['log_dir']}"

nginx_site "default" do
  enable false
end

# Open the desired ports
begin
  iptables_rule "open_nginx_ports" do
    source "open_ports.erb"
    variables :ports => [node['uwsgi_server']['nginx']['port'], ]
  end
rescue
  Chef::Log.warn("couldn't configure iptables for nginx")
end
