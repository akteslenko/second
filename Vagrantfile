# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.box_check_update = false
    config.vm.hostname = 'blog.local'
    config.vm.boot_timeout = 120
    config.vm.network "private_network", ip: "192.168.33.40"

    # config.vm.define "api" do |api|
    # end

    config.vm.synced_folder "../blog", "/var/www/blog", owner: "www-data", group: "vagrant", create: true,
    mount_options: ['dmode=755', 'fmode=755']

    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "256"
    vb.cpus = 2
    vb.name = "blog.local"
    end

    config.vm.provision "ansible_local" do |ansible|
       ansible.playbook       = "/var/www/blog/provisioning/vagrant.yml"
       ansible.verbose        = true
       ansible.install        = true
       ansible.limit          = "all" # or only "nodes" group, etc.
       ansible.provisioning_path           = "/etc/ansible/" # or only "nodes" group, etc.
    end
end