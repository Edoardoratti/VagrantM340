Vagrant.configure("2") do |config|
  BOX_IMAGE = "ubuntu/jammy64"
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  WEB_IP = ".10"
  DB_IP = ".11"
  PROXY_URL = "http://10.20.5.51:8888"
  NO_PROXY = "localhost,127.0.0.1"
  PROXY_ENABLE = true
  
  config.vm.define "web" do |webconfig|
    webconfig.vm.box = BOX_IMAGE
	if PROXY_ENABLE
	  webconfig.proxy.http = PROXY_URL
      webconfig.proxy.https = PROXY_URL
      webconfig.proxy.no_proxy = NO_PROXY
	end
	
    webconfig.vm.network "forwarded_port", guest: 80, host: 8080
	webconfig.vm.network "private_network", ip: BASE_HOST_ONLY_NETWORK + WEB_IP
	webconfig.vm.network "private_network", ip: BASE_INT_NETWORK + WEB_IP, virtualbox__intnet: true
	
	webconfig.vm.synced_folder "./site", "/var/www/html"
    webconfig.vm.provider "virtualbox" do |vb|
	  vb.name = "web"
      vb.gui = true
      vb.memory = "4096"
	end
	webconfig.vm.provision "shell", path: "web.sh"
  end

  config.vm.define "db" do |dbconfig|
    dbconfig.vm.box = BOX_IMAGE
	if PROXY_ENABLE
	  dbconfig.proxy.http = PROXY_URL
      dbconfig.proxy.https = PROXY_URL
      dbconfig.proxy.no_proxy = NO_PROXY
	end
	
	dbconfig.vm.network "forwarded_port", guest: 80, host: 8081
	dbconfig.vm.network "private_network", ip: BASE_INT_NETWORK + DB_IP, virtualbox__intnet: true
	
    dbconfig.vm.provider "virtualbox" do |vb|
	  vb.name = "db"
      vb.gui = true
      vb.memory = "4096"
	end
	dbconfig.vm.provision "shell", path: "db.sh"
  end
end

