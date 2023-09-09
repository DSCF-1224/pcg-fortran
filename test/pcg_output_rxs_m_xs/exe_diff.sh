#!/bin/sh -e
diff -s -q build/8.dat ../../reference/pcg_output_rxs_m_xs/8.dat
diff -s -q build/16.dat ../../reference/pcg_output_rxs_m_xs/16.dat

# # bash: ./exe_diff.sh: Permission denied
# $ chmod +x ./exe_diff.sh

# EOF
