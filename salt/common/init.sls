root:
  ssh_auth.present:
    - user: root
    - names:
{% for key in pillar['keys']['administrators'] %}
      - {{ key }}
{% endfor %}

/etc/hostname:
  file.managed:
    - contents: {{ grains['id'] }}

