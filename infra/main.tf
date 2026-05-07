module "vpc" {
  source              = "./modules/vpc"
  vpc-cidr-block      = var.vpc-cidr-block
  public-subnet-cidr  = var.public-subnet-cidr
  private-subnet-cidr = var.private-subnet-cidr
  public-subnet-cidr-b = var.public-subnet-cidr-b
}

module "ecr" {
  source = "./modules/ecr"

}