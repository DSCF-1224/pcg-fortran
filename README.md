# PCG Random Number Generation, Fortran Edition

This is a PCG implemented in Fortran 2008.</br>
(C is used for testing only.)</br>
This library is based on [PCG implemented in C](https://github.com/imneme/pcg-c).



## Implementation

The `iso_fortran_env` intrinsic `MODULE` does not have support for `int128`,
so this library does not implement PCGs requiring `int128`.

### Output function : `RXS M`

|state   |result  |`mcg`   |`oneseq`|`setseq`|`unique`|
|:------:|:------:|:------:|:------:|:------:|:------:|
|`int16` |`int8`  |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int32` |`int16` |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int64` |`int32` |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int128`|`int64` |&#x2717;|&#x2717;|&#x2717;|&#x2717;|

### Output function : `RXS M XS`

|state   |result  |`mcg`   |`oneseq`|`setseq`|`unique`|
|:------:|:------:|:------:|:------:|:------:|:------:|
|`int8`  |`int8`  |&#x2717;|&#x2713;|&#x2713;|&#x2713;|
|`int16` |`int16` |&#x2717;|&#x2713;|&#x2713;|&#x2713;|
|`int32` |`int32` |&#x2717;|&#x2713;|&#x2713;|&#x2713;|
|`int64` |`int64` |&#x2717;|&#x2713;|&#x2713;|&#x2713;|
|`int128`|`int128`|&#x2717;|&#x2717;|&#x2717;|&#x2717;|

### Output function : `XSH RR`

|state   |result  |`mcg`   |`oneseq`|`setseq`|`unique`|
|:------:|:------:|:------:|:------:|:------:|:------:|
|`int16` |`int8`  |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int32` |`int16` |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int64` |`int32` |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int128`|`int64` |&#x2717;|&#x2717;|&#x2717;|&#x2717;|

### Output function : `XSH RS`

|state   |result  |`mcg`   |`oneseq`|`setseq`|`unique`|
|:------:|:------:|:------:|:------:|:------:|:------:|
|`int16` |`int8`  |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int32` |`int16` |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int64` |`int32` |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int128`|`int64` |&#x2717;|&#x2717;|&#x2717;|&#x2717;|

### Output function : `XSL RR`

|state   |result  |`mcg`   |`oneseq`|`setseq`|`unique`|
|:------:|:------:|:------:|:------:|:------:|:------:|
|`int64` |`int32` |&#x2713;|&#x2713;|&#x2713;|&#x2713;|
|`int128`|`int64` |&#x2717;|&#x2717;|&#x2717;|&#x2717;|

### Output function : `XSL RR RR`

|state   |result  |`mcg`   |`oneseq`|`setseq`|`unique`|
|:------:|:------:|:------:|:------:|:------:|:------:|
|`int64` |`int64` |&#x2717;|&#x2713;|&#x2713;|&#x2713;|
|`int128`|`int128`|&#x2717;|&#x2717;|&#x2717;|&#x2717;|



## Testing

In order to validate the implementation of this module,
we do a comparison with the [original C implementation](https://github.com/imneme/pcg-c).

- [`pcg_*_*_rxs_m_*_random_r`](https://github.com/DSCF-1224/pcg-fortran/tree/develop/test/pcg_random_number_rxs_m)
- [`pcg_*_*_rxs_m_xs_*_random_r`](https://github.com/DSCF-1224/pcg-fortran/tree/develop/test/pcg_random_number_rxs_m_xs)
- [`pcg_*_*_xsh_rr_*_random_r`](https://github.com/DSCF-1224/pcg-fortran/tree/develop/test/pcg_random_number_xsh_rr)
- [`pcg_*_*_xsh_rs_*_random_r`](https://github.com/DSCF-1224/pcg-fortran/tree/develop/test/pcg_random_number_xsh_rs)
- [`pcg_*_*_xsl_rr_*_random_r`](https://github.com/DSCF-1224/pcg-fortran/tree/develop/test/pcg_random_number_xsl_rr)
- [`pcg_*_*_xsl_rr_rr_*_random_r`](https://github.com/DSCF-1224/pcg-fortran/tree/develop/test/pcg_random_number_xsl_rr_rr)

<!-- EOF -->
