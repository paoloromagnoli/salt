#Delete a Security Group
group_delete:
  module.run:
    - name: vmc_security_groups.delete
    - hostname: {{ pillar['nsx_hostname'] }} 
    - refresh_key: {{ pillar['refresh_key'] }} 
    - authorization_host: {{ pillar['authorization_host'] }} 
    - org_id: {{ pillar['org_id'] }} 
    - sddc_id: {{ pillar['sddc_id'] }} 
    - domain_id: cgw 
    - verify_ssl: False 
    - cert: None 
    - security_group_id: paolo