# Terraform

Provisioning infrastructure is difficult, and there are countless tools to support us in doing so. Generally, there are two categories of tools available that have huge differences on how they are configured.

## Procedural vs declarative

With procedural provisioning tools, such as Ansible and Chef, configuration happens on a "I want you to do this" basis. We go through all the steps we would go through manually, writing down a step-by-step guide on how to set up the infrastructure using supporting libraries. Dependencies need to be manually specified in the correct order, since calls to modules with missing dependencies will fail.  

Declarative tools, on the other hand, take the finished infrastructure as input. We tell them that we want a server, and they will figure out how to get there and create their own dependency graph, creating resources in the correct order.

To compare the two, let's take an example and create an Amazon EC2 instance.

Ansible:
```yaml
- name: Create instance
  amazon.aws.ec2_instance:
    name: "control-plane-0"
    instance_type: c5.large
    image_id: ami-00000
    tags:
      Environment: Testing
```

Terraform:
```json
resource "aws_instance" "control-plane-0" {
  ami           = ami-00000
  instance_type = "c5.large"

  tags = {
    Environment = "Testing"
  }
}
```

These, for now, seem rather similar. Indeed, with just creating a single instance, there is no big difference. Where Terraform and other declarative providers get interesting is when we want to create multiple resources that are dependent on each other.
For our cluster, we will also need a private network for our nodes to communicate in. For Ansible, order matters. We need to create the network and record its identifier before adding the `ec2_instance` module to our playbook. With Terraform, we can just toss our network declaration into any file, anywhere in our directory... and it will know what is dependent on what.

Another large difference is state. Ansible is stateless, whereas with Terraform, you will see a `.tfstate` file appear. After every deployment, Terraform will save its current state and will diff follow-up deployments against that state file as its source of truth.  
This has the advantage that our tooling is not reliant on all of our external providers being the source of truth. With procedural tools, current state is evaluated while the playbook is running, which can be problematic with network failures, unavailable third-party APIs or outdated modules. On the other hand, the state can become outdated when resources are changed outside of Terraform - deleting the server we created above through the AWS console or `aws ec2 delete-instances` will result in Terraform thinking we are running an instance that no longer exists, causing errors next time we want to access data in the instance or make changes. This has then to be manually corrected using the `terraform state` command.

Personally, I much prefer the declarative approach. It has some disadvantages, such as not being able to easily install and remove packages by re-running the tool, but not having to worry about dependency graphs and the much easier handling of output variables makes it an easy choice.

## Terraform, Pulumi, ...?

Having chosen that we want to go with a declarative provisioning tool, there are still multiple options.  
Pulumi offers the nice gimmick of being configurable in multiple languages, such as TypeScript, Go, C# and others, fulfilling the dream of being able to just have one language in our repository. Terraform, on the other hand, uses its own HCL configuration language, which isn't necessarily pretty, but also doesn't break brains.  
Terraform is the tool of choice because it's the industry standard, comes with an absurd number of provider plugins and also, frankly, is the first tool I have used and it hasn't given me much reason to move away from it.

