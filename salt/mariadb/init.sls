mariadb:
  pkgrepo.managed:
    - name: 'deb http://mirror.netcologne.de/mariadb/repo/10.0/ubuntu trusty main'
    - keyid: '0xcbcb082a1bb943db'
    - keyserver: 'keyserver.ubuntu.com'
  pkg.installed:
    - require:
      - pkgrepo: mariadb
    - pkgs:
{% if 'cluster' in pillar['roles'] %}
      - mariadb-galera-server
      - galera
{% else %}
      - mariadb-server
{% endif %}
      - mariadb-client
  service.running:
    - name: mysql
    - require:
      - pkg: mariadb

