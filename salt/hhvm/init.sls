hhvm:
  pkgrepo.managed:
    - name: 'deb http://dl.hhvm.com/ubuntu trusty main'
    - key_url: 'http://dl.hhvm.com/conf/hhvm.gpg.key'
  pkg.installed:
    - require:
      - pkgrepo: hhvm
      - pkgrepo: mariadb
  service.running:
    - require:
      - pkg: hhvm
    - enable: True

/etc/monit/conf.d/hhvm.monit:
  file.managed:
    - watch_in:
      - service: monit
    - source: salt://hhvm/files/hhvm.monit

/etc/hhvm/server.ini:
  file.managed:
    - watch_in:
      - service: hhvm
    - source: salt://hhvm/files/server.ini

/etc/hhvm/php.ini:
  file.managed:
    - watch_in:
      - service: hhvm
    - source: salt://php5/files/php.ini

/etc/default/hhvm:
  file.managed:
    - watch_in:
      - service: hhvm
    - source: salt://hhvm/files/hhvm
    - template: jinja

