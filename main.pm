#!/usr/bin/perl -w
use strict;
use testapi;
use autotest;
use needle;
use File::Find;

sub loadtest($) {
    my ($test) = @_;
    autotest::loadtest(get_var("CASEDIR") . "/tests/$test");
}

# subs for test types
sub load_update_tests(){
    loadtest "update/boot.pm";
    loadtest "update/zypper_dup.pm";
    loadtest "update/reboot.pm";
}

sub load_osautoinst_tests(){
    loadtest "osautoinst/worker.pm";
    loadtest "osautoinst/start_test.pm";
    loadtest "osautoinst/test_running.pm";
}

sub load_openQA_tests(){
    loadtest "openQA/dashboard.pm";
    loadtest "openQA/login.pm";
    loadtest "openQA/build_results.pm";
    loadtest "openQA/test_live.pm";
    loadtest "openQA/test_results.pm";
    loadtest "openQA/tests.pm";
    loadtest "openQA/admin.pm";
}

# load tests in the right order
load_update_tests_tests();
load_osautoinst_tests();
load_openQA_tests();

1;