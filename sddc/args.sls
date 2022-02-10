#Framework to run command into states
group_present:
  module.run:
    - name: vmc_sddc.get_vcenter_detail
    - hostname: vmc.vmware.com
    - refresh_key: {{ pillar['refresh_key'] }} 
    - authorization_host: {{ pillar['authorization_host'] }} 
    - org_id: {{ pillar['org_id'] }} 
    - sddc_id: {{ pillar['sddc_id'] }} 
    - verify_ssl: False 
    - cert: None