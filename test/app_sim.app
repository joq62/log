{application, app_sim,
 [{description, "An OTP application"},
  {vsn, "0.1.0"},
  {registered, []},
  {mod, {app_sim_app, []}},
  {applications,
   [kernel,
    stdlib
   ]},
  {env,[{app_sim, [{main_log_dir,"logs"},
  	   {provider_log_dir,"logs/test_log"},
	   {log_file,"test_file.log"},
	   {log_file_path,"logs/test_log/test_file.log"},
	   {max_log_length,500}
	   ]}]},
  {modules, []},

  {licenses, ["Apache 2.0"]},
  {links, []}
 ]}.
