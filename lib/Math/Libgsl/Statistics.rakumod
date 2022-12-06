use v6.c;

unit class Math::Libgsl::Statistics:ver<0.0.2>:auth<zef:FRITH>;

use NativeCall;
use Math::Libgsl::Raw::Statistics :ALL;

# Mean, Standard Deviation and Variance
sub mean(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_mean($data, $stride, $n);
}

sub variance(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_variance($data, $stride, $n);
}

sub variance-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 $m = $mean;
  gsl_stats_variance_m($data, $stride, $n, $m);
}

sub sd(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_sd($data, $stride, $n);
}

sub sd-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 $m = $mean;
  gsl_stats_sd_m($data, $stride, $n, $m);
}

sub tss(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_tss($data, $stride, $n);
}

sub tss-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 $m = $mean;
  gsl_stats_tss_m($data, $stride, $n, $m);
}

sub variance-with-fixed-mean(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 $m = $mean;
  gsl_stats_variance_with_fixed_mean($data, $stride, $n, $m);
}

sub sd-with-fixed-mean(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 $m = $mean;
  gsl_stats_sd_with_fixed_mean($data, $stride, $n, $m);
}

# Absolute deviation
sub absdev(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_absdev($data, $stride, $n);
}

sub absdev-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 $m = $mean;
  gsl_stats_absdev_m($data, $stride, $n, $m);
}

# Higher moments (skewness and kurtosis)
sub skew(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_skew($data, $stride, $n);
}

sub skew-m-sd(@data!, Num() $mean!, Num() $sd!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 $m = $mean;
  my num64 $d = $sd;
  gsl_stats_skew_m_sd($data, $stride, $n, $m, $d);
}

sub kurtosis(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_kurtosis($data, $stride, $n);
}

sub kurtosis-m-sd(@data!, Num() $mean!, Num() $sd!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 $m = $mean;
  my num64 $d = $sd;
  gsl_stats_kurtosis_m_sd($data, $stride, $n, $m, $d);
}

# Autocorrelation
sub autocorrelation(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_lag1_autocorrelation($data, $stride, $n);
}

sub autocorrelation-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 $m = $mean;
  gsl_stats_lag1_autocorrelation_m($data, $stride, $n, $m);
}

# Covariance
sub covariance(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num) is export
{
  my CArray[num64] $data1 .= new: @data1».Num;
  my CArray[num64] $data2 .= new: @data2».Num;
  gsl_stats_covariance($data1, $stride1, $data2, $stride2, $n);
}

sub covariance-m(@data1!, @data2! where *.elems == @data1.elems, Num() $mean1!, Num() $mean2!, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int  --> Num) is export
{
  my CArray[num64] $data1 .= new: @data1».Num;
  my CArray[num64] $data2 .= new: @data2».Num;
  my num64 $m1 = $mean1;
  my num64 $m2 = $mean2;
  gsl_stats_covariance_m($data1, $stride1, $data2, $stride2, $n, $m1, $m2);
}

# Correlation
sub correlation(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num) is export
{
  my CArray[num64] $data1 .= new: @data1».Num;
  my CArray[num64] $data2 .= new: @data2».Num;
  gsl_stats_correlation($data1, $stride1, $data2, $stride2, $n);
}

sub spearman(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int  --> Num) is export
{
  my CArray[num64] $data1 .= new: @data1».Num;
  my CArray[num64] $data2 .= new: @data2».Num;
  my $work = CArray[num64].allocate(@data1.elems * 2);
  gsl_stats_spearman($data1, $stride1, $data2, $stride2, $n, $work);
}

# Weighted Samples
sub wmean(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  gsl_stats_wmean($wdata, $wstride, $data, $stride, $n);
}

sub wvariance(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  gsl_stats_wvariance($wdata, $wstride, $data, $stride, $n);
}

sub wvariance-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  my num64 $wm = $wmean;
  gsl_stats_wvariance_m($wdata, $wstride, $data, $stride, $n, $wm);
}

sub wsd(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  gsl_stats_wsd($wdata, $wstride, $data, $stride, $n);
}

sub wsd-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  my num64 $wm = $wmean;
  gsl_stats_wsd_m($wdata, $wstride, $data, $stride, $n, $wm);
}

sub wvariance-with-fixed-mean(@w!, @data!, Num() $mean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  my num64 $m = $mean;
  gsl_stats_wvariance_with_fixed_mean($wdata, $wstride, $data, $stride, $n, $m);
}

