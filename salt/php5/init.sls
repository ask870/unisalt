php5:
  pkgrepo.managed:
    - ppa: 'ondrej/php5'
  pkg.installed:
    - watch_in:
      - service: php5
    - require:
      - pkgrepo: mariadb
      - pkgrepo: php5
    - pkgs:
      - php5-cli
      - php5-fpm
      - php5-mcrypt
      - php5-mysql
      - php5-gd
      - php5-curl
  service.running:
    - name: php5-fpm
    - require:
      - pkg: php5
    - enable: True

/etc/monit/conf.d/php5-fpm.monit:
  file.managed:
    - watch_in:
      - service: monit
    - source: salt://php5/files/php5-fpm.monit

/etc/php5/fpm/pool.d/www.conf:
  file.managed:
    - watch_in:
      - service: php5
    - source: salt://php5/files/www.conf

/etc/php5/fpm/php.ini:
  file.managed:
    - watch_in:
      - service: php5
    - source: salt://php5/files/php.ini

