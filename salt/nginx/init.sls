nginx:
  pkgrepo.managed:
    - ppa: nginx/stable
  pkg.installed:
    - require:
       - pkgrepo: nginx
  service.running:
    - require:
       - pkg: nginx

/etc/monit/conf.d/nginx.monit:
  file.managed:
    - watch_in:
      - service: monit
    - source: salt://nginx/files/nginx.monit

{% for file in [ 'nginx', 'fpm', 'hhvm', 'wordpress', 'bjarneproxy', 'stage1', 'sslproxy' ] %}
/etc/nginx/{{ file }}.conf:
  file.managed:
    - watch_in:
      - service: nginx
    - source: salt://nginx/files/{{ file }}.conf
    - template: jinja
{% endfor %}

/var/cache/nginx:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: true

/var/www/.ssh:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: true

/var/www/.ssh/authorized_keys:
  file.managed:
    - user: root
    - group: root
    - mode: 644

www-data:
  user.present:
    - requires:
      - pkg: nginx
    - shell: /usr/lib/sftp-server
  ssh_auth.present:
    - requires:
      - user: www-data
      - file: /var/www/.ssh/authorized_keys
    - user: www-data
    - names:
{% for key in pillar['keys']['developers'] %}
      - {{ key }}
{% endfor %}
{% for key in pillar['keys']['administrators'] %}
      - {{ key }}
{% endfor %}

