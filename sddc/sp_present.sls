ensure_security_rule:
  vmc_security_rules.present:
    - hostname: sample-nsx.vmwarevmc.com                
    - refresh_key: 7jPSGSZpCa8e5Ouks4UY5cZyOtynAhF      
    - authorization_host: console-stg.cloud.vmware.com  
    - org_id: 10e1092f-51d0-473a-80f8-137652c39fd0
    - sddc_id: b43da080-2626-f64c-88e8-7f31d9d2c306
    - domain_id: mgw                                    
    - rule_id: vCenter_Inbound_Rule_2                   
    - verify_ssl: False                                 
    - cert: /path/to/client/certificate                 
    - source_group: foo                                 
    - destination_groups: foo                           
    - services: foo                                     
    - scope: foo                                        
    - action: foo                                       
    - tag: foo                                          
    - logged: true                                      
    - disabled: false                                   
    - notes: "put notes here"                           
    - sequence_number: 0                                
    - tags: foo                                         
    - display_name: foo
