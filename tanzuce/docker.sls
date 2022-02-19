# install docker on Ubuntu 18.04 bionic
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
install_required_packages:
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
    - source_hash: 1500c1f56fa9e26b9b8f42452a553675796ade0807cdce11975eb98170b3a570
    - mode: 644
    - requires:
      - install_required_packages

# make arch and release parametric
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
install_docker_repo:
  pkgrepo.managed:
    - humanname: Docker Stable Repository
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ grains['oscodename'] }} stable
    - file: /etc/apt/sources.list.d/docker.list
    - requires:
      - add_keyring_gpg_file

install_docker:
  pkg.installed:
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io
    - requires:
      - install_docker_repo

# make user parametric
create_docker_group:
  group.present:
    - name: docker
    - addusers:
      - seiberia
