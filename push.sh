#!/bin/bash -ex
cd $(dirname $0)
jekyll build --incremental
rsync -avu ./_site/ jacob.hoffman-andrews.com:/var/www/README/