sub wsd-with-fixed-mean(@w!, @data!, Num() $mean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  my num64 $m = $mean;
  gsl_stats_wsd_with_fixed_mean($wdata, $wstride, $data, $stride, $n, $m);
}

sub wtss(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  gsl_stats_wtss($wdata, $wstride, $data, $stride, $n);
}

sub wtss-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  my num64 $wm = $wmean;
  gsl_stats_wtss_m($wdata, $wstride, $data, $stride, $n, $wm);
}

sub wabsdev(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  gsl_stats_wabsdev($wdata, $wstride, $data, $stride, $n);
}

sub wabsdev-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  my num64 $wm = $wmean;
  gsl_stats_wabsdev_m($wdata, $wstride, $data, $stride, $n, $wm);
}

sub wskew(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  gsl_stats_wskew($wdata, $wstride, $data, $stride, $n);
}

sub wskew-m-sd(@w!, @data!, Num() $wmean!, Num() $wsd!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  my num64 $wm = $wmean;
  my num64 $ws = $wsd;
  gsl_stats_wskew_m_sd($wdata, $wstride, $data, $stride, $n, $wm, $ws);
}

sub wkurtosis(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  gsl_stats_wkurtosis($wdata, $wstride, $data, $stride, $n);
}

sub wkurtosis-m-sd(@w!, @data!, Num() $wmean!, Num() $wsd!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my CArray[num64] $wdata .= new: @w».Num;
  my num64 $wm = $wmean;
  my num64 $ws = $wsd;
  gsl_stats_wkurtosis_m_sd($wdata, $wstride, $data, $stride, $n, $wm, $ws);
}

# Maximum and Minimum values
sub smax(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_max($data, $stride, $n);
}

sub smin(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_min($data, $stride, $n);
}

sub sminmax(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> List) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my num64 ($min, $max);
  gsl_stats_minmax($min, $max, $data, $stride, $n);
  return $min, $max;
}

sub smax-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_max_index($data, $stride, $n);
}

sub smin-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_min_index($data, $stride, $n);
}

sub sminmax-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> List) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my size_t ($min, $max);
  gsl_stats_minmax_index($min, $max, $data, $stride, $n);
  return $min, $max;
}

# Median and Percentiles
sub median-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $sorted-data .= new: @sorted-data».Num;
  gsl_stats_median_from_sorted_data($sorted-data, $stride, $n);
}

sub median(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_median($data, $stride, $n);
}

sub quantile-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Num() $percentile!, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $sorted-data .= new: @sorted-data».Num;
  my num64 $f = $percentile;
  gsl_stats_quantile_from_sorted_data($sorted-data, $stride, $n, $f);
}

# Order Statistics
sub select(@data!, Int()  $k, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  gsl_stats_select($data, $stride, $n, $k);
}

# Robust Location Estimates
sub trmean-from-sorted-data(Num() $alpha, @sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $sorted-data .= new: @sorted-data».Num;
  my num64 $a = $alpha;
  gsl_stats_trmean_from_sorted_data($a, $sorted-data, $stride, $n);
}

sub gastwirth-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $sorted-data .= new: @sorted-data».Num;
  gsl_stats_gastwirth_from_sorted_data($sorted-data, $stride, $n);
}

# Robust Scale Estimates
sub mad0(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my $work = CArray[num64].allocate(@data.elems);
  gsl_stats_mad0($data, $stride, $n, $work);
}

sub mad(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $data .= new: @data».Num;
  my $work = CArray[num64].allocate(@data.elems);
  gsl_stats_mad($data, $stride, $n, $work);
}

sub Sn0-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $sorted-data .= new: @sorted-data».Num;
  my $work = CArray[num64].allocate(@sorted-data.elems);
  gsl_stats_Sn0_from_sorted_data($sorted-data, $stride, $n, $work);
}

sub Sn-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $sorted-data .= new: @sorted-data».Num;
  my $work = CArray[num64].allocate(@sorted-data.elems);
  gsl_stats_Sn_from_sorted_data($sorted-data, $stride, $n, $work);
}

sub Qn0-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $sorted-data .= new: @sorted-data».Num;
  my $work = CArray[num64].allocate(@sorted-data.elems * 3);
  my $work-int = CArray[int32].allocate(@sorted-data.elems * 5);
  gsl_stats_Qn0_from_sorted_data($sorted-data, $stride, $n, $work, $work-int);
}

