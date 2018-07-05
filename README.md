# CWP Project skeleton

Base starter code for a CWP 2.0 project

## Setup

1. Clone the project
2. Run `composer install` to pull in the required dependencies defined in `composer.lock`
3. Setup a `.env` file
4. Run `framework/sake dev/build` from the web root to setup your database tables
5. Ensure you have Solr running locally and available at `http://localhost:8983/solr` (or you will need to update config values on the `Solr` class to point to the path you have it running). If you have the `fulltextsearch-localsolr` module installed you can `cd fulltextsearch-localsolr && ./start.sh` to start a Solr server locally (check the `fulltextsearch-localsolr/README.md` for more information).
6. Run `framework/sake dev/tasks/Solr_Configure` and then `framework/sake dev/tasks/Solr_Reindex` to setup the Solr indexes locally.
7. You should be good to start using the website locally.

## Theme Development

All theme development has been done in the 'app' theme, this pulls in the styles from watea and starter.
If existing templates need to be customised, they should be copied across into the 'app' theme to override it.
Because the 'app' theme pulls in styles from watea and starter, you must install the node_modules from the starter theme to build out dist files.

We are using [https://github.com/JeffreyWay/laravel-mix](laravel-mix) for the build tooling and you can follow these
steps to makes CSS and JS changes:

1. Navigate to the 'starter' theme
2. Run `yarn install` to install the required dependencies
3. Navigate to the 'china' theme
4. Run `yarn install` to install the required dependencies
5. Run `yarn watch` to watch for any changes
6. Make CSS and JS changes
7. Test changes from automatically built development assets

You can also use `yarn build` to do a single build of development assets.

## Releases

To package production assets for a release, run the release script `.tools/release.sh`

## License

    Copyright (c) 2007-2018, SilverStripe Limited - www.silverstripe.com
    All rights reserved.

    Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

        * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
        * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the
          documentation and/or other materials provided with the distribution.
        * Neither the name of SilverStripe nor the names of its contributors may be used to endorse or promote products derived from this software
          without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
    LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
    GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
    STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
    OF SUCH DAMAGE.
