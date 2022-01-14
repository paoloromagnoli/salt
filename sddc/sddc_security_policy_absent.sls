#see example https://docs.saltproject.io/salt/extensions/salt-ext-modules-vmware/en/latest/ref/states/saltext.vmware.states.vmc_security_rules.html
# repo check

remove_security_rule:
  vmc_security_rules.absent:
    - hostname: sample-nsx.vmwarevmc.com                #The host name of NSX-T manager
    - refresh_key: 7jPSGSZpCa8e5Ouks4UY5cZyOtynAhF      #API Token of the user which is used to get the Access Token required for VMC operations
    - authorization_host: console-stg.cloud.vmware.com  #Hostname of the VMC cloud console
    - org_id: 10e1092f-51d0-473a-80f8-137652c39fd0
    - sddc_id: b43da080-2626-f64c-88e8-7f31d9d2c306
    - domain_id: mgw                                    #The domain_id for which the security rule should belong to. 
    - rule_id: vCenter_Inbound_Rule_2                   #Id of the security_rule to be removed to SDDC
    - verify_ssl: False                                 #(Optional) Option to enable/disable SSL verification. Enabled by default. If set to False, the certificate validation is skipped
    - cert: /path/to/client/certificate                 #(Optional) Path to the SSL client certificate file to connect to VMC Cloud Console. The certificate can be retrieved from browser
    