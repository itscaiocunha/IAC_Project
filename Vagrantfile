VAGRANT_API_VERSION = "2"

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  # VM de Geração de Dados
  config.vm.define "data_generator" do |data|
    data.vm.box = "ubuntu/focal64"
    data.vm.network "private_network", ip: "192.168.56.10"
    data.vm.provision "shell", path: "./data_generator/generate_data.sh"
  end

  # VM de Banco de Dados
  config.vm.define "db_vm" do |db|
    db.vm.box = "ubuntu/focal64"
    db.vm.network "private_network", ip: "192.168.56.20"
    db.vm.provision "shell", path: "./db_vm/provision_db.sh"
  end

  # VM de Microserviço
  config.vm.define "microservice_vm" do |service|
    service.vm.box = "ubuntu/focal64"
    service.vm.network "private_network", ip: "192.168.56.30"
    service.vm.provision "shell", path: "./microservice_vm/provision_service.sh"
  end
end
