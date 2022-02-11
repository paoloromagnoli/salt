# RHEL/CentOS 6, 7 and 8 include PostgreSQL by default 
# RHEL/Rocky Linux/OL 8     -> 13, 12, 10 and 9.6 via modules
# RHEL/CentOS/SL/OL 7       -> 9.2
# RHEL/CentOS/SL/OL 6       -> 8.4

install_postgresql:
  pkg.installed:
    - pkgs: 
      - postgresql-server
      - postgresql-client

start_postgresql:
  service.running:
    - name: postgresql
    - enable: True
    - requires:
      - install_postgresql