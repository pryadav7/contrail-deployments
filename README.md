# contrail-deployments


Contrail Helm Deployment

Pre-requites:
Ansible 2.4.3.0
sshpass (Ubuntu 16.04)

Steps for Contrail Deployemnt using Helm
Update all.yaml 

sshpass -p c0ntrail123 ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$config_node_ip 'apt-get clean && apt-get update && apt-get install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt-get update && apt-get install -y sshpass git python-pip python-minimal python-apt && pip install ansible'

Run following playbooks on the config node:

ansible-playbook -i inventory/ playbooks/install.yml -v
ansible-playbook -i inventory/ playbooks/deploy.yml -v

