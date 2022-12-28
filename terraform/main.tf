##############################################################
# Rafael Conte Monteiro
# edit 11/03/2022
# example of main.tf file
##############################################################

provider "phpipam" {
  app_id   = "caminteract"
  endpoint = "http://172.17.0.150/api"
  password = "suasenha"
  username = "admin"
}

data "phpipam_first_free_address" "next_address" {
  subnet_id = "${var.Rede_Gerenciamento["${var.ambiente}"]}"
}

#
resource "phpipam_address" "address" {
  subnet_id   = "${var.Rede_Gerenciamento["${var.ambiente}"]}"
  ip_address  = "${data.phpipam_first_free_address.next_address.ip_address}"
  hostname    = "${var.vm_1_name}"
  description = "IP Reservado pela Automacao - Worker"

  lifecycle {
    ignore_changes = [
      "subnet_id",
      "ip_address",
    ]
  }
}
data "phpipam_first_free_address" "next_workload_address" {
  subnet_id = "${var.Rede_Workload["${var.ambiente}"]}"
}

resource "phpipam_address" "workload_address" {
  subnet_id   = "${var.Rede_Workload["${var.ambiente}"]}"
  ip_address  = "${data.phpipam_first_free_address.next_workload_address.ip_address}"
  hostname    = "${var.vm_1_name}"
  description = "IP Reservado pela Automacao - Worker"

  lifecycle {
    ignore_changes = [
      "subnet_id",
      "ip_address",
    ]
  }
}

resource "null_resource" "remove-worker" {
  
provisioner "remote-exec" {
    when    = "destroy"
    connection {
       host = "${var.IP_Icp_Bootnode["${var.ambiente}"]}"
  	   user = "root"
       password = "suasenha"
   }
  
    inline = [
      "cd /opt/ibm-cloud-private-${var.icp-version-path["${var.ambiente}"]}/cluster",
      "kubectl cordon ${phpipam_address.address.ip_address};kubectl drain ${phpipam_address.address.ip_address} --force --delete-local-data --ignore-daemonsets --grace-period 0;sleep 30s;",
      "sed -i '/^${phpipam_address.address.ip_address}/Id' hosts;",
      "sleep 7;",
      "kubectl delete node ${phpipam_address.address.ip_address};"
    ]
  }
}


##############################################################
# Define the vsphere provider 
##############################################################
provider "vsphere" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version              = "~> 1.3"
}

provider "camc" {
  version = "~> 0.2"
}


##############################################################
# Vsphere data for provider
##############################################################
data "vsphere_datacenter" "vm_1_datacenter" {
  name = "${var.vm_1_datacenter["${var.ambiente}"]}"
}

data "vsphere_datastore_cluster" "vm_1_datastore_cluster" {
  name          = "${var.vm_1_datastore_cluster["${var.ambiente}"]}"
  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter.id}"
}

data "vsphere_resource_pool" "vm_1_resource_pool" {
  name          = "${var.vm_1_resource_pool["${var.ambiente}"]}"
  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter.id}"
}

data "vsphere_network" "vm_1_network_gerenciamento" {
  name          = "${var.vm_1_network_gerenciamento["${var.ambiente}"]}"
  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter.id}"
}

data "vsphere_network" "vm_1_network_workload" {
  name          = "${var.vm_1_network_workload["${var.ambiente}"]}"
  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter.id}"
}


data "vsphere_virtual_machine" "vm_1_template" {
  name          = "${var.vm_1-image["${var.ambiente}"]}"
  datacenter_id = "${data.vsphere_datacenter.vm_1_datacenter.id}"
}

##### Image Parameters variables #####

# vsphere vm
resource "vsphere_virtual_machine" "vm_1" {
  name             = "${var.vm_1_name}"
  folder           = "${var.vm_1_folder["${var.ambiente}"]}"
  num_cpus         = "${var.vm_1_number_of_vcpu}"
  memory           = "${var.vm_1_memory}"
  resource_pool_id = "${data.vsphere_resource_pool.vm_1_resource_pool.id}"
  datastore_cluster_id = "${data.vsphere_datastore_cluster.vm_1_datastore_cluster.id}"  
  guest_id         = "${data.vsphere_virtual_machine.vm_1_template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.vm_1_template.scsi_type}"
  wait_for_guest_net_timeout = 0
  clone {
    template_uuid = "${data.vsphere_virtual_machine.vm_1_template.id}"

    customize {
      linux_options {
        domain    = "${var.vm_1_domain["${var.ambiente}"]}"
        host_name = "${var.vm_1_name}"
      }

      network_interface {
        ipv4_address = "${phpipam_address.address.ip_address}"
        ipv4_netmask = "${var.vm_1_ipv4_prefix_length_management["${var.ambiente}"]}"
      }
      
      dns_server_list = "${var.vm_1_dns_servers["${var.ambiente}"]}"

      network_interface {
        ipv4_address = "${phpipam_address.workload_address.ip_address}"
        ipv4_netmask =  "${var.vm_1_ipv4_prefix_length_workload["${var.ambiente}"]}"
      }

      ipv4_gateway    = "${var.vm_1_ipv4_gateway["${var.ambiente}"]}"
      dns_suffix_list = "${var.vm_1_dns_suffixes["${var.ambiente}"]}"

      
    }
  }

  network_interface {
    network_id   = "${data.vsphere_network.vm_1_network_gerenciamento.id}"
    adapter_type = "${var.vm_1_adapter_type}"
  }
  
  network_interface {
    network_id   = "${data.vsphere_network.vm_1_network_workload.id}"
    adapter_type = "${var.vm_1_adapter_type}"
  }

  disk {
    name             = "${var.vm_1_name}_0.vmdk"
    size             = "${data.vsphere_virtual_machine.vm_1_template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.vm_1_template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.vm_1_template.disks.0.thin_provisioned}"
    
   
  }

  disk {
    name             = "${var.vm_1_name}_1.vmdk"
    size             = "${data.vsphere_virtual_machine.vm_1_template.disks.1.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.vm_1_template.disks.1.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.vm_1_template.disks.1.thin_provisioned}"
    

    
    unit_number      = 1
   
  }


}

