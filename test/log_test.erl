%%% -------------------------------------------------------------------
%%% @author  : Joq Erlang
%%% @doc: : 
%%% Created :
%%% Node end point  
%%% Creates and deletes Pods
%%% 
%%% API-kube: Interface §
%%% Pod consits beams from all services, app and app and sup erl.
%%% The setup of envs is
%%% -------------------------------------------------------------------
-module(log_test).   
 
-export([start/0
	]).

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include("log.api").


%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
start()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
    ok=setup(),
    ok=logging(),
    ok=read_test(),

    io:format("Test SUCCEDED OK!!!! ~p~n",[{?MODULE,?FUNCTION_NAME}]),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
logging()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
  
    ok=?LOG_DEBUG("debug_1",[]),
    ok=?LOG_NOTICE("notice_1",[]),
    ok=?LOG_WARNING("warning_1",[{a,1},atom]),    
    ok=?LOG_ALERT("alert_1",[]),
    
    Term={error,[eexists,{?MODULE,?FUNCTION_NAME}]},
    R= io_lib:format("~p",[Term]),
    TermAsStering=lists:flatten(R),
    ok=?LOG_ALERT(TermAsStering,[]),

    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
read_test()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
    
    [
     {_,'do_test@c50',_,log_test,logging,_,"\"debug_1\"",[]}
    ]=log:raw(debug),

    [
     {_,'do_test@c50',_,log_test,logging,_,"\"notice_1\"",[]},
     {_,'do_test@c50',_,log,init,_,"\"Server started \"",[]}
    ]=log:raw(notice),

    [
     {_,'do_test@c50',_,log_test,logging,_,"\"warning_1\"",[{a,1},atom]}
    ]=log:raw(warning),
    
    [
     {_,'do_test@c50',_,log_test,logging,_,"\"{error,[eexists,{log_test,logging}]}\"",[]},
     {_,'do_test@c50',_,log_test,logging,_,"\"alert_1\"",[]}
    ]=log:raw(alert),

    ok.
    

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
setup()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
   
    

    ok.
