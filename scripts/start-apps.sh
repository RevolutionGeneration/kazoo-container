#!/bin/sh

cd $(dirname $0)

ROOT=$PWD/..

export ERL_CRASH_DUMP=$ROOT/$(date +%s)_ecallmgr_erl_crash.dump
export ERL_LIBS="$ERL_LIBS":$ROOT/deps:$ROOT/core:$ROOT/applications:$(echo $ROOT/deps/rabbitmq_erlang_client-*/deps)

NODE_NAME=${1:-whistle_apps}

exec erl \
     -name $NODE_NAME \
     -args_file /etc/kazoo/vm.args \
     -detached
     -s reloader