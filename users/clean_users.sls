#run this state file to clean centos vm after a demo

{% from 'users/map.jinja' import users with context %}

{% for user in users %}
delete_user_{{ user.username }}
  user.delete:
    - name: {{ user.username }}
    - remove: true
    - force: true
{% endfor %}}