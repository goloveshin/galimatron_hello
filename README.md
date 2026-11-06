# galimatron_hello

A minimal GaL project. Open `gal.cfg` and run Galimatron to check that the editor extension and the executable are installed.

`page.xsl` includes `gal-functions.xsl` by `https://github.com/goloveshin/galimatron/xslt/gal-functions.xsl` and reads the tags with `gal:tagvalue`. An installed Galimatron maps that address to `share/galimatron/xslt/gal-functions.xsl`.

`incoming_gal/hello.gal` is a root aggregate with two tags. `counter` starts at 0. `greetings` starts empty. Each run adds one to the counter, writes `Hello world from Galimatron!` into the greeting, and writes `page/hello.html`. The `.gal` file is rewritten in place.
