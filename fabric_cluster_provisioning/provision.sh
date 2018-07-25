final_token=$(python fabric_cluster_bringup.py template_contrail_fabric_cluster_sanity.json get_x_auth_token)
sleep 10
echo $final_token
resp=$(python fabric_cluster_bringup.py template_contrail_fabric_cluster_sanity.json add_servers $final_token)
if [ "$resp" == 'Passed' ]
then
    echo "Sucessfully added servers .. "
else
    echo $resp; exit
fi

prov_resp=$(python fabric_cluster_bringup.py template_contrail_fabric_cluster_sanity.json start_ansible_provisioning $final_token)
if [ "$prov_resp" == 'Passed' ]
then
    echo "Started provisioning via contrail command .. "
else
    echo $prov_resp; exit
fi

status_resp="NO_STATE"
while [ "$status_resp" != 'CREATED' ]; do
    echo $status_resp
    status_resp=$(python fabric_cluster_bringup.py template_contrail_fabric_cluster_sanity.json get_provisioning_status $final_token)
    sleep 120
done
if [ "$status_resp" == 'CREATED' ]
then
    echo "Provisioning completed successfully via contrail command .. "
else
    echo "Provisioning Failed"; exit
fi
