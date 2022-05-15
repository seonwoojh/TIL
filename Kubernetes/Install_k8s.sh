# Install k8s(1.22.8) for centos:7

# Setting firewall
sudo firewall-cmd --permanent --add-port=6443/tcp
sudo firewall-cmd --permanent --add-port=10250/tcp
sudo firewall-cmd --permanent --add-port=179/tcp
sudo systemctl restart firewalld

# Add repo
cat << EOF | tee /etc/yum.repos.d/kubernetes.repo\n
[kubernetes]\n
name=Kubernetes\n
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-$basearch\n
enabled=1\n
gpgcheck=0\n
repo_gpgcheck=0\n
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg\n
exclude=kubelet kubeadm kubectl
EOF

# SELinux disable
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# Install k8s version 1.22.8
yum install -y kubeadm-1.22.8-0.x86_64 kubectl-1.22.8-0.x86_64 kubelet-1.22.8-0.x86_64 --disableexcludes=kubernetes

# cgroup driver
cat << EOF | tee /etc/docker/daemon.json\n
{
  "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF

sudo systemctl daemon-reload && sudo systemctl restart kubelet

# admin.conf
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
