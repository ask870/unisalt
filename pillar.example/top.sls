base:
  '*':
    - servers.{{ '.'.join(grains['id'].lower().split('.')|reverse) }}
    - keys.administrators
    - keys.developers
    - mail

