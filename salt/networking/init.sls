/etc/network/interfaces:
  file.managed:
    - source: salt://networking/files/interfaces

{% if 'static' in pillar %}

/etc/network/interfaces.d/dhcp:
  file.absent

/etc/network/interfaces.d/static:
  file.managed:
    - source: salt://networking/files/static
    - template: jinja

{% else %}

/etc/network/interfaces.d/dhcp:
  file.managed:
    - source: salt://networking/files/dhcp
    - template: jinja

/etc/network/interfaces.d/static:
  file.absent

{% endif %}

{% if 'private_ip' in pillar %}
/etc/network/interfaces.d/private:
  file.managed:
    - source: salt://networking/files/private
    - template: jinja
{% endif %}

