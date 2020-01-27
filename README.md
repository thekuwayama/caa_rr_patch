# caa_rr_patch

[![Actions Status](https://github.com/thekuwayama/caa_rr_patch/workflows/CI/badge.svg)](https://github.com/thekuwayama/caa_rr_patch/actions?workflow=CI)
[![Maintainability](https://api.codeclimate.com/v1/badges/48c9eeb9b52f0dc63cb6/maintainability)](https://codeclimate.com/github/thekuwayama/caa_rr_patch/maintainability)

`caa_rr_patch` is the patch that adds CAA Resource Record.


## Quick Start

```bash
$ git clone git@github.com:thekuwayama/caa_rr_patch.git

$ cd caa_rr_patch

$ irb -I ./lib
irb(main):001:0> require 'caa_rr_patch'
=> true
```


## Usage

You can resolve CAA resources.

```bash
$ irb -I ./lib
irb(main):001:0> require 'caa_rr_patch'
=> true
irb(main):002:1* Resolv::DNS.new.getresources(
irb(main):003:1*   "google.com",
irb(main):004:1*   Resolv::DNS::Resource::IN::CAA
irb(main):005:0> ) { |rr| pp rr }
=> [#<Resolv::DNS::Resource::IN::CAA:0x00007fb6cc19da90 @flags="\x00", @tag="issue", @value="pki.goog", @ttl=75538>]
```


## License

The library is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
