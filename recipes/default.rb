#
# Cookbook Name:: vagrant teste
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
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
execute "descompact-saiku" do
  command "tar -xzvf /vagrant/cookbooks/deploy_vagrant/files/default/saiku-server-2.6.tar.gz -C /opt/"
end
execute "start-saiku" do
#  cwd "/opt/saiku-server/"
  environment "JAVA_HOME" => "/usr/lib/jvm/java-7-oracle/jre/"
  command "/opt/saiku-server/start-saiku.sh"
end
