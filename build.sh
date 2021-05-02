#!/usr/bin/env bash

set -Eeuo pipefail

R --vanilla --quiet --no-echo -e 'devtools::document()'
R --vanilla --quiet --no-echo -e 'devtools::install()'
