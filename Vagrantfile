# -*- mode: ruby -*-
Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/bionic64"

# Proxy
  config.vm.define :proxy do |cfg|
	cfg.vm.box = "centos/7"
        cfg.vm.network :private_network, ip: "10.0.0.9"
        cfg.vm.provider :virtualbox do |v|
            v.name = "proxy"
        end
    end

# Database
  config.vm.define :DB do |cfg|
        cfg.vm.network :private_network, ip: "10.0.0.11"
        cfg.vm.provider :virtualbox do |v|
            v.name = "DB"
        end
    end

# Application 1
  config.vm.define :App1 do |cfg|
        cfg.vm.network :private_network, ip: "10.0.0.12"
        cfg.vm.provider :virtualbox do |v|
            v.name = "App1"
        end
    end

# Application 2
  config.vm.define :App2 do |cfg|
        cfg.vm.network :private_network, ip: "10.0.0.13"
        cfg.vm.provider :virtualbox do |v|
            v.name = "App2"
        end
    end

# Load Balancer
  config.vm.define :LB do |cfg|
        cfg.vm.network :private_network, ip: "10.0.0.10"
        cfg.vm.provider :virtualbox do |v|
            v.name = "LB"
        end
    end

# configuration
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "site.yml"
    ansible.become = true
    ansible.groups = {
      "DB" => ["DB"],
      "App" => ["App1", "App2"],
      "LB" => ["LB"]
	}

  end

end
