name "heat-server"
description "Heat Server Role"
run_list(
         "recipe[heat::api]",
         "recipe[heat::monitor]"
)
default_attributes()
override_attributes()

