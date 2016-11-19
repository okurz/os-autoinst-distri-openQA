use strict;
use base "openQAcoretest";
use testapi;

sub run {
    validate_script_output "openqa-client jobs state=running", sub { m/"running"/ };
    save_screenshot;
    type_string "clear\n";
}

sub post_fail_hook {
    assert_script_run 'openqa-client jobs';
}

sub test_flags {
    # continue with other tests as we could use their information for
    # debugging in case of failures.
    return { important => 1 };
}

1;
