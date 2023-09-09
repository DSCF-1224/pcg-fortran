#!/bin/sh -e
diff -s -q build/16_8.dat ../../reference/pcg_output_xsh_rs/16_8.dat
diff -s -q build/32_16.dat ../../reference/pcg_output_xsh_rs/32_16.dat

# # bash: ./exe_diff.sh: Permission denied
# $ chmod +x ./exe_diff.sh

# EOF
