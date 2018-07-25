# Install Dependencies for Contrail Command To Work
yum install -y install epel-release git ansible-2.4.2.0 vim net-tools 
yum install -y python-pip sshpass

# Set global git config and clone the contrail command repo
#git config --global user.name "Soumil Kulkarni"
#git config --global user.email "soumilk91@gmail.com"
#git config --global user.password "10dulKar1521991"
#sshpass -p "ijohnson123" scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ijohnson@10.84.34.150:/home/ijohnson/private_builds/contrail-command-060218.tar .
git clone https://soumilk91:10dulKar1521991@github.com/Juniper/contrail-command-deployer.git

#path_to_contrail_command_tar_file="$(pwd)"
#file_name="/contrail-command-060218.tar"
#final_path_to_contrail_command_tar_file=$path_to_contrail_command_tar_file$file_name

cd contrail-command-deployer
# Change the contents of the config/command_server.yaml that will be used for provisioning
sed -i 's|container_path:|# container_path:|' config/command_servers.yml
sed -i 's|#registry_insecure:|registry_insecure:|' config/command_servers.yml
sed -i 's|#container_registry: |container_registry: |' config/command_servers.yml
sed -i 's|#container_name:|container_name:|' config/command_servers.yml
sed -i 's|#container_tag:|container_tag:|' config/command_servers.yml

#sed -i 's|/root/contrail-command-051618.tar|'${final_path_to_contrail_command_tar_file}'|' config/command_servers.yml
sed -i 's|'\<IP\ Address\>'|'$1'|' config/command_servers.yml
sed -i 's|localhost|'$1'|' config/command_servers.yml
sed -i 's|latest|'$2'|' config/command_servers.yml

# Install Contrail_command container
ansible-playbook playbooks/deploy.yml -v 
iptables --flush


