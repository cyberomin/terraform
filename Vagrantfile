Vagrant.configure("2") do |config|
    config.vm.define :node do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "terraform"

        node.vm.provision :shell, :path => "vagrant/setup.sh"
        node.vm.synced_folder ".", "/vagrant", group: "www-data", owner: "www-data", create: true, :mount_options => [ "dmode=777", "fmode=777" ]

        node.vm.provider "virtualbox" do |vb|
            vb.name = "Terraform"
            vb.memory = "2048"
        end
    end
    config.ssh.forward_agent = true
end