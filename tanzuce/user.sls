# create  user for TCE

# create tce user
create_tce_user:
  user.present:
    - name: tce
    - home: /home/tce
    - empty_password: True
    - groups:
      - sudo

# prevent user login with password
# prevent_user_login:
#  cmd.run:
#    - name: passwd -l tce

# add user to password-less sudoers
create_sudoers_file:
  file.managed:
    - name: /etc/sudoers.d/tce
    - contents:
      - tce ALL=(ALL) NOPASSWD:ALL

# make user parametric
create_docker_group:
  group.present:
    - name: docker
    - addusers:
      - tce