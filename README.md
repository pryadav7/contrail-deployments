# contrail-deployments


Contrail Ansible Deployment

Steps for Contrail Deployemnt using contrail ansible deployer

1. Clone contrail-tools repo on the config node

2. Update all.yaml 
Sample template available at : https://github.com/pryadav7/contrail-deployments/blob/master/deploy_templates/contrail_ansible_template

3. Install required packages on config node 

sshpass -p c0ntrail123 ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$config_node_ip 'yum install -y git ansible epel-release vim'

4. Run following playbooks on the config node from contrail-tools/ansible directory:

ansible-playbook -i inventory/ playbooks/install.yml -v

ansible-playbook -i inventory/ playbooks/deploy.yml -v

5. To run sanity:

ansible-playbook -i inventory/ playbooks/run_sanity.yml -v





Contrail Helm Deployment

Pre-requites:
Ansible 2.4.3.0
sshpass (Ubuntu 16.04)

Steps for Contrail Deployemnt using Helm

1. Clone contrail-tools repo on the config node

2. Update all.yaml 
Sample Helm template available at : https://github.com/pryadav7/contrail-deployments/blob/master/deploy_templates/helm_template

3. Install required packages on config node 

sshpass -p c0ntrail123 ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$config_node_ip 'apt-get clean && apt-get update && apt-get install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt-get update && apt-get install -y sshpass git python-pip python-minimal python-apt && pip install ansible'

4. Run following playbooks on the config node from contrail-tools/ansible directory:

ansible-playbook -i inventory/ playbooks/install.yml -v

ansible-playbook -i inventory/ playbooks/deploy.yml -v

5. To run sanity:

ansible-playbook -i inventory/ playbooks/run_sanity.yml -v
