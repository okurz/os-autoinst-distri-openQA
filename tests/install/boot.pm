use strict;
use base "openQAcoretest";
use utils;
use testapi qw(record_info);

sub run {
    wait_for_desktop;
    record_info('for test', 'just trying out custom git clone');
}

1;

