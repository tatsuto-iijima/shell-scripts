# my-shell-scripts

![CI](https://github.com/tatsuto-iijima/my-shell-scripts/actions/workflows/test.yml/badge.svg)

A collection of shell scripts

## Requirements

The supported platforms are as follows:
- Ubuntu 22.04
- RHEL 8

## Scripts

### pingconv.sh

- Script to convert UNIXTIME in ping command to datetime format.
- Receive the output of the ping command on standard input.

```
Usage:
  pingconv.sh [-jh]

Options:
  -j  Convert UNIXTIME to JST
  -h  Show help
```