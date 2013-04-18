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

* `node['uwsgi']['app_name']` - Name for the uWSGI web application
* `node['uwsgi']['app_path']` - Web application project folder
* `node['uwsgi']['callable']` - Name of the callable application (for instance 'app' in flask)
* `node['uwsgi']['log_dir']` - Log path for storing access and error info
* `node['uwsgi']['master']` - For running uwsgi as a master process
* `node['uwsgi']['module']` - Module in which the callable application can be found
* `node['uwsgi']['processes']` - Number of processes
* `node['uwsgi']['socket']` - Unix socket location (used by nginx)
* `node['uwsgi']['stats_host']` - Bind host for the stats server
* `node['uwsgi']['stats_port']` - Bind port for the stats server
* `node['uwsgi']['threads']` - Number of threads per process
* `node['uwsgi']['version']` - uWSGI version to install
* `node['uwsgi']['web_host']` - Bind host for the web server (only if there is not a proxy)
* `node['uwsgi']['web_port']` - Bind port for the web server (only if there is not a proxy)
* `node['uwsgi']['gevent']['async_cores']` - Number of gevent async workers
* `node['uwsgi']['nginx']['port']` - Bind port for the reverse proxy

Usage
=====

Simply include the recipes where you want uWSGI installed. There are several possible set ups:

## uWSGI as a HTTP standalone server
    "run_list": [
        "recipe[uwsgi::app]"
    ]

## uWSGI with gevent support
    "run_list": [
        "recipe[uwsgi::app]",
        "recipe[uwsgi::asynchronous]"
    ]

## uWSGI with nginx as a reverse proxy
    "run_list": [
        "recipe[uwsgi::app]",
        "recipe[uwsgi::proxy]"
    ]

## uWSGI with nginx and gevent
    "run_list": [
        "recipe[uwsgi::app]",
        "recipe[uwsgi::proxy]",
        "recipe[uwsgi::asynchronous]"
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
