glusterfs:
  pkgrepo.managed:
    - ppa: semiosis/ubuntu-glusterfs-3.5
  pkg.installed:
    - require:
      - pkgrepo: glusterfs
    - pkgs:
      - glusterfs-server
      - glusterfs-client
  service.running:
    - require:
      - pkg: glusterfs
    - name: glusterfs-server

/etc/init/glusterfs-mount.conf:
  file.managed:
    - source: salt://glusterfs/files/glusterfs-mount.conf
 
