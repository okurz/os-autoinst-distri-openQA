use strict;
use base "openQAcoretest";
use testapi;
use utils;

sub run {
    diag('worker setup');
    assert_script_run('zypper --no-cd --non-interactive --gpg-auto-import-keys in os-autoinst',   600);
    assert_script_run('zypper --no-cd --non-interactive --gpg-auto-import-keys in openQA-worker', 600);
    diag('Login once with fake authentication on openqa webUI to actually create preconfigured API keys for worker authentication');
    assert_script_run('curl http://localhost/login');
    diag('adding temporary, preconfigured API keys to worker config');
    type_string('cat >> /etc/openqa/client.conf <<EOF
[localhost]
key = 1234567890ABCDEF
secret = 1234567890ABCDEF
EOF
');
    wait_still_screen(1);
    my $worker_setup = <<'EOF';
systemctl start openqa-worker@1
systemctl status --no-pager openqa-worker@1
systemctl enable openqa-worker@1
EOF
    assert_script_run($_) foreach (split /\n/, $worker_setup);
    save_screenshot;
    type_string "clear\n";
}

1;

