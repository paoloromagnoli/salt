#Create a new Security Rule
security_rule_create:
  vmc_security_rules.present:
    - hostname: {{ pillar['nsx_hostname'] }} 
    - refresh_key: {{ pillar['refresh_key'] }} 
    - authorization_host: {{ pillar['authorization_host'] }} 
    - org_id: {{ pillar['org_id'] }} 
    - sddc_id: {{ pillar['sddc_id'] }} 
    - verify_ssl: False 
    - cert: None
    - rule_id: paolo_rule 
    - domain_id: cgw 
    - source_groups: ["/infra/domains/cgw/groups/paolo"] 
    - destination_groups: ["ANY"] 
    - services: ["/infra/services/SSH"] 
    - action: ALLOW 
    - logged: true 