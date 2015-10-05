#!/bin/bash -x

if [[ "$MYID" ]]; then
	cat /tmp/zookeeper/myid | sed \
		-e "s|{{MYID}}|${MYID}|g" \
		 > /tmp/zookeeper/myid
fi

echo "Starting zookeeper"
exec /opt/zookeeper/bin/zkServer.sh
