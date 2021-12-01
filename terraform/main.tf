provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}

module "s3" {
    source = "./s3"
    #bucket name should be unique
    bucket_name = "bucket-via-terraform"       
}

resource "aws_s3_bucket_object" "sampleImage" {
  bucket = "bucket-via-terraform"
  source = "../assets/sampleImage.png"
  key    = "sampleImage"
}