base:
  '*':
    - common
    - networking
    - monit
    - msmtp
  'roles:balancer':
    - match: pillar
    - heartbeat
    - haproxy
  'roles:web':
    - match: pillar
    - mariadb
    - nginx
    - hhvm
    - php5
  'roles:cluster':
    - match: pillar 
    - xfs
    - glusterfs

