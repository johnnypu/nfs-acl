# NFS ACL Example on OpenShift

This project demonstrates how to isolate access between two Pods using NFS + POSIX ACLs.


## The Architecture as below

![image](https://github.com/user-attachments/assets/cc18aef5-32ff-4165-9d38-e911d17b47cd)


## Project Structure
- Namespace: `nfs-acl`
- Pod A: UID/GID 1001 → `/var/nfsshare/pod-a`
- Pod B: UID/GID 1002 → `/var/nfsshare/pod-b`
- NFS Server IP: `192.168.0.22`

## Steps to Deploy

```bash
oc apply -f manifests/namespace.yaml
oc apply -f manifests/serviceaccount.yaml
bash scc-bind.sh
oc apply -f manifests/pv-pod-a.yaml
oc apply -f manifests/pvc-pod-a.yaml
oc apply -f manifests/pod-a.yaml
oc apply -f manifests/pv-pod-b.yaml
oc apply -f manifests/pvc-pod-b.yaml
oc apply -f manifests/pod-b.yaml

