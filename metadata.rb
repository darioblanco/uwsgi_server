maintainer        "Dario Blanco"
maintainer_email  "dario@darioblanco.com"
license           "Apache 2.0"
description       "Installs and configures uwsgi"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1"

recipe "uwsgi_server::app", "Installs and configures a uwsgi application"
recipe "uwsgi_server::proxy", "Installs and configures nginx as a reverse proxy for uwsgi"
recipe "uwsgi_server::asynchronous", "Installs and configures gevent for uwsgi"

depends "iptables"
depends "nginx"
depends "supervisor"

%w{ ubuntu debian }.each do |os|
  supports os
end
