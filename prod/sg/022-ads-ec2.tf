module "ads-server" {
  source = "../../modules/ads-server"
  count = 1
  subnet_id = "${module.vpc.subnet1_id}"
  user_data = "${file("ads-user-data.sh")}"
  tag_name = "AdsServer"
  sgid = ["${module.ads-server.sg_ads_id}","${module.vpc.sg_allow_all_id}"]
  sg_vpc_id = "${module.vpc.vpc_vpc_tf_id}"
  region = "sg"
}
