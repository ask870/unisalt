monit:
  pkg.installed:
    - name: monit
  service.running:
    - require:
      - pkg: monit
    - enable: True

/etc/monit/monitrc:
  file.managed:
    - require:
      - pkg: monit
    - watch_in:
      - service: monit
    - source: salt://monit/files/monitrc
    - template: jinja