sub Qn-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[num64] $sorted-data .= new: @sorted-data».Num;
  my $work = CArray[num64].allocate(@sorted-data.elems * 3);
  my $work-int = CArray[int32].allocate(@sorted-data.elems * 5);
  gsl_stats_Qn_from_sorted_data($sorted-data, $stride, $n, $work, $work-int);
}

=begin pod

=head1 NAME

Math::Libgsl::Statistics - An interface to libgsl, the Gnu Scientific Library - Statistics

=head1 SYNOPSIS

=begin code :lang<raku>

use Math::Libgsl::Statistics;

my @data = ^10;
say "mean = { mean(@data) }, variance = { variance(@data) }";

=end code

=head1 DESCRIPTION

Math::Libgsl::Statistics is an interface to the Statistics functions of libgsl, the Gnu Scientific Library.

The functions in this module come in 10 data types:

=item Math::Libgsl::Statistics          (default: num64)
=item Math::Libgsl::Statistics::Num32
=item Math::Libgsl::Statistics::Int8
=item Math::Libgsl::Statistics::Int16
=item Math::Libgsl::Statistics::Int32
=item Math::Libgsl::Statistics::Int64
=item Math::Libgsl::Statistics::UInt8
=item Math::Libgsl::Statistics::UInt16
=item Math::Libgsl::Statistics::UInt32
=item Math::Libgsl::Statistics::UInt64

All the following functions are available in the modules correspondiing to each datatype, except where noted.

