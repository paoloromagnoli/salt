base:
  'kernel:Linux':
    - match: grain
    - /config/users
  'os:CentOS and application:apache':
    - match: grain
    - /applications/apache
  'os:CentOS and application:nginx':
    - match: grain
    - /applications/nginx
  'os:CentOS and application:mysql':
    - match: grain
    - /applications/mysql
  'os:CentOS and application:mongodb':
    - match: grain
    - /applications/mongodb