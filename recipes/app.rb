#
# Author:: Dario Blanco (<dario@darioblanco.com>)
# Cookbook Name:: uwsgi-gevent
# Recipes:: app
#
# Copyright 2012, Dario Blanco
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
include_recipe "supervisor"
include_recipe "uwsgi::default"

# Needed packages by uwsgi
package "libssl0.9.8"

python_pip "uwsgi" do
  action :install
  version node['uwsgi']['version']
end

# Create uWSGI config file
template "#{node['uwsgi']['app_path']}/uwsgiconfig.ini" do
  source "uwsgiconfig.ini.erb"
  notifies :reload, "supervisor_service[uwsgi-app]"
end

# Set supervisor for managing uWSGI application
supervisor_service "uwsgi-app" do
  action [:enable, :start]
  supports :reload => true, :restart => true
  directory node['uwsgi']['app_path']
  user "www-data"
  command "uwsgi uwsgiconfig.ini"
  stdout_logfile "#{node['uwsgi']['log_dir']}/access.log"
  stderr_logfile "#{node['uwsgi']['log_dir']}/errors.log"
end

# Open the desired ports
begin
  iptables_rule "open_uwsgi_ports" do
    source "open_ports.erb"
    variables :ports => [node['uwsgi']['web_port'], ]
  end
rescue
  Chef::Log.warn("couldn't configure iptables for trackit")
end
