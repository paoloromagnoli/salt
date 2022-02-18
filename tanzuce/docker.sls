# install docker on Ubuntu
# https://docs.docker.com/engine/install/ubuntu/

# pre requisites
#   - python-apt package is required to be installed. To check if this package is installed, run dpkg -l python-apt. python-apt will need to be manually installed if it is not present.

# uninstall old versions
uninstall_old_versions:
  pkg.removed:
    - pkgs: 
      - docker
      - docker-engine
      - docker.io 
      - containerd 
      - runc

# set up the Docker repository
install_pre_reques_packages:
  pkg.installed:
    - pkgs:
      - ca-certificates
      - curl
      - gnupg
      - lsb-release

add_keyring_gpg_file:
  file.managed:
    - name: /usr/share/keyrings/docker-archive-keyring.gpg
    - source: https://download.docker.com/linux/ubuntu/gpg

install_docker_repo:
  pkgrepo.managed:
    - humanname: Docker Stable Repository
    - name: deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu bionic stable
    - dist: stable
    - file: /etc/apt/sources.list.d/docker.list
