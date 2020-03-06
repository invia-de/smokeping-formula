{% from "smokeping/map.jinja" import smokeping with context %}

smokeping_cfg:
  file.managed:
    - name: /etc/smokeping/config
    - source: salt://smokeping/files/config
    - template: jinja
    - user: root
    - watch_in:
      - service: smokeping
    - require:
      - pkg: smokeping

{% for config in ['General', 'Database', 'Alerts', 'Presentation', 'Probes', 'pathnames'] %}
smokeping_config_d_{{config}}:
  file.managed:
    - name: /etc/smokeping/config.d/{{ config }}
    - source: salt://smokeping/files/{{ config }}
    - template: jinja
    - user: root
    - watch_in:
      - service: smokeping
{% endfor %}    

smokeping_config_d_targets:
  file.managed:
    - name: /etc/smokeping/config.d/Targets
    - source: salt://smokeping/files/Targets
    - template: jinja
    - user: root
    - watch_in:
      - service: smokeping
