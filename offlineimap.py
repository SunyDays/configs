#!/usr/bin/python
import re, os

def get_password_emacs(machine, login, port):
    s = "machine %s login %s port %s password ([^ ]*)\n" % (machine, login, port)
    p = re.compile(s)
    authinfo = os.popen("gpg --pinentry-mode loopback --batch --passphrase-file ~/.gpg_pass -d ~/.authinfo.gpg").read()
    return p.search(authinfo).group(1)
