#
# Cookbook:: cookbook-illumio_ven
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

execute 'activate illumio' do
  command '/opt/illumio_ven/illumio-ven-ctl activate ' \
    "--management-server #{node['illumio_ven']['mgmt_uri']}" \
    "--activation-code #{node['illumio_ven']['activation_code']}"
end

package 'illumio-ven' do
  notifies :run, 'execute[activate illumio]', :delayed
end

service 'illumio-ven.service' do
  action :start
end
