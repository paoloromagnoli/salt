# install kubectl on Ubuntu 18.04 bionic

#setup the kubectl repository

# install packages needed to use the Kubernetes apt repository
install_prerequisites:
 pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl

# download the Google Cloud public signing key
# sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
add_k8s_keyring_gpg_file:
  file.managed:
    - name: /usr/share/keyrings/kubernetes-archive-keyring.gpg
    - source: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - source_hash: ff834d1e179c3727d9cd3d0c8dad763b0710241f1b64539a200fbac68aebff3e
    - mode: 644
    - requires:
      - install_prerequisites

# set up the Kubernetes repository
# echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
install_k8s_repo:
  pkgrepo.managed:
    - humanname: Kubernetes Stable Repository
    - name: deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main
    - file: /etc/apt/sources.list.d/kubernetes.list
    - requires:
      - add_k8s_keyring_gpg_file

# install kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management
install_kubectl:
  pkg.installed:
    - name: kubectl
    - required:
      - install_k8s_repo