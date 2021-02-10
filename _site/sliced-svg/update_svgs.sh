#!/usr/bin/env bash

bash ./mk_template.sh
bash ./process_words.sh
bash ./gen_preview.sh > ../_includes/nimi-ale.html
