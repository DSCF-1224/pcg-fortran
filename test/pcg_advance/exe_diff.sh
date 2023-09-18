#!/bin/sh -e
diff -s -q build/mcg_8.dat ../../reference/pcg_advance/mcg_8.dat
# diff -s -q build/mcg_16.dat ../../reference/pcg_advance/mcg_16.dat
# diff -s -q build/mcg_32.dat ../../reference/pcg_advance/mcg_32.dat
# diff -s -q build/mcg_64.dat ../../reference/pcg_advance/mcg_64.dat

diff -s -q build/oneseq_8.dat ../../reference/pcg_advance/oneseq_8.dat
# diff -s -q build/oneseq_16.dat ../../reference/pcg_advance/oneseq_16.dat
# diff -s -q build/oneseq_32.dat ../../reference/pcg_advance/oneseq_32.dat
# diff -s -q build/oneseq_64.dat ../../reference/pcg_advance/oneseq_64.dat

diff -s -q build/setseq_8.dat ../../reference/pcg_advance/setseq_8.dat
# diff -s -q build/setseq_16.dat ../../reference/pcg_advance/setseq_16.dat
# diff -s -q build/setseq_32.dat ../../reference/pcg_advance/setseq_32.dat
# diff -s -q build/setseq_64.dat ../../reference/pcg_advance/setseq_64.dat

diff -s -q build/unique_8.dat ../../reference/pcg_advance/unique_8.dat
# diff -s -q build/unique_16.dat ../../reference/pcg_advance/unique_16.dat
# diff -s -q build/unique_32.dat ../../reference/pcg_advance/unique_32.dat
# diff -s -q build/unique_64.dat ../../reference/pcg_advance/unique_64.dat

# # bash: ./exe_diff.sh: Permission denied
# $ chmod +x ./exe_diff.sh

# EOF
