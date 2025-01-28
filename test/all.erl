%%% -------------------------------------------------------------------
%%% @author  : Joq Erlang
%%% @doc: : 
%%% Created :
%%% Node end point  
%%% Creates and deletes Pods
%%% 
%%% API-kube: Interface 
%%% Pod consits beams from all services, app and app and sup erl.
%%% The setup of envs is
%%% -------------------------------------------------------------------
-module(all).      
 
-export([start/0]).
-include("log.api").

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
start()->
   
    ok=setup(),
    ok=test_logging(),
    ok=log_read_test:start(),
      
              
    io:format("Test OK !!! ~p~n",[?MODULE]),


%    init:stop(),
%    timer:sleep(2000),
 
    ok.

   
%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
setup()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
      %% Ensure that log file will end up on home dir
    {ok,HomeDir}=case os:getenv("HOME") of
		     false -> 
			 {error,["Environment variable HOME not set"]};
		     Path -> 
			 {ok,Path}
		 end, 
    RootLogDir=filename:join(HomeDir,?MainLogDir),
    file:del_dir_r(RootLogDir),  
    ok=application:start(log),
    pong=log:ping(),
    
    ok.

   
%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
test_logging()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
 
 
    ?LOG_DEBUG("debug",["debug_data"]), 
    ?LOG_NOTICE("notice",["notice_data"]),
    ?LOG_WARNING("warning ",["warning_data"]),
    ?LOG_ALERT("alert ",["alert_data"]),
    ok.
