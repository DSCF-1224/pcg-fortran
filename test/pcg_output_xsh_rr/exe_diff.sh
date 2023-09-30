#!/bin/sh -e
diff -s -q build/16_8.dat ../../reference/pcg_output_xsh_rr/16_8.dat
diff -s -q build/32_16.dat ../../reference/pcg_output_xsh_rr/32_16.dat
diff -s -q build/64_32.dat ../../reference/pcg_output_xsh_rr/64_32.dat

# # bash: ./exe_diff.sh: Permission denied
# $ chmod +x ./exe_diff.sh

# EOF
