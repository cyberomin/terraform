### Introduction
This project is Vagrant dependent. If you don't have Vagrant installed on your machine, please kindly do so.

The next phase will be cloning this project to your machine. Change directory into the `terraform` directory and run `vagrant up && vagrant ssh` this will launch you into a vagrant box with Terraform provisioned. 

### Generating SSH Keys
To generate an SSH key, simply run this command on your terminal `ssh-keygen -t rsa -b 4096 -C “your email”` and follow the on-screen information. I’ll strongly advise that you don’t set a passphrase for your SSH key. 

### Sample
The sample code in this project uses Digital Ocean as its based provider. All you need to do is to change the token to a valid DOs API you are well on your way to *Terraforming*

After changing the API token, change directory to files location using `cd /vagrant` and run `terraform apply` then sit back and watch Terraform do its thing.

### Done?
When you're done experimenting, simply run `terraform destroy` and terraform will destroy all previously created resource. 

> Please note that there's a cost attached to spinning DOs droplets. You may want to plan for this and I strongly suggest that you destroy everything when you are done.

If you have any concern, kindly create an issue or send in a pull request.  
Enjoy. 