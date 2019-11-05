////// environment setup ///////
variable "instance_shape" {
#  default = "VM.Standard2.1"
  default = "VM.Standard.B1.16"
}

variable "instance_image_ocid" {
// Oracle - provided image: Oracle-Linux-7.7-2019.10.19-0
  default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaatg3vbdctkxzvtzsrqhlkugep4rtmqohypphypbjjt34hib6i2jaa"
}


variable "vcn_default_cidr_block" {
  description = "VCN IP range"
  default     = "10.200.0.0/16"
}


variable "vcn_default_subnets_cidr_blocks_public" {
  description = "VCN IP range"
  default     = ["10.200.1.0/24", "10.200.2.0/24", "10.200.3.0/24"]
}


variable "vcn_default_subnets_cidr_blocks_private" {
  description = "VCN IP range"
  default     = ["10.200.4.0/24", "10.200.5.0/24", "10.200.6.0/24"]
}
