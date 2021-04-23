from testapi import *

def run(self):
    assert_screen(['boot-menu', 'openqa-desktop'])
    if match_has_tag('boot-menu'):
        send_key('ret')
    assert_and_click('openqa-desktop-login', 500)
    select_console('root-console')
    assert_script_run('systemctl start openqa-webui')