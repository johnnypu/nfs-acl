#!/bin/bash

oc adm policy add-scc-to-user hostmount-anyuid -z nfs-sa -n nfs-acl
