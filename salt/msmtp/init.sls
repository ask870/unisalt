msmtp:
  pkg.installed:
    - name: msmtp-mta

/etc/msmtprc:
  file.managed:
    - require:
      - pkg: msmtp
    - source: salt://msmtp/files/msmtprc
    - template: jinja

