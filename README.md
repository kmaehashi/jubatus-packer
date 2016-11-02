# Packer Template for Jubatus

Packer template to create Jubatus AMI & Docker image.

## Usage

```sh
export AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXXXXXXX"
export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
packer build -var "ami_region=ap-northeast-1" -var "ami_name_tag=jubatus-1.0.0" -var "source_ami=ami-c88325a9" template.json
```

You can find the latest `source_ami` ID from [Ubuntu Cloud Image Finder](https://cloud-images.ubuntu.com/locator/) (find the image ID for trusty, 14.04, amd64, hvm-ssd).

For hands-on images (include jubatus-example and handson-text repository), specify `image_type=handson`:

```sh
packer build -var "ami_region=ap-northeast-1" -var "ami_name_tag=jubatus-1.0.0" -var "source_ami=ami-c88325a9" -var "image_type=handson" template.json
```

If you only need Docker image, use ``packer build -except=amazon-ebs``.

### Note

* By default `m3.large` instance (on Tokyo region) is used to create AMI, which is not free.
* AMIs created by this template are not public by default; you need to publish the AMI via AWS Console to make it accessible to everyone.
