# Cookbook Name:: Saiku Server
# Recipe:: default
#
# Copyright 2014, Olavo Queiroz Guimaraes
#
# All rights reserved - Do Not Redistribute
#
package "python-software-properties" do
  action :install
end
execute "addrepo" do
  command "add-apt-repository ppa:webupd8team/java"
end
execute "aptupdate" do
  command "apt-get update"
end
execute "accept-license" do
  command "echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections"
end
package "oracle-java7-installer" do
  action :install
end
package "oracle-java7-set-default" do
  action :install
end
execute "download-saiku" do
  cwd "/opt/chef-repo/cookbooks/saikuserver/files/default/"
  command "wget http://meteorite.bi/downloads/saiku-server-2.6.tar.gz"
end
execute "descompact-saiku" do
  command "tar -xzvf /opt/chef-repo/cookbooks/saikuserver/files/default/saiku-server-2.6.tar.gz -C /opt/"
end
execute "start-saiku" do
  environment "JAVA_HOME" => "/usr/lib/jvm/java-7-oracle/jre/"
  command "/opt/saiku-server/start-saiku.sh"
end
