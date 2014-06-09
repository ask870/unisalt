haproxy:
  pkg:
    - installed
  service.enabled:
    - require:
      - file: /etc/default/haproxy
      - pkg: haproxy

/etc/monit/conf.d/haproxy.monit:
  file.managed:
    - watch_in:
      - service: monit
    - source: salt://haproxy/files/haproxy.monit

/etc/default/haproxy:
  file.managed:
    - source: salt://haproxy/files/haproxy

/etc/haproxy/haproxy.cfg:
  file.managed:
    - require:
      - pkg: haproxy
    - watch_in:
      - service: haproxy
    - source: salt://haproxy/files/haproxy.cfg
    - template: jinja

