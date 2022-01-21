#Create a new Security Rule
ensure_security_rule:
  vmc_security_rules.absent:
    - hostname: nsx-13-36-28-79.rp.vmwarevmc.com 
    - refresh_key: KoKZRM6BDp41CKAq7jfq3k50vAwDmL2WRi1stIne53ceHbYfBC26fLdjdGTKIXnd 
    - authorization_host: console.cloud.vmware.com 
    - org_id: e270bed2-741c-4195-ac0d-6d95d9ee6e5c 
    - sddc_id: ff215dca-e989-468e-aa93-a8f7f5287ac7 
    - verify_ssl: False 
    - cert: None
    - rule_id: paolo_rule 
    - domain_id: cgw
    - logged: true 