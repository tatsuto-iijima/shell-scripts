Describe 'unixtime2datetime.sh'
  Include lib/unixtime2datetime.sh

  It 'unixtime is 0000000000'
    When call unixtime2datetime 0000000000
    The output should equal 'Thu Jan 1 00:00:00 UTC 1970'
  End

  It 'unixtime is 00000a00000'
    When run unixtime2datetime 00000a00000
    The error should equal 'Error: Invalid unixtime'
    The status should be failure
  End

  It 'standard call'
    When call unixtime2datetime 1682508880
    The output should equal 'Wed Apr 26 11:34:40 UTC 2023'
  End

  It 'timezone is JST-9'
    When call unixtime2datetime 1682508880 JST-9
    The output should equal 'Wed Apr 26 20:34:40 JST 2023'
  End

  It 'format is +%Y-%m-%dT%H:%M:%S%z'
    When call unixtime2datetime 1682508880 '' +%Y-%m-%dT%H:%M:%S%z
    The output should equal '2023-04-26T11:34:40+0000'
  End

  It 'format is +%Y-%m-%dT%H:%M:%S%z with timezone JST-9'
    When call unixtime2datetime 1682508880 JST-9 +%Y-%m-%dT%H:%M:%S%z
    The output should equal '2023-04-26T20:34:40+0900'
  End
End