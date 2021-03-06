#!/usr/bin/env php
<?php
// This script will copy a pre-commit hook from this repo to a developers local git
// The pre-commit hook will be run whenever a developer runs "git commit"
// This script will run after running composer install, via the "post-install-cmd" in composer.json
$gitHookFilename = __DIR__ . '/../.git/hooks/pre-commit';
$shellHookFilename = __DIR__ . '/pre-commit.sh';
if (file_exists($gitHookFilename)) {
    unlink($gitHookFilename);
}
copy($shellHookFilename, $gitHookFilename);
chmod($gitHookFilename, 0744);
