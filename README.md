Description
===========

Installs and configures uwsgi (via pip), a full stack for building (and hosting) clustered/distributed network applications.

Requirements
============

Platform
--------

* Debian, Ubuntu

Cookbooks
---------

* iptables
* nginx
* supervisor

Attributes
==========

* `node['uwsgi_server']['app_name']` - Name for the uWSGI web application
* `node['uwsgi_server']['app_path']` - Web application project folder
* `node['uwsgi_server']['callable']` - Name of the callable application (for instance 'app' in flask)
* `node['uwsgi_server']['log_dir']` - Log path for storing access and error info
* `node['uwsgi_server']['master']` - For running uwsgi as a master process
* `node['uwsgi_server']['module']` - Module in which the callable application can be found
* `node['uwsgi_server']['processes']` - Number of processes
* `node['uwsgi_server']['socket']` - Unix socket location (used by nginx)
* `node['uwsgi_server']['stats_host']` - Bind host for the stats server
* `node['uwsgi_server']['stats_port']` - Bind port for the stats server
* `node['uwsgi_server']['threads']` - Number of threads per process
* `node['uwsgi_server']['version']` - uWSGI version to install
* `node['uwsgi_server']['web_host']` - Bind host for the web server (only if there is not a proxy)
* `node['uwsgi_server']['web_port']` - Bind port for the web server (only if there is not a proxy)
* `node['uwsgi_server']['gevent']['async_cores']` - Number of gevent async workers
* `node['uwsgi_server']['nginx']['port']` - Bind port for the reverse proxy

Usage
=====

Simply include the recipes where you want uWSGI installed. There are several possible set ups:

## uWSGI as a HTTP standalone server
    "run_list": [
        "recipe[uwsgi_server::app]"
    ]

## uWSGI with gevent support
    "run_list": [
        "recipe[uwsgi_server::app]",
        "recipe[uwsgi_server::asynchronous]"
    ]

## uWSGI with nginx as a reverse proxy
    "run_list": [
        "recipe[uwsgi_server::app]",
        "recipe[uwsgi_server::proxy]"
    ]

## uWSGI with nginx and gevent
    "run_list": [
        "recipe[uwsgi_server::app]",
        "recipe[uwsgi_server::proxy]",
        "recipe[uwsgi_server::asynchronous]"
    ]

License and Author
==================

Author:: Dario Blanco (<dario@darioblanco.com>)

Copyright 2013, Dario Blanco

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
