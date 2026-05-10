#!/bin/bash
if [ "$2  $1" = "$(sha256sum $1)" ]; then  echo $1": OK"; fi
