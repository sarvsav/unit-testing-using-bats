#!/usr/bin/env bats

load test_helper
load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

MAINSCRIPT="$BATS_TEST_DIRNAME/../src/main.bash"

source "$MAINSCRIPT"

@test "TestMain: must be executable" {
  existsAndExecutable "$MAINSCRIPT"
}

@test "TestGreet_user: print welcome message" {
    run greet "sarvsav"
    
    assert_equal "$status" 0
    assert_output "Welcome, sarvsav"
}

@test "TestShowuser_user: print user details" {
    

    function curl() {
        echo "\"name\":sarvsav"
    }
    export -f curl
    
    run showuser "sarvsav"
    
    assert_equal "$status" 0
    assert_output "sarvsav"
    unset curl
}