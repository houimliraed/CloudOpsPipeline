#####
# creating ecr repo for storing docker images
#####


resource "aws_ecr_repository" "app" {

  name                 = "cloudopspipeline-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    # this false should be true when u running this app on production
    scan_on_push = false
  }


}

resource "aws_ecr_repository" "proxy" {
  name                 = "cloudopspipeline-proxy"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false

  }

}

