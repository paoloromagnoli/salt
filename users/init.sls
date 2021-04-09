{% from 'users/map.jinja' import users with context %}

{% for user in users %}
create_user_{{ user.username }}
  user.present:
    - name: {{ user.username }}
    - uid: {{ user.uid }}
    - hash_password: False
{% endfor %}}