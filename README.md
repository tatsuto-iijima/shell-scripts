# my-shell-scripts

![CI](https://github.com/tatsuto-iijima/my-shell-scripts/actions/workflows/test.yml/badge.svg)

A collection of shell scripts

## Requirements

The supported platforms are as follows:
- AlmaLinux 8
- AlmaLinux 9
- AmazonLinux 2023
- Debian 11
- Debian 12
- RHEL 8
- RHEL 9
- Ubuntu 22.04
- Ubuntu 24.04

## Scripts

### pingconv

- Script to convert UNIXTIME in ping command to datetime format.
- Receive the output of the ping command on standard input.

```
Usage:
  pingconv [-jh]

Options:
  -j  Convert UNIXTIME to JST
  -h  Show help
```

### listmd5

- A script that outputs an MD5 list of each file based on the file list received as standard input.

```
Usage:
  listmd5
```
