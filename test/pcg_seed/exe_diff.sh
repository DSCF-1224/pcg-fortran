#!/bin/sh -e
diff -s -q build/mcg_8.dat ../../reference/pcg_srandom/mcg_8.dat
diff -s -q build/mcg_16.dat ../../reference/pcg_srandom/mcg_16.dat
diff -s -q build/mcg_32.dat ../../reference/pcg_srandom/mcg_32.dat
diff -s -q build/mcg_64.dat ../../reference/pcg_srandom/mcg_64.dat

diff -s -q build/oneseq_8.dat ../../reference/pcg_srandom/oneseq_8.dat
diff -s -q build/oneseq_16.dat ../../reference/pcg_srandom/oneseq_16.dat
diff -s -q build/oneseq_32.dat ../../reference/pcg_srandom/oneseq_32.dat
diff -s -q build/oneseq_64.dat ../../reference/pcg_srandom/oneseq_64.dat

diff -s -q build/setseq_8.dat ../../reference/pcg_srandom/setseq_8.dat
diff -s -q build/setseq_16.dat ../../reference/pcg_srandom/setseq_16.dat
diff -s -q build/setseq_32.dat ../../reference/pcg_srandom/setseq_32.dat
diff -s -q build/setseq_64.dat ../../reference/pcg_srandom/setseq_64.dat

diff -s -q build/unique_8.dat ../../reference/pcg_srandom/unique_8.dat
diff -s -q build/unique_16.dat ../../reference/pcg_srandom/unique_16.dat
diff -s -q build/unique_32.dat ../../reference/pcg_srandom/unique_32.dat
diff -s -q build/unique_64.dat ../../reference/pcg_srandom/unique_64.dat

# # bash: ./exe_diff.sh: Permission denied
# $ chmod +x ./exe_diff.sh

# EOF
