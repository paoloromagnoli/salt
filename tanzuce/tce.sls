# install Tanzu Community Edition on Ubuntu 18.04 bionic

# create a directory to download the TCE release tar
create_directory:
  file.directory:
    - name: /tmp/tce
    - mode: 755
    - makedirs: True

# Download the TCE release from githb
#curl -H "Accept: application/vnd.github.v3.raw" -L https://api.github.com/repos/vmware-tanzu/community-edition/contents/hack/get-tce-release.sh | bash -s <RELEASE-VERSION> <RELEASE-OS-DISTRIBUTION>
download_tce:
  file.managed:
    - name: /tmp/tce/tce-linux-amd64-v0.10.0.tar.gz
    - source: https://github.com/vmware-tanzu/community-edition/releases/download/v0.10.0/tce-linux-amd64-v0.10.0.tar.gz
    - source_hash: ff834d1e179c3727d9cd3d0c8dad763b0710241f1b64539a200fbac68aebff3e
    - mode: 644
    - requires:
      - create_directory

# untar the TCE release
extract_tce:
  archive.extracted:
    - name: /tmp/tce
    - source: /tmp/tce/tce-linux-amd64-v0.10.0.tar.gz
    - options: xzvf
    - requires:
      - download_tce

# run the install script
run_tce_installer:
  cmd.run:
    - name: /tmp/tce/tce-linux-amd64-v0.10.0/install.sh
    - requires: 
      - extract_tce
