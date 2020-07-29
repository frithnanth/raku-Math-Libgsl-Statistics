-[![Build Status](https://travis-ci.org/frithnanth/raku-Math-Libgsl-Statistics.svg?branch=master)](https://travis-ci.org/frithnanth/raku-Math-Libgsl-Statistics)
[![Actions Status](https://github.com/frithnanth/raku-Math-Libgsl-Statistics/workflows/test/badge.svg)](https://github.com/frithnanth/raku-Math-Libgsl-Statistics/actions)

NAME
====

Math::Libgsl::Statistics - An interface to libgsl, the Gnu Scientific Library - Statistics

SYNOPSIS
========

```perl6
use Math::Libgsl::Statistics;

my @data = ^10;
say "mean = { mean(@data) }, variance = { variance(@data) }";
```

DESCRIPTION
===========

Math::Libgsl::Statistics is an interface to the Statistics functions of libgsl, the Gnu Scientific Library.

The functions in this module come in 10 data types:

  * Math::Libgsl::Statistics (default: num64)

  * Math::Libgsl::Statistics::Num32

  * Math::Libgsl::Statistics::Int8

  * Math::Libgsl::Statistics::Int16

  * Math::Libgsl::Statistics::Int32

  * Math::Libgsl::Statistics::Int64

  * Math::Libgsl::Statistics::UInt8

  * Math::Libgsl::Statistics::UInt16

  * Math::Libgsl::Statistics::UInt32

  * Math::Libgsl::Statistics::UInt64

All the following functions are available in the modules correspondiing to each datatype, except where noted.

### mean(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the arithmetic mean of @data.

### variance(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the estimated variance of @data. This function computes the mean, if you already computed the mean, use the next function.

### variance-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride)

This function returns the sample variance of @data relative to the given value of $mean.

### sd(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the estimated standard deviation of @data.

### sd-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the sample standard deviation of @data relative to the given value of $mean.

### tss(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the total sum of squares (TSS) of @data.

### tss-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the total sum of squares (TSS) of @data relative to the given value of $mean.

### variance-with-fixed-mean(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes an unbiased estimate of the variance of @data when the population mean $mean of the underlying distribution is known a priori.

### sd-with-fixed-mean(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function calculates the standard deviation of @data for a fixed population mean $mean.

### absdev(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the absolute deviation from the mean of @data.

### absdev-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the absolute deviation of the dataset @data relative to the given value of $mean.

### skew(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the skewness of @data.

### skew-m-sd(@data!, Num() $mean!, Num() $sd!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the skewness of the dataset @data using the given values of the mean $mean and standard deviation $sd,

### kurtosis(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the kurtosis of @data.

### kurtosis-m-sd(@data!, Num() $mean!, Num() $sd!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the kurtosis of the dataset @data using the given values of the mean $mean and standard deviation $sd,

### autocorrelation(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the lag-1 autocorrelation of the dataset @data.

### autocorrelation-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the lag-1 autocorrelation of the dataset @data using the given value of the mean $mean.

### covariance(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num)

This function computes the covariance of the datasets @data1 and @data2.

### covariance-m(@data1!, @data2! where *.elems == @data1.elems, Num() $mean1!, Num() $mean2!, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num)

This function computes the covariance of the datasets @data1 and @data2 using the given values of the means, $mean1 and $mean2.

### correlation(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num)

This function efficiently computes the Pearson correlation coefficient between the datasets @data1 and @data2.

### spearman(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num)

This function computes the Spearman rank correlation coefficient between the datasets @data1 and @data2.

### wmean(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the weighted mean of the dataset @data using the set of weights @w. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wvariance(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the estimated variance of the dataset @data using the set of weights @w. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wvariance-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the estimated variance of the weighted dataset @data using the given weighted mean $wmean. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wsd(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the standard deviation of the weighted dataset @data. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wsd-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the standard deviation of the weighted dataset @data using the given weighted mean $wmean. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wvariance-with-fixed-mean(@w!, @data!, Num() $mean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes an unbiased estimate of the variance of the weighted dataset @data when the population mean $mean of the underlying distribution is known a priori. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wsd-with-fixed-mean(@w!, @data!, Num() $mean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes an unbiased estimate of the standard deviation of the weighted dataset @data when the population mean $mean of the underlying distribution is known a priori. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wtss(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the weighted total sum of squares (TSS) of @data. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wtss-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the weighted total sum of squares (TSS) of @data when the population mean $mean of the underlying distribution is known a priori. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wabsdev(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted absolute deviation from the weighted mean of @data. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wabsdev-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the absolute deviation of the weighted dataset @data about the given weighted mean $wmean. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wskew(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted skewness of the dataset @data. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wskew-m-sd(@w!, @data!, Num() $wmean!, Num() $wsd!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted skewness of the dataset @data using the given values of the weighted mean and weighted standard deviation, $wmean and $wsd. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wkurtosis(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted kurtosis of the dataset @data. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### wkurtosis-m-sd(@w!, @data!, Num() $wmean!, Num() $wsd!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted kurtosis of the dataset @data using the given values of the weighted mean and weighted standard deviation, $wmean and $wsd. This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

### smax(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the maximum value in @data.

### smin(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the minimum value in @data.

### sminmax(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> List)

This function returns both the minimum and maximum values in @data in a single pass.

### smax-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int)

This function returns the index of the maximum value in @data.

### smin-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int)

This function returns the index of the minimum value in @data.

### sminmax-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> List)

This function returns the indexes of the minimum and maximum values in @data in a single pass.

### median-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

This function returns the median value of @sorted-data.

### median(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the median value of @data.

### quantile-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Num() $percentile!, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

This function returns a quantile value of @sorted-data. The quantile is determined by the $percentile, a fraction between 0 and 1. For example, to compute the value of the 75th percentile $percentile should have the value 0.75.

### select(@data!, Int() $k, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function finds the k-th smallest element of the input array @data.

### trmean-from-sorted-data(Num() $alpha, @sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

This function returns the trimmed mean of @sorted-data.

### gastwirth-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

This function returns the Gastwirth location estimator of @sorted-data.

### mad0(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

### mad(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the median absolute deviation of @data. The mad0 function calculates the MAD statistic without the bias correction scale factor.

### Sn0-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

### Sn-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

These functions return the Sₙ statistic of @sorted-data. The Sn0 function calculates the Sₙ statistic without the bias correction scale factors.

### Qn0-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

### Qn-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

These functions return the Qₙ statistic of @sorted-data. The Qn0 function calculates the Qₙ statistic without the bias correction scale factors.

C Library Documentation
=======================

For more details on libgsl see [https://www.gnu.org/software/gsl/](https://www.gnu.org/software/gsl/). The excellent C Library manual is available here [https://www.gnu.org/software/gsl/doc/html/index.html](https://www.gnu.org/software/gsl/doc/html/index.html), or here [https://www.gnu.org/software/gsl/doc/latex/gsl-ref.pdf](https://www.gnu.org/software/gsl/doc/latex/gsl-ref.pdf) in PDF format.

Prerequisites
=============

This module requires the libgsl library to be installed. Please follow the instructions below based on your platform:

Debian Linux and Ubuntu 20.04
-----------------------------

    sudo apt install libgsl23 libgsl-dev libgslcblas0

That command will install libgslcblas0 as well, since it's used by the GSL.

Ubuntu 18.04
------------

libgsl23 and libgslcblas0 have a missing symbol on Ubuntu 18.04. I solved the issue installing the Debian Buster version of those three libraries:

  * [http://http.us.debian.org/debian/pool/main/g/gsl/libgslcblas0_2.5+dfsg-6_amd64.deb](http://http.us.debian.org/debian/pool/main/g/gsl/libgslcblas0_2.5+dfsg-6_amd64.deb)

  * [http://http.us.debian.org/debian/pool/main/g/gsl/libgsl23_2.5+dfsg-6_amd64.deb](http://http.us.debian.org/debian/pool/main/g/gsl/libgsl23_2.5+dfsg-6_amd64.deb)

  * [http://http.us.debian.org/debian/pool/main/g/gsl/libgsl-dev_2.5+dfsg-6_amd64.deb](http://http.us.debian.org/debian/pool/main/g/gsl/libgsl-dev_2.5+dfsg-6_amd64.deb)

Installation
============

To install it using zef (a module management tool):

    $ zef install Math::Libgsl::Statistics

AUTHOR
======

Fernando Santagata <nando.santagata@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2020 Fernando Santagata

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

