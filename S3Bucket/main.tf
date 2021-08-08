//create a s3 bucket on AWS
provider "aws" {
  region    = "us-west-2"
  profile   = "terraformcourse2"
}
resource "aws_s3_bucket" "mybucket" {
  bucket = "my-tf-test-bucket-101"
  acl    = "public-read"

  tags = {
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "myfirstobject" {
  bucket = "${aws_s3_bucket.mybucket.id}"
  key    = "FTC.html"
  source = "C:/Users/ABHILASH/Desktop/FTC.html"
  etag = "${md5(file("C:/Users/ABHILASH/Desktop/FTC.html"))}"
  acl    = "public-read"
}