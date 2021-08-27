# Copy the reactor.conf on the master

copy_reactor:
  file.managed:
    - name: /srv/salt/top.sls
    - source: salt://top/top.sls

restart_master:
  service.running:
    - name: salt-master
    - watch:
      - copy_reactor