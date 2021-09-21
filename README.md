## bpm-tools: Tempo (Beats Per Minute) analysis tools

(C) Copyright 2013 Mark Hills <mark@xwax.org>

See the COPYING file for licensing terms.

This software is distributed from the following site:

  - http://www.pogo.org.uk/~mark/bpm-tools/

The build is controlled via Makefile variables. In general
you should be able to build using:

```bash
$ make
$ make install
```

To change the target prefix, for example:

```bash
$ make install PREFIX=/opt/bpm-tools
```

The Makefile picks up additional variables from a .config file
in the source directory. You will prefer to use this if you want
to control build flags for testing and debugging.

---

### Fixes

* Fixed _id3v2_: invalid option `-R`, replaced with `-l`

---

### Usage

_Mark has written a great bpm scanner:_

```
bpm-tag (C) Copyright 2012 Mark Hills <mark@xwax.org>

    Usage: bpm-tag [options] <file>
    Tag an audio file with tempo (in beats-per-minute, BPM)

      -f   Ignore existing BPM value
      -n   Display BPM only, don't tag
      -m   Minimum detected BPM
      -x   Maximum detected BPM
      -h   Display this help message and exit
```

The bpm-tag script in bpm-tools works on one file at a time.

To batch tag in the current directory do this

```bash
  $ find ./ -type f -print0 | xargs -0 -n1 bpm-tag
```

If you want to scan annother directory replace ./ with the folder you want to scan.

If you have a multicore machine try this, it will run 4 instances in parallel:

```bash
  $ find ./ -type f -print0 | xargs -0 -n1 -P4 bpm-tag
```
