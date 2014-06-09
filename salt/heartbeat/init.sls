heartbeat:
  pkg:
    - installed
  service.running:
    - requires:
      - pkg: pacemaker
      - pkg: heartbeat
    - enable: True

/etc/ha.d/authkeys:
  file.managed:
    - requires:
      - pkg: heartbeat
    - watch_in:
      - service: heartbeat
    - mode: 600
    - source: salt://heartbeat/files/authkeys
    - template: jinja

/etc/ha.d/ha.cf:
  file.managed:
    - requires:
      - pkg: heartbeat
    - watch_in:
      - service: heartbeat
    - source: salt://heartbeat/files/ha.cf
    - template: jinja

/usr/lib/heartbeat/lrmd:
  file.symlink:
    - requires:
      - pkg: heartbeat
    - watch_in:
      - service: heartbeat
    - target: /usr/lib/pacemaker/lrmd
    - backupname: /usr/lib/heartbeat/lrmd-dist

/usr/local/sbin/hb_setup.sh:
  file.managed:
    - mode: 755
    - source: salt://heartbeat/files/hb_setup.sh
    - template: jinja

