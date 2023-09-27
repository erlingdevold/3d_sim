#!/bin/bash
echo "DISPLAY=$DISPLAY"
ls

cd saturn && cargo run  -- config.yaml -v &
cd ..
rm -rf src saturn monox target;
ls;
# cd saturn && cargo run  -- config.yaml -v
# cd ..
echo "Done."
exec bash