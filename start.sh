#!/bin/bash

set -e
CACHE_FILE=/tmp/varnishcache.bin

if [ ! -f $CACHE_FILE ]; then
	echo Creating new cache file at $CACHE_FILE with the size $CACHE_SIZE to prevent fragmentation.
	dd if=/dev/zero of=$CACHE_FILE bs=1 count=0 seek=$CACHE_SIZE
fi

exec bash -c \
  "exec varnishd -F -u varnish \
  -f $VCL_CONFIG \
  -s file,$CACHE_FILE,$CACHE_SIZE \
  $VARNISHD_PARAMS"
