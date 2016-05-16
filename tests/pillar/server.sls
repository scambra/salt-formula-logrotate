logrotate:
  server:
    enabled: true
    job:
      rsyslog:
        - files:
            - /var/log/mail.info
            - /var/log/mail.warn
            - /var/log/mail.err
            - /var/log/mail.log
            - /var/log/daemon.log
            - /var/log/kern.log
            - /var/log/auth.log
            - /var/log/user.log
            - /var/log/lpr.log
            - /var/log/cron.log
            - /var/log/debug
            - /var/log/messages
          options:
            - rotate: 4
            - weekly
            - missingok
            - notifempty
            - compress
            - delaycompress
            - sharedscripts
            - postrotate: "reload rsyslog >/dev/null 2>&1 || true"
        - files:
            - /var/log/syslog
          options:
            - rotate: 7
            - daily
            - missingok
            - notifempty
            - delaycompress
            - compress
            - postrotate: "reload rsyslog >/dev/null 2>&1 || true"
