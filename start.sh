#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -F -u varnish \
  -f $VCL_CONFIG \
  -s file,/tmp/varnishcache.bin,$CACHE_SIZE \
  $VARNISHD_PARAMS"