resource "vsphere_storage_drs_vm_override" "drs_vm_override" {
  datastore_cluster_id = "${data.vsphere_datastore_cluster.vm_1_datastore_cluster.id}"
  virtual_machine_id   = "${vsphere_virtual_machine.vm_1.id}"
  sdrs_enabled         = true
}


resource "null_resource" "gera-chave-publica" {
  depends_on = ["vsphere_virtual_machine.vm_1"]
 
  provisioner "remote-exec" {
    connection {
       host = "${var.IP_Icp_Bootnode["${var.ambiente}"]}"
       user = "root"
       password = "suasenha@"
   }
  
    inline = [
     "cd /tmp",
     "rm -rf icp_key*",
     "ssh-keygen -y -f /opt/ibm-cloud-private-${var.icp-version-path["${var.ambiente}"]}/cluster/ssh_key > icp_key_${var.ambiente}_${var.vm_1_name} ",
     "sed -i \"1 i`head -1 /root/.ssh/authorized_keys`\" icp_key_${var.ambiente}_${var.vm_1_name}"
    ]
  }
}

resource "null_resource" "add-remote-sshkey-to-worker" {
  depends_on = ["null_resource.gera-chave-publica"]
  provisioner "remote-exec" {
    connection {
       host = "172.17.0.200"
       user = "root"
       password = "suasenha@"
    }
  
  inline = [
         "cd /tmp",
         "scp -o \"StrictHostKeyChecking no\" root@${var.IP_Icp_Bootnode["${var.ambiente}"]}:/tmp/icp_key_${var.ambiente}_${var.vm_1_name} ./",
         "while ! scp -o \"StrictHostKeyChecking no\" icp_key_${var.ambiente}_${var.vm_1_name} root@${phpipam_address.address.ip_address}:/root/.ssh/authorized_keys; do     sleep 1; done ",
         "rm -rf icp_key_${var.ambiente}_${var.vm_1_name}"
       ]
  }
}

resource "null_resource" "add-worker" {
depends_on = ["null_resource.add-remote-sshkey-to-worker"]
  
  provisioner "remote-exec" {
    connection {
       host = "${var.IP_Icp_Bootnode["${var.ambiente}"]}"
       user = "root"
       password = "suasenha@"
   }
  
    inline = [
      "sleep 60 ",
      "cd /opt/ibm-cloud-private-${var.icp-version-path["${var.ambiente}"]}/cluster",
      "sed -i /proxy/i\\${phpipam_address.address.ip_address} hosts",
      "docker run -e LICENSE=accept --net=host -v \"$(pwd)\":/installer/cluster ibmcom/icp-inception-amd64:${var.icp-version-path["${var.ambiente}"]}-ee worker -l ${phpipam_address.address.ip_address}",
      "sleep 10",
      "kubectl label node ${phpipam_address.address.ip_address} namespace=resourcepool --overwrite=true",
      "sleep 5"
    ]
  }
}

resource "null_resource" "run-script-onworker" {
  depends_on = ["null_resource.add-worker"]
  
  provisioner "remote-exec" {
    connection {
       host = "${phpipam_address.address.ip_address}"
       user = "root"
       password = "suasenha@"
   }
  
    inline = [
      "mount 172.17.0.200:/admcloud/ /admcloud/",
      "/admcloud/scripts/ajusta_rotas.sh",
      "sleep 60 ",
      "mount 172.17.0.200:/admcloud/ /admcloud/",
      "/admcloud/scripts/camworker/workernode_script.sh"
    ]
  }
}
# Executa Atualizacao do BDGC
resource "null_resource" "registrabdgc" {
  depends_on = ["null_resource.run-script-onworker"]
  provisioner "remote-exec" {
    connection {
       host = "172.17.0.200"
       user = "root"
       password = "suasenha@"
    }
  
  inline = [
         "/admcloud/scripts/camworker/registro_bdgc_manual.sh ${phpipam_address.address.ip_address}",
         "echo 'Instalacao de worker concluida'"
       ]
  }
}
