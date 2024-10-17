#!/bin/bash
grep -E "smtpd_tls_security_level|smtpd_use_tls" /etc/postfix/main.cf
