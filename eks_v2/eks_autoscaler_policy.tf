resource "aws_iam_policy" "Autoscaller_worker_node" {
  name        = "eks_autoscaller"
  description = "Policy for EKS Autoscaller"
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "autoscaling:DescribeAutoScalingGroups",
            "autoscaling:DescribeAutoScalingInstances",
            "autoscaling:DescribeLaunchConfigurations",
            "autoscaling:DescribeTags",
            "autoscaling:SetDesiredCapacity",
            "autoscaling:TerminateInstanceInAutoScalingGroup",
            "ec2:DescribeLaunchTemplateVersions"
          ],
          "Resource" : "*"
        }
      ]
    }
  )
}

resource "aws_iam_policy_attachment" "worker_node_autoscaller" {
  policy_arn = aws_iam_policy.Autoscaller_worker_node.arn
  roles      = aws_iam_role.node
}