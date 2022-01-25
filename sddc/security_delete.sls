#Delete a new Security Rule
security_rule_delete:
  vmc_security_rules.absent:
    - hostname: {{ pillar['nsx_hostname'] }} 
    - refresh_key: {{ pillar['refresh_key'] }} 
    - authorization_host: {{ pillar['authorization_host'] }} 
    - org_id: {{ pillar['org_id'] }} 
    - sddc_id: {{ pillar['sddc_id'] }} 
    - verify_ssl: False 
    - cert: None
    - rule_id: paolo_rule 
    - domain_id: cgw

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
    - requires:
      - security_rule_delete