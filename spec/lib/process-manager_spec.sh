Describe 'process-manager.sh'
  Include lib/process-manager.sh

  cleanup() {
    if [ -f /var/run/hoge.pid ]; then
      kill $(cat /var/run/hoge.pid)
      rm /var/run/hoge.pid
    fi
  }
  setup() {
    watch date > /dev/null &
    echo $! > /var/run/hoge.pid
  }

  Describe 'start_process'
    AfterEach cleanup

    It 'Error test with no arguments'
      When run start_process  # Error tests need to be executed with ‘run’
      The status should be failure
      The error should equal 'Error: No argument "scriptname" specified'
    End

    It 'Error test when only one argument is specified'
      When run start_process hoge  # Error tests need to be executed with ‘run’
      The status should be failure
      The error should equal 'Error: No argument "command" specified'
    End

    It 'Normal execution'
      When run start_process hoge 'watch date'
      The status should be success
      The output should match pattern 'Starting hoge...?hoge started with PID [0-9]*'
      The path /var/run/hoge.pid should be exist
    End

    Describe 'Reuire setup'
      BeforeEach setup

      It 'Error test when already running'
        When run start_process hoge 'watch date'  # Error tests need to be executed with ‘run’
        The status should be failure
        The error should equal 'Error: hoge is already running'
      End
    End
  End

  Describe 'stop_process'
    Describe 'Require setup & cleanup'
      BeforeEach setup
      AfterEach cleanup

      It 'Error test with no arguments'
        When run stop_process  # Error tests need to be executed with ‘run’
        The status should be failure
        The error should equal 'Error: No argument "scriptname" specified'
      End
    End

    Describe 'Require setup & cleanup'
      BeforeEach setup

      It 'Normal execution'
        When run stop_process hoge
        The status should be success
        The output should match pattern 'Stopping hoge...?hoge stopped'
        The path /var/run/hoge.pid should not be exist
      End
    End

    Describe 'Require setup & cleanup'
      AfterEach cleanup

      It 'Error test when not running'
        When run stop_process hoge  # Error tests need to be executed with ‘run’
        The status should be failure
        The error should equal 'Error: hoge is not running'
      End
    End
  End

  Describe '~ status_process'
    AfterEach cleanup

    It '~ Error test with no arguments'
      When run status_process  # Error tests need to be executed with ‘run’
      The status should be failure
      The error should equal 'Error: No argument "scriptname" specified'
    End

    Describe '~ Require setup & cleanup'
      BeforeEach setup

      It '~ Normal execution with running'
        When call status_process hoge
        The status should be success
        The output should match pattern 'hoge is running with PID [0-9]*'
        The path /var/run/hoge.pid should be exist
      End
    End

    It '~ Normal execution with not running'
      When call status_process hoge
      The status should be success
      The output should match pattern 'hoge is not running'
      The path /var/run/hoge.pid should not be exist
    End
  End
End