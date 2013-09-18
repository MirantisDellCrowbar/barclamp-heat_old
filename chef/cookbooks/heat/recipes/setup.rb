#
# Cookbook Name:: Heat
# Recipe:: setup
#

include_recipe "#{@cookbook_name}::common"

bash "tty linux setup" do
  cwd "/tmp"
  user "root"
  code <<-EOH
	mkdir -p /var/lib/heat/
	curl #{node[:heat][:tty_linux_image]} | tar xvz -C /tmp/
	touch /var/lib/heat/tty_setup
  EOH
  not_if do File.exists?("/var/lib/heat/tty_setup") end
end
