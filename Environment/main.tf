resource "aws_elastic_beanstalk_application" "sample-app-v2" {
  name        = "sample-application"
  description = "sample app for aws CI CD"
}

resource "aws_elastic_beanstalk_environment" "sample-env-v2" {
  name                = "sample-env"
  application         = aws_elastic_beanstalk_application.sample-app-v2.name
  solution_stack_name = "64bit Amazon Linux 2023 v6.1.7 running Node.js 20"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-service-role"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "1"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
}