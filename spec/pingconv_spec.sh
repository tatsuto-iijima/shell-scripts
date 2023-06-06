Describe 'pingconv'
  It 'show help'
    When run ./bin/pingconv -h
    The line 1 should equal 'pingconv'
    The line 2 should equal '==============='
    The line 3 should equal ''
    The line 4 should equal 'Script to convert UNIXTIME in ping command to datetime format.'
    The line 5 should equal 'Receive the output of the ping command on standard input.'
    The line 6 should equal ''
    The line 7 should equal 'Usage:'
    The line 8 should equal '  pingconv [-jh]'
    The line 9 should equal ''
    The line 10 should equal 'Options:'
    The line 11 should equal '  -j  Convert UNIXTIME to JST'
    The line 12 should equal '  -h  Show help'
    The status should be success
  End

  It 'wrong option'
    When run ./bin/pingconv -a
    The error should include 'pingconv'
    The error should include '==============='
    The error should include 'Script to convert UNIXTIME in ping command to datetime format.'
    The error should include 'Receive the output of the ping command on standard input.'
    The error should include 'Usage:'
    The error should include 'pingconv [-jh]'
    The error should include 'Options:'
    The error should include '-j  Convert UNIXTIME to JST'
    The error should include '-h  Show help'
    The status should be failure
  End

  It 'no conversion'
    Data
    #|PING localhost (127.0.0.1) 56(84) bytes of data.
    #|64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.227 ms
    #|64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.230 ms
    #|64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.283 ms
    #|64 bytes from localhost (127.0.0.1): icmp_seq=4 ttl=64 time=0.425 ms
    #|64 bytes from localhost (127.0.0.1): icmp_seq=5 ttl=64 time=0.248 ms
    #|64 bytes from localhost (127.0.0.1): icmp_seq=6 ttl=64 time=0.251 ms
    #|64 bytes from localhost (127.0.0.1): icmp_seq=7 ttl=64 time=0.404 ms
    #|64 bytes from localhost (127.0.0.1): icmp_seq=8 ttl=64 time=0.322 ms
    #|64 bytes from localhost (127.0.0.1): icmp_seq=9 ttl=64 time=0.411 ms
    #|64 bytes from localhost (127.0.0.1): icmp_seq=10 ttl=64 time=0.263 ms
    #|
    #|--- localhost ping statistics ---
    #|10 packets transmitted, 10 received, 0% packet loss, time 9199ms
    #|rtt min/avg/max/mdev = 0.227/0.306/0.425/0.074 ms
    End
    When run ./bin/pingconv
    The line 1 should equal 'PING localhost (127.0.0.1) 56(84) bytes of data.'
    The line 2 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.227 ms'
    The line 3 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.230 ms'
    The line 4 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.283 ms'
    The line 5 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=4 ttl=64 time=0.425 ms'
    The line 6 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=5 ttl=64 time=0.248 ms'
    The line 7 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=6 ttl=64 time=0.251 ms'
    The line 8 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=7 ttl=64 time=0.404 ms'
    The line 9 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=8 ttl=64 time=0.322 ms'
    The line 10 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=9 ttl=64 time=0.411 ms'
    The line 11 should equal '64 bytes from localhost (127.0.0.1): icmp_seq=10 ttl=64 time=0.263 ms'
    The line 12 should equal ''
    The line 13 should equal '--- localhost ping statistics ---'
    The line 14 should equal '10 packets transmitted, 10 received, 0% packet loss, time 9199ms'
    The line 15 should equal 'rtt min/avg/max/mdev = 0.227/0.306/0.425/0.074 ms'
    The status should be success
  End

  It 'standard conversion'
    Data
    #|PING localhost (127.0.0.1) 56(84) bytes of data.
    #|[1682508880.576657] 64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.132 ms
    #|[1682508881.615407] 64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.358 ms
    #|[1682508882.642344] 64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.260 ms
    #|[1682508883.667609] 64 bytes from localhost (127.0.0.1): icmp_seq=4 ttl=64 time=0.255 ms
    #|[1682508884.691604] 64 bytes from localhost (127.0.0.1): icmp_seq=5 ttl=64 time=0.350 ms
    #|[1682508885.716203] 64 bytes from localhost (127.0.0.1): icmp_seq=6 ttl=64 time=0.321 ms
    #|[1682508886.718396] 64 bytes from localhost (127.0.0.1): icmp_seq=7 ttl=64 time=0.312 ms
    #|[1682508887.762228] 64 bytes from localhost (127.0.0.1): icmp_seq=8 ttl=64 time=0.163 ms
    #|[1682508888.784930] 64 bytes from localhost (127.0.0.1): icmp_seq=9 ttl=64 time=0.288 ms
    #|[1682508889.787309] 64 bytes from localhost (127.0.0.1): icmp_seq=10 ttl=64 time=0.348 ms
    #|
    #|--- localhost ping statistics ---
    #|10 packets transmitted, 10 received, 0% packet loss, time 9210ms
    #|rtt min/avg/max/mdev = 0.132/0.278/0.358/0.074 ms
    End
    When run ./bin/pingconv
    The line 1 should equal 'PING localhost (127.0.0.1) 56(84) bytes of data.'
    The line 2 should equal '2023-04-26T11:34:40.576657+0000 64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.132 ms'
    The line 3 should equal '2023-04-26T11:34:41.615407+0000 64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.358 ms'
    The line 4 should equal '2023-04-26T11:34:42.642344+0000 64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.260 ms'
    The line 5 should equal '2023-04-26T11:34:43.667609+0000 64 bytes from localhost (127.0.0.1): icmp_seq=4 ttl=64 time=0.255 ms'
    The line 6 should equal '2023-04-26T11:34:44.691604+0000 64 bytes from localhost (127.0.0.1): icmp_seq=5 ttl=64 time=0.350 ms'
    The line 7 should equal '2023-04-26T11:34:45.716203+0000 64 bytes from localhost (127.0.0.1): icmp_seq=6 ttl=64 time=0.321 ms'
    The line 8 should equal '2023-04-26T11:34:46.718396+0000 64 bytes from localhost (127.0.0.1): icmp_seq=7 ttl=64 time=0.312 ms'
    The line 9 should equal '2023-04-26T11:34:47.762228+0000 64 bytes from localhost (127.0.0.1): icmp_seq=8 ttl=64 time=0.163 ms'
    The line 10 should equal '2023-04-26T11:34:48.784930+0000 64 bytes from localhost (127.0.0.1): icmp_seq=9 ttl=64 time=0.288 ms'
    The line 11 should equal '2023-04-26T11:34:49.787309+0000 64 bytes from localhost (127.0.0.1): icmp_seq=10 ttl=64 time=0.348 ms'
    The line 12 should equal ''
    The line 13 should equal '--- localhost ping statistics ---'
    The line 14 should equal '10 packets transmitted, 10 received, 0% packet loss, time 9210ms'
    The line 15 should equal 'rtt min/avg/max/mdev = 0.132/0.278/0.358/0.074 ms'
    The status should be success
  End

  It 'JST conversion'
    Data
    #|PING localhost (127.0.0.1) 56(84) bytes of data.
    #|[1682508880.576657] 64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.132 ms
    #|[1682508881.615407] 64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.358 ms
    #|[1682508882.642344] 64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.260 ms
    #|[1682508883.667609] 64 bytes from localhost (127.0.0.1): icmp_seq=4 ttl=64 time=0.255 ms
    #|[1682508884.691604] 64 bytes from localhost (127.0.0.1): icmp_seq=5 ttl=64 time=0.350 ms
    #|[1682508885.716203] 64 bytes from localhost (127.0.0.1): icmp_seq=6 ttl=64 time=0.321 ms
    #|[1682508886.718396] 64 bytes from localhost (127.0.0.1): icmp_seq=7 ttl=64 time=0.312 ms
    #|[1682508887.762228] 64 bytes from localhost (127.0.0.1): icmp_seq=8 ttl=64 time=0.163 ms
    #|[1682508888.784930] 64 bytes from localhost (127.0.0.1): icmp_seq=9 ttl=64 time=0.288 ms
    #|[1682508889.787309] 64 bytes from localhost (127.0.0.1): icmp_seq=10 ttl=64 time=0.348 ms
    #|
    #|--- localhost ping statistics ---
    #|10 packets transmitted, 10 received, 0% packet loss, time 9210ms
    #|rtt min/avg/max/mdev = 0.132/0.278/0.358/0.074 ms
    End
    When run ./bin/pingconv -j
    The line 1 should equal 'PING localhost (127.0.0.1) 56(84) bytes of data.'
    The line 2 should equal '2023-04-26T20:34:40.576657+0900 64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.132 ms'
    The line 3 should equal '2023-04-26T20:34:41.615407+0900 64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.358 ms'
    The line 4 should equal '2023-04-26T20:34:42.642344+0900 64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.260 ms'
    The line 5 should equal '2023-04-26T20:34:43.667609+0900 64 bytes from localhost (127.0.0.1): icmp_seq=4 ttl=64 time=0.255 ms'
    The line 6 should equal '2023-04-26T20:34:44.691604+0900 64 bytes from localhost (127.0.0.1): icmp_seq=5 ttl=64 time=0.350 ms'
    The line 7 should equal '2023-04-26T20:34:45.716203+0900 64 bytes from localhost (127.0.0.1): icmp_seq=6 ttl=64 time=0.321 ms'
    The line 8 should equal '2023-04-26T20:34:46.718396+0900 64 bytes from localhost (127.0.0.1): icmp_seq=7 ttl=64 time=0.312 ms'
    The line 9 should equal '2023-04-26T20:34:47.762228+0900 64 bytes from localhost (127.0.0.1): icmp_seq=8 ttl=64 time=0.163 ms'
    The line 10 should equal '2023-04-26T20:34:48.784930+0900 64 bytes from localhost (127.0.0.1): icmp_seq=9 ttl=64 time=0.288 ms'
    The line 11 should equal '2023-04-26T20:34:49.787309+0900 64 bytes from localhost (127.0.0.1): icmp_seq=10 ttl=64 time=0.348 ms'
    The line 12 should equal ''
    The line 13 should equal '--- localhost ping statistics ---'
    The line 14 should equal '10 packets transmitted, 10 received, 0% packet loss, time 9210ms'
    The line 15 should equal 'rtt min/avg/max/mdev = 0.132/0.278/0.358/0.074 ms'
    The status should be success
  End
End