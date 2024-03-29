variable "compartment_ocid" {}

variable "prefix" { default = "fm-" }

variable "vcn_cidr_block" {
  default = "10.1.0.0/16"
}

variable "vcn_test_subnet_cidr_block" {
  default = "10.1.123.0/24"
}

variable "vcn_test_subnet_backup_cidr_block" {
  default = "10.1.124.0/24"
}

variable "num_instances" {
  default = "3"
}

variable "instance_shape" {
  default = "VM.Standard2.4"
}

variable "instance_image_ocid" {
  type = "map"
  // Visit: https://docs.cloud.oracle.com/iaas/images/
  // Oracle - provided image: Oracle-Linux-7.7-2019.10.19-0
  default = {
    ap-mumbai-1    = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaatxd7rfl6ndvlrx6tbyiym76skqry6icqkmghm6ftfnkg34b47x2a"
    ap-seoul-1     = "ocid1.image.oc1.ap-seoul-1.aaaaaaaaiznnyrh2fir2d3uc6xzsrxucnvxdvzdfjflmjvp7jaujczpvk4pq"
    ap-sydney-1    = "ocid1.image.oc1.ap-sydney-1.aaaaaaaaw26yjhfz2tyuuqqeougjrzvj7sqjzj7dgsm2wodyczgrekibefmq"
    ap-tokyo-1     = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaapj6tt3elckgdsgvambg7unr3vzv7ngsb7qw7yybuyb3utymhgz2a"
    ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaa7gb5qhlijlfon7mfoxkapsi2zvqtgrle3idy254wp3h3ddds3opa"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaatg3vbdctkxzvtzsrqhlkugep4rtmqohypphypbjjt34hib6i2jaa"
    eu-zurich-1    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaacku52lqvorlqunj34xxna73jm5tblrk7veqxkuejgda6mgjc5pma"
    sa-saopaulo-1  = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaw27fwywcukz7k623x64zjsukjzckc7sdsvfyo2cjxde525nhudfa"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaasg3gy5z5xm3kn72d5rf6s7dlp6qyfdn2c6dmbhzjbrcr3s45ecua"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaapbttbwn5jla6wrnsrugwcdvrjy2rb45jd6txptunprwh4qob7uaa"
    us-langley-1   = "ocid1.image.oc2.us-langley-1.aaaaaaaa7dpyskrzhzn5bl67s6jirdfbidznk7m2snuqzfjyw4zdac3r7fxa"
    us-luke-1      = "ocid1.image.oc2.us-luke-1.aaaaaaaa67fzgzku3boiajda6r5izv7furisdrmhy6szepchyej5nfgelz2q"
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaaalftcwenhqptcsibib433ecl7453fvnkgh45cfwyvtrq3reocjha"
  }
}

# DBSystem specific
variable "db_system_shape" {
  default = "VM.Standard2.8"
}

variable "db_edition" {
  # ENTERPRISE_EDITION_EXTREME_PERFORMANCE required for RAC!!!
  default = "ENTERPRISE_EDITION"
}

variable "db_admin_password" {
  default = "BEstrO0ng_#12"
}

variable "db_name" {
  default = "aTFdb"
}

variable "db_version" {
  default = "19.0.0.0"
}

variable "db_home_display_name" {
  default = "MyTFDBHome"
}

variable "db_disk_redundancy" {
  default = "NORMAL"
}

variable "sparse_diskgroup" {
  default = true
}

variable "db_system_display_name" {
  default = "MyTFDBSystem"
}

variable "hostname" {
  default = "myoradb"
}

variable "host_user_name" {
  default = "opc"
}

variable "n_character_set" {
  default = "AL16UTF16"
}

variable "character_set" {
  default = "AL32UTF8"
}

variable "db_workload" {
  default = "OLTP"
}

variable "pdb_name" {
  default = "pdbName"
}

variable "data_storage_size_in_gb" {
  default = "512"
}

variable "license_model" {
  default = "LICENSE_INCLUDED"
}

variable "node_count" {
  default = "1"
}
