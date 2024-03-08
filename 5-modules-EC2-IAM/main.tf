module "ec2" {
  source               = "./modules/ec2"
  iam_instance_profile = "LabInstanceProfile"
  instance_name        = each.value.instance_name
  instance_type        = each.value.instance_type
  user_data            = each.value.user_data
  for_each = {
    for instance, value in var.instances : instance => value
  }
}

module "sns" {
  source                   = "./modules/sns"
  sns_email_subscribers    = ["radulescutristan@proton.me", "hugo.ponthieu@etu.umontpellier.fr", "dorian.grasset@etu.umontpellier.fr"]
  sns_topic_name           = "mail_topic"
  lambda_role_arn          = "arn:aws:iam::975050161001:role/LabRole"
  sns_email_notification   =join(",",[for instance in module.ec2 : instance.ec2_public_ip])
  sns_lambda_function_name = "lambdaFunctionEmail"
}

variable "instances" {
  description = "The EC2 instance descriptions"
  type = list(object({
    instance_name = string
    instance_type = string
    user_data     = string
  }))
}