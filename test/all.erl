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

-define(LogFile,"test/logs_short.txt").
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
    ok=read_log_test(),
    ok=log_test:start(),    
              
    io:format("Test OK !!! ~p~n",[?MODULE]),
    init:stop(),
    timer:sleep(2000),
 
    ok.

%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
read_log_test()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),

    {ok,Bin}=file:read_file(?LogFile),
    String=erlang:binary_to_list(Bin),
    NoBreaks=string:lexemes(String,"\n"),
    [io:format("Str =>> ~p~n",[Str])||Str<-NoBreaks],
    Lines=[string:lexemes(Str,"|")||Str<-NoBreaks],
    [io:format(" Line = ~p~n",[Line])||Line<-Lines],
    

   init:stop(),
    timer:sleep(2000),
    
    ok. 
    
%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------


setup()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),

    ok=application:start(log),
    pong=log:ping(),
    
    ok.
