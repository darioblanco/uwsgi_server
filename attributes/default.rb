#
# Author:: Dario Blanco (<dario@darioblanco.com>)
# Cookbook Name:: uwsgi-gevent
# Attributes:: default
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

default['uwsgi']['app_name'] = "uwsgi"

# uWSGI general settings
default['uwsgi']['app_path'] = nil
default['uwsgi']['callable'] = "app"
default['uwsgi']['log_dir'] = '/var/log/uwsgi'
default['uwsgi']['master'] = true
default['uwsgi']['module'] = "webapp"
default['uwsgi']['processes'] = 4
default['uwsgi']['socket'] = "/tmp/uwsgi.sock"
default['uwsgi']['stats_host'] = "127.0.0.1"
default['uwsgi']['stats_port'] = 9191
default['uwsgi']['threads'] = 2
default['uwsgi']['version'] = "1.9.6"
default['uwsgi']['web_host'] = "0.0.0.0"
default['uwsgi']['web_port'] = 80

# Gevent settings
default['uwsgi']['gevent']['async_cores'] = 2000

# Nginx reverse proxy settings
default['uwsgi']['nginx']['port'] = 80
