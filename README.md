# Packer Template for Jubatus

Packer template to create Jubatus VM.

## Usage (AMI)

```sh
export AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXXXXXXX"
export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
packer build -var "ami_name_tag=jubatus-0.8.7" -var "source_ami=ami-3c4f7552" template.json
```

You can find the latest `source_ami` ID from [Amazon EC2 Published AMIs](http://cloud-images.ubuntu.com/releases/precise/release/) (look for ap-northeast-1/64-bit/hvm-ssd.)

For hands-on images (include jubatus-example and handson-text repository), specify `image_type=handson`:

```sh
packer build -var "ami_name_tag=jubatus-0.8.7" -var "source_ami=ami-3c4f7552" -var "image_type=handson" template.json
```

### Note

* By default `m3.large` instance (on Tokyo region) is used to create AMI, which is not free.
* AMIs created by this template are not public by default; you need to publish the AMI via AWS Console to make it accessible to everyone.
