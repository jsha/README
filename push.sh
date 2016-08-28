#!/bin/bash -ex
cd $(dirname $0)
git push jsha master
jekyll build --incremental
rsync -avu ./_site/ jacob.hoffman-andrews.com:/var/www/README/
