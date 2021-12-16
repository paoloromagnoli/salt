#see example https://docs.saltproject.io/salt/extensions/salt-ext-modules-vmware/en/latest/ref/states/saltext.vmware.states.vmc_security_rules.html

ensure_security_rule:
  vmc_security_rules.present:
    - hostname: sample-nsx.vmwarevmc.com                #The host name of NSX-T manager
    - refresh_key: 7jPSGSZpCa8e5Ouks4UY5cZyOtynAhF      #API Token of the user which is used to get the Access Token required for VMC operations
    - authorization_host: console-stg.cloud.vmware.com  #Hostname of the VMC cloud console
    - org_id: 10e1092f-51d0-473a-80f8-137652c39fd0
    - sddc_id: b43da080-2626-f64c-88e8-7f31d9d2c306
    - domain_id: mgw                                    #The domain_id for which the security rule should belong to. Possible values: mgw, cgw. Both source_groups and destination_groups can not be [ANY] when domain_id=mgw
    - rule_id: vCenter_Inbound_Rule_2                   #Id of the security_rule to be added to SDDC. 
    - verify_ssl: False                                 #(Optional) Option to enable/disable SSL verification. Enabled by default. If set to False, the certificate validation is skipped
    - cert: /path/to/client/certificate                 #(Optional) Path to the SSL client certificate file to connect to VMC Cloud Console. The certificate can be retrieved from browser
    - source_groups: foo                                 #(Optional) List of Source group paths. We need paths as duplicate names may exist for groups under different domains. Along with paths we support IP Address of type IPv4 and IPv6. IP Address can be in one of the format(CIDR, IP Address, Range of IP Address). In order to specify all groups, use the constant ANY. This is case insensitive. If ANY is used, it should be the ONLY element in the group array. Error will be thrown if ANY is used in conjunction with other values. If this value is not passed, then [ANY] will be used by default. 
    - destination_groups: foo                           #(Optional) List of Destination group paths. We need paths as duplicate names may exist for groups under different domains. Along with paths we support IP Address of type IPv4 and IPv6. IP Address can be in one of the format(CIDR, IP Address, Range of IP Address). In order to specify all groups, use the constant ANY. This is case insensitive. If ANY is used, it should be the ONLY element in the group array. Error will be thrown if ANY is used in conjunction with other values. If this value is not passed, then [ANY] will be used by default.
    - services: foo                                     #(Optional) Names of services. In order to specify all services, use the constant ANY. This is case insensitive. If ANY is used, it should be the ONLY element in the services array. Error will be thrown if ANY is used in conjunction with other values. If this value is not passed, then [ANY] will be used by default.
    - scope: foo                                        #(Optional) The list of policy paths where the rule is applied LR/Edge/T0/T1/LRP etc. Note that a given rule can be applied on multiple LRs/LRPs.
    - action: foo                                       #(Optional) The action to be applied to all the services. Possible Values for domain_id=cgw are: ALLOW, DROP, REJECT Possible Values for domain_id=mgw are: ALLOW
    - tag: foo                                          #(Optional) Tag applied on the rule. User level field which will be printed in CLI and packet logs.
    - logged: true                                      #(Optional) Enable logging flag. Flag to enable packet logging. Default is disabled.
    - disabled: false                                   #(Optional) Flag to disable the rule. Default is enabled
    - notes: "put notes here"                           #(Optional) Text for additional notes on changes.
    - sequence_number: 0                                #(Optional) Sequence number of the Rule. This field is used to resolve conflicts between multiple Rules under Security or Gateway Policy for a Domain. If no sequence number is specified by the user, a value of 0 is assigned by default. If there are multiple rules with the same sequence number then their order is not deterministic. If a specific order of rules is desired, then one has to specify unique sequence numbers.
    - tags: foo                                         #(Optional) Opaque identifiers meaningful to the user.
    - display_name: foo                                 #Identifier to use when displaying entity in logs or GUI. This is applicable for only update scenario. For create scenario, display_name would be same as rule_id.
