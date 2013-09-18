#
# Cookbook Name:: glance
# Recipe:: api
#
#

include_recipe "#{@cookbook_name}::common"

heat_service "api"

node[:heat][:monitor][:svcs] <<["heat-api"]

