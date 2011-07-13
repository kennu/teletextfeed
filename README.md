# Teletext Feed
Copyright (C) 2011 Kenneth Falck <kennu@iki.fi>

This is a client for the Finnish YLE teletext API at http://blogit.yle.fi/kehitys-kehittyy/ylen-avoin-data-rajapinta-ylen-teksti-tvhen.

To use this code for anything, you need to request an API key from YLE (contact info available in the above blog post).

This project has three parts:

* Generic Ruby library for accessing the teletext API
* Generic Ruby library for parsing the teletext pages
* Rails application to collect pages from the feed and provide modified pages as an Atom feed, an RSS feed, via PubSubHubbub notifications and as Twitter updates.

