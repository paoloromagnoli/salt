//Get SDDC
salt-call vmc_sddc.get hostname=vmc.vmware.com refresh_key=KoKZRM6BDp41CKAq7jfq3k50vAwDmL2WRi1stIne53ceHbYfBC26fLdjdGTKIXnd authorization_host=console.cloud.vmware.com org_id=e270bed2-741c-4195-ac0d-6d95d9ee6e5c verify_ssl=False cert=None

//Get Security Group
salt-call vmc_security_groups.get hostname=nsx-13-36-28-79.rp.vmwarevmc.com refresh_key=KoKZRM6BDp41CKAq7jfq3k50vAwDmL2WRi1stIne53ceHbYfBC26fLdjdGTKIXnd authorization_host=console.cloud.vmware.com org_id=e270bed2-741c-4195-ac0d-6d95d9ee6e5c sddc_id=ff215dca-e989-468e-aa93-a8f7f5287ac7 domain_id=cgw verify_ssl=False cert=None 

//UI -> Groups
salt-call vmc_security_groups.create hostname=nsx-13-36-28-79.rp.vmwarevmc.com refresh_key=KoKZRM6BDp41CKAq7jfq3k50vAwDmL2WRi1stIne53ceHbYfBC26fLdjdGTKIXnd authorization_host=console.cloud.vmware.com org_id=e270bed2-741c-4195-ac0d-6d95d9ee6e5c sddc_id=ff215dca-e989-468e-aa93-a8f7f5287ac7 domain_id=cgw security_group_id=paolo verify_ssl=False cert=None 

//UI ->  Gateway Firewall
salt-call vmc_security_rules.create hostname=nsx-13-36-28-79.rp.vmwarevmc.com refresh_key=KoKZRM6BDp41CKAq7jfq3k50vAwDmL2WRi1stIne53ceHbYfBC26fLdjdGTKIXnd authorization_host=console.cloud.vmware.com org_id=e270bed2-741c-4195-ac0d-6d95d9ee6e5c sddc_id=ff215dca-e989-468e-aa93-a8f7f5287ac7 rule_id=paolo_rule domain_id=cgw source_groups=["/infra/domains/cgw/groups/paolo"] destination_groups=["ANY"] services=["/infra/services/SSH"] action=ALLOW logged=true verify_ssl=False cert=None 


//Delete Rule
salt-call vmc_security_rules.delete hostname=nsx-13-36-28-79.rp.vmwarevmc.com refresh_key=KoKZRM6BDp41CKAq7jfq3k50vAwDmL2WRi1stIne53ceHbYfBC26fLdjdGTKIXnd authorization_host=console.cloud.vmware.com org_id=e270bed2-741c-4195-ac0d-6d95d9ee6e5c sddc_id=ff215dca-e989-468e-aa93-a8f7f5287ac7 rule_id=paolo_rule domain_id=cgw verify_ssl=False cert=None 

//Delete Group
salt-call vmc_security_groups.delete hostname=nsx-13-36-28-79.rp.vmwarevmc.com refresh_key=KoKZRM6BDp41CKAq7jfq3k50vAwDmL2WRi1stIne53ceHbYfBC26fLdjdGTKIXnd authorization_host=console.cloud.vmware.com org_id=e270bed2-741c-4195-ac0d-6d95d9ee6e5c sddc_id=ff215dca-e989-468e-aa93-a8f7f5287ac7 domain_id=cgw security_group_id=paolo verify_ssl=False cert=None 