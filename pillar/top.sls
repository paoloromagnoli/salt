base:
  'os:CentOS':
    - match: grain
    - /pillar/centosdefaults
  'os:Ubuntu':
    - match: grain
    - /pillar/ubuntudefaults
  'os:Windows':
    - match: grain
    - /pillar/windowsdefaults