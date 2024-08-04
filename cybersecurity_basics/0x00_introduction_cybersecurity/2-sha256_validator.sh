#!/bin/bash
sha256sum -c --quiet <<<"$2  $1"
