from testapi import *

def run(self):
    assert_screen('boot-menu', 'openqa-desktop'])
    if match_has_tag('boot-menu'):
        send_key('ret')
    assert_screen('openqa-desktop', 500)