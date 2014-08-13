Cookbook Install Saiku Analytics Server 
Saiku Analytics Server Cookbook
================

 - Author: Olavo Queiroz Guimaraes <olavoqueirozg@gmail.com>
 - Cookbook install and configure: Saiku Analytics Server
 - Test: chef-solo  


HowTo
------------------

 - Install GIT client

 - Install chef solo
	- curl -L https://www.opscode.com/chef/install.sh | bash

 - Download and configure CHEF-REPO structure
	- wget http://github.com/opscode/chef-repo/tarball/master
	- tar -zxvf master  
	- mv opscode-chef-repo-f9d4b0c/ /opt/chef-repo
	- mkdir /opt/chef-repo/.chef
 
 - Configure cookbook path (/opt/chef-repo/.chef/knife.rb)
	- Add line
		- cookbook_path [ '/opt/chef-repo/cookbooks' ]
 
 - Configure solo.rb (/opt/chef-repo/solo.rb)
	- Add lines:
		- file_cache_path "/opt/chef-solo"
		- cookbook_path "/opt/chef-repo/cookbooks"

 - Download REPO: 
	- git clone https://github.com/bila-olavo/chef_saikuserver.git  -l /opt/chef-repo/cookbooks/saikuserver

 - Create your json (/opt/chef-repo/json_name.json)
	- Add line: 
		-  {   "run_list": [ "recipe[saikuserver]" ] } 
	
 - Execute CHEF-SOLO
	- chef-solo -c /opt/chef-repo/solo.rb -j /opt/chef-repo/json_name.json


