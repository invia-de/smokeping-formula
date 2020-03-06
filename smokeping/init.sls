{% from "smokeping/map.jinja" import smokeping with context %}

smokeping:
  pkg.installed:
    - pkgs: {{ smokeping.lookup.pkg }}

  service.running:
    - name: smokeping
    - enable: True
    - require:
      - pkg: smokeping
