create_folder:
  vmware_folder.manage:
    - name: sddc_extensions
    - task: create
    - dc_name: 'Region A'
    - type: vm