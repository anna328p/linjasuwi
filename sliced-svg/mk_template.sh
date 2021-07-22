#!/usr/bin/env bash

rm -rf output
mkdir -p output

rm -f template.svg
touch template.svg

cp ../sitelenpona.svg input.svg

cat input.svg | head -n 2 >template.svg
cat >>template.svg <<EOF
   width="1000px"
   height="1000px"
   viewBox="%OX% %OY% 20 20"
EOF
cat input.svg | tail -n +6 >>template.svg
