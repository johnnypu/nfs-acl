# 建立資料夾與群組
sudo mkdir -p /var/nfsshare/pod-a /var/nfsshare/pod-b
sudo groupadd -g 1001 pod-a-group
sudo groupadd -g 1002 pod-b-group

# 設定權限與 ACL
sudo chown -R nfsnobody:pod-a-group /var/nfsshare/pod-a
sudo chown -R nfsnobody:pod-b-group /var/nfsshare/pod-b
sudo chmod 770 /var/nfsshare/pod-a /var/nfsshare/pod-b
sudo setfacl -m g:pod-a-group:rwx /var/nfsshare/pod-a
sudo setfacl -m g:pod-b-group:rwx /var/nfsshare/pod-b
sudo setfacl -m o::--- /var/nfsshare/pod-a /var/nfsshare/pod-b

# /etc/exports 設定
cat <<EOF | sudo tee -a /etc/exports
/var/nfsshare/pod-a *(rw,sync,no_subtree_check,no_root_squash)
/var/nfsshare/pod-b *(rw,sync,no_subtree_check,no_root_squash)
EOF

sudo exportfs -r