=head3 mean(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the arithmetic mean of @data.

=head3 variance(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the estimated variance of @data.
This function computes the mean, if you already computed the mean, use the next function.

=head3 variance-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride)

This function returns the sample variance of @data relative to the given value of $mean.

=head3 sd(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the estimated standard deviation of @data.

=head3 sd-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the sample standard deviation of @data relative to the given value of $mean.

=head3 tss(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the total sum of squares (TSS) of @data.

=head3 tss-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the total sum of squares (TSS) of @data relative to the given value of $mean.

=head3 variance-with-fixed-mean(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes an unbiased estimate of the variance of @data when the population mean $mean of the underlying distribution is known a priori.

=head3 sd-with-fixed-mean(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function calculates the standard deviation of @data for a fixed population mean $mean.

=head3 absdev(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the absolute deviation from the mean of @data.

=head3 absdev-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the absolute deviation of the dataset @data relative to the given value of $mean.

=head3 skew(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the skewness of @data.

=head3 skew-m-sd(@data!, Num() $mean!, Num() $sd!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the skewness of the dataset @data using the given values of the mean $mean and standard deviation $sd,

=head3 kurtosis(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the kurtosis of @data.

=head3 kurtosis-m-sd(@data!, Num() $mean!, Num() $sd!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the kurtosis of the dataset @data using the given values of the mean $mean and standard deviation $sd,

=head3 autocorrelation(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the lag-1 autocorrelation of the dataset @data.

=head3 autocorrelation-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the lag-1 autocorrelation of the dataset @data using the given value of the mean $mean.

=head3 covariance(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num)

This function computes the covariance of the datasets @data1 and @data2.

=head3 covariance-m(@data1!, @data2! where *.elems == @data1.elems, Num() $mean1!, Num() $mean2!, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int  --> Num)

This function computes the covariance of the datasets @data1 and @data2 using the given values of the means, $mean1 and $mean2.

=head3 correlation(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num)

This function efficiently computes the Pearson correlation coefficient between the datasets @data1 and @data2.

=head3 spearman(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int  --> Num)

This function computes the Spearman rank correlation coefficient between the datasets @data1 and @data2.

=head3 wmean(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the weighted mean of the dataset @data using the set of weights @w.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wvariance(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the estimated variance of the dataset @data using the set of weights @w.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wvariance-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the estimated variance of the weighted dataset @data using the given weighted mean $wmean.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wsd(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the standard deviation of the weighted dataset @data.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wsd-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the standard deviation of the weighted dataset @data using the given weighted mean $wmean.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wvariance-with-fixed-mean(@w!, @data!, Num() $mean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes an unbiased estimate of the variance of the weighted dataset @data when the population mean $mean of the underlying distribution is known a priori.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wsd-with-fixed-mean(@w!, @data!, Num() $mean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes an unbiased estimate of the standard deviation of the weighted dataset @data when the population mean $mean of the underlying distribution is known a priori.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wtss(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the weighted total sum of squares (TSS) of @data.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wtss-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the weighted total sum of squares (TSS) of @data when the population mean $mean of the underlying distribution is known a priori.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wabsdev(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted absolute deviation from the weighted mean of @data.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wabsdev-m(@w!, @data!, Num() $wmean!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the absolute deviation of the weighted dataset @data about the given weighted mean $wmean.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wskew(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted skewness of the dataset @data.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wskew-m-sd(@w!, @data!, Num() $wmean!, Num() $wsd!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted skewness of the dataset @data using the given values of the weighted mean and weighted standard deviation, $wmean and $wsd.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wkurtosis(@w!, @data!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted kurtosis of the dataset @data.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 wkurtosis-m-sd(@w!, @data!, Num() $wmean!, Num() $wsd!, Int() :$wstride? = 1, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function computes the weighted kurtosis of the dataset @data using the given values of the weighted mean and weighted standard deviation, $wmean and $wsd.
This function is available only for Numeric types, so only when using Math::Libgsl::Statistics or Math::Libgsl::Statistics::Num32.

=head3 smax(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the maximum value in @data.

=head3 smin(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the minimum value in @data.

=head3 sminmax(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> List)

This function returns both the minimum and maximum values in @data in a single pass.

=head3 smax-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int)

This function returns the index of the maximum value in @data.

=head3 smin-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int)

This function returns the index of the minimum value in @data.

=head3 sminmax-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> List)

This function returns the indexes of the minimum and maximum values in @data in a single pass.

=head3 median-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

This function returns the median value of @sorted-data.

=head3 median(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function returns the median value of @data.

=head3 quantile-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Num() $percentile!, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

This function returns a quantile value of @sorted-data. The quantile is determined by the $percentile, a fraction between 0 and 1. For example, to compute the value of the 75th percentile $percentile should have the value 0.75.

=head3 select(@data!, Int()  $k, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

This function finds the k-th smallest element of the input array @data.

=head3 trmean-from-sorted-data(Num() $alpha, @sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

This function returns the trimmed mean of @sorted-data.

=head3 gastwirth-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

This function returns the Gastwirth location estimator of @sorted-data.

=head3 mad0(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)
=head3 mad(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num)

These functions return the median absolute deviation of @data.
The mad0 function calculates the MAD statistic without the bias correction scale factor.

=head3 Sn0-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)
=head3 Sn-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

These functions return the Sₙ statistic of @sorted-data.
The Sn0 function calculates the Sₙ statistic without the bias correction scale factors.

=head3 Qn0-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)
=head3 Qn-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num)

These functions return the Qₙ statistic of @sorted-data.
The Qn0 function calculates the Qₙ statistic without the bias correction scale factors.

=head1 C Library Documentation

For more details on libgsl see L<https://www.gnu.org/software/gsl/>.
The excellent C Library manual is available here L<https://www.gnu.org/software/gsl/doc/html/index.html>, or here L<https://www.gnu.org/software/gsl/doc/latex/gsl-ref.pdf> in PDF format.

=head1 Prerequisites

This module requires the libgsl library to be installed. Please follow the instructions below based on your platform:

=head2 Debian Linux and Ubuntu 20.04+

=begin code
sudo apt install libgsl23 libgsl-dev libgslcblas0
=end code

That command will install libgslcblas0 as well, since it's used by the GSL.

=head2 Ubuntu 18.04

libgsl23 and libgslcblas0 have a missing symbol on Ubuntu 18.04.
I solved the issue installing the Debian Buster version of those three libraries:

=item L<http://http.us.debian.org/debian/pool/main/g/gsl/libgslcblas0_2.5+dfsg-6_amd64.deb>
=item L<http://http.us.debian.org/debian/pool/main/g/gsl/libgsl23_2.5+dfsg-6_amd64.deb>
=item L<http://http.us.debian.org/debian/pool/main/g/gsl/libgsl-dev_2.5+dfsg-6_amd64.deb>

=head1 Installation

To install it using zef (a module management tool):

=begin code
$ zef install Math::Libgsl::Statistics
=end code

=head1 AUTHOR

Fernando Santagata <nando.santagata@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2020 Fernando Santagata

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
