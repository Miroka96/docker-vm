#!/bin/bash -e

`dirname $0`/../docker-vm.sh anton-ssh 5000 `dirname $0`/authorized_keys -v anton-data:/data
