define :heat_service do

  heat_name="heat-#{params[:name]}"

  service heat_name do
    if (platform?("ubuntu") && node.platform_version.to_f >= 10.04)
      restart_command "restart #{heat_name}"
      stop_command "stop #{heat_name}"
      start_command "start #{heat_name}"
      status_command "status #{heat_name} | cut -d' ' -f2 | cut -d'/' -f1 | grep start"
    end
    supports :status => true, :restart => true
    action [:enable, :start]
    subscribes :restart, resources(:template => node[:heat][:config_file])
  end

end
