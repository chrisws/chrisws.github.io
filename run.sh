#!/bin/bash
# tidy -q -m pages/*.html
(cd _build && make clean && make && cd -) && ../SmallBASIC/src/platform/web/sbasicw

