{% from 'config/users/map.jinja' import users with context %}

{% for user in users %}
create_user_{{ user.username }}:
  user.present:
    - name: {{ user.username }}
    - uid: {{ user.uid }}
    - password: {{ user.password }}
    - groups:
      - wheels

#add_user_{{ user.username }}_to_sudoers:
#  file.append:
#    - name: /etc/sudoers
#    - text:
#      - "{{ user.username }}  ALL=(ALL) NOPASSWD: ALL"
{% endfor %}}