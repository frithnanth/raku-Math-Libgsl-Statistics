use v6.c;

unit class Math::Libgsl::Statistics::Int32:ver<0.0.1>:auth<cpan:FRITH>;

use NativeCall;
use Math::Libgsl::Raw::Statistics::Int32 :ALL;

# Mean, Standard Deviation and Variance
sub mean(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_mean($data, $stride, $n);
}

sub variance(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_variance($data, $stride, $n);
}

sub variance-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my num64 $m = $mean;
  gsl_stats_int_variance_m($data, $stride, $n, $m);
}

sub sd(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_sd($data, $stride, $n);
}

sub sd-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my num64 $m = $mean;
  gsl_stats_int_sd_m($data, $stride, $n, $m);
}

sub tss(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_tss($data, $stride, $n);
}

sub tss-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my num64 $m = $mean;
  gsl_stats_int_tss_m($data, $stride, $n, $m);
}

sub variance-with-fixed-mean(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my num64 $m = $mean;
  gsl_stats_int_variance_with_fixed_mean($data, $stride, $n, $m);
}

sub sd-with-fixed-mean(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my num64 $m = $mean;
  gsl_stats_int_sd_with_fixed_mean($data, $stride, $n, $m);
}

# Absolute deviation
sub absdev(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_absdev($data, $stride, $n);
}

sub absdev-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my num64 $m = $mean;
  gsl_stats_int_absdev_m($data, $stride, $n, $m);
}

# Higher moments (skewness and kurtosis)
sub skew(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_skew($data, $stride, $n);
}

sub skew-m-sd(@data!, Num() $mean!, Num() $sd!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my num64 $m = $mean;
  my num64 $d = $sd;
  gsl_stats_int_skew_m_sd($data, $stride, $n, $m, $d);
}

sub kurtosis(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_kurtosis($data, $stride, $n);
}

sub kurtosis-m-sd(@data!, Num() $mean!, Num() $sd!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my num64 $m = $mean;
  my num64 $d = $sd;
  gsl_stats_int_kurtosis_m_sd($data, $stride, $n, $m, $d);
}

# Autocorrelation
sub autocorrelation(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_lag1_autocorrelation($data, $stride, $n);
}

sub autocorrelation-m(@data!, Num() $mean!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my num64 $m = $mean;
  gsl_stats_int_lag1_autocorrelation_m($data, $stride, $n, $m);
}

# Covariance
sub covariance(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num) is export
{
  my CArray[int32] $data1 .= new: @data1».Int;
  my CArray[int32] $data2 .= new: @data2».Int;
  gsl_stats_int_covariance($data1, $stride1, $data2, $stride2, $n);
}

sub covariance-m(@data1!, @data2! where *.elems == @data1.elems, Num() $mean1!, Num() $mean2!, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int  --> Num) is export
{
  my CArray[int32] $data1 .= new: @data1».Int;
  my CArray[int32] $data2 .= new: @data2».Int;
  my num64 $m1 = $mean1;
  my num64 $m2 = $mean2;
  gsl_stats_int_covariance_m($data1, $stride1, $data2, $stride2, $n, $m1, $m2);
}

# Correlation
sub correlation(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int --> Num) is export
{
  my CArray[int32] $data1 .= new: @data1».Int;
  my CArray[int32] $data2 .= new: @data2».Int;
  gsl_stats_int_correlation($data1, $stride1, $data2, $stride2, $n);
}

sub spearman(@data1!, @data2! where *.elems == @data1.elems, Int() :$stride1? = 1, Int() :$stride2? = 1, Int() :$n? = (@data1.elems / $stride1).Int  --> Num) is export
{
  my CArray[int32] $data1 .= new: @data1».Int;
  my CArray[int32] $data2 .= new: @data2».Int;
  my $work = CArray[num64].allocate(@data1.elems * 2);
  gsl_stats_int_spearman($data1, $stride1, $data2, $stride2, $n, $work);
}

# Maximum and Minimum values
sub smax(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_max($data, $stride, $n);
}

sub smin(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_min($data, $stride, $n);
}

sub sminmax(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> List) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my int32 ($min, $max);
  gsl_stats_int_minmax($min, $max, $data, $stride, $n);
  return $min, $max;
}

sub smax-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_max_index($data, $stride, $n);
}

sub smin-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_min_index($data, $stride, $n);
}

sub sminmax-index(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> List) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my size_t ($min, $max);
  gsl_stats_int_minmax_index($min, $max, $data, $stride, $n);
  return $min, $max;
}

# Median and Percentiles
sub median-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $sorted-data .= new: @sorted-data».Int;
  gsl_stats_int_median_from_sorted_data($sorted-data, $stride, $n);
}

sub median(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_median($data, $stride, $n);
}

sub quantile-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Num() $percentile!, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $sorted-data .= new: @sorted-data».Int;
  my num64 $f = $percentile;
  gsl_stats_int_quantile_from_sorted_data($sorted-data, $stride, $n, $f);
}

# Order Statistics
sub select(@data!, Int()  $k, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Int) is export
{
  my CArray[int32] $data .= new: @data».Int;
  gsl_stats_int_select($data, $stride, $n, $k);
}

# Robust Location Estimates
sub trmean-from-sorted-data(Num() $alpha, @sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $sorted-data .= new: @sorted-data».Int;
  my num64 $a = $alpha;
  gsl_stats_int_trmean_from_sorted_data($a, $sorted-data, $stride, $n);
}

sub gastwirth-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $sorted-data .= new: @sorted-data».Int;
  gsl_stats_int_gastwirth_from_sorted_data($sorted-data, $stride, $n);
}

# Robust Scale Estimates
sub mad0(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my $work = CArray[num64].allocate(@data.elems);
  gsl_stats_int_mad0($data, $stride, $n, $work);
}

sub mad(@data!, Int() :$stride? = 1, Int() :$n? = (@data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $data .= new: @data».Int;
  my $work = CArray[num64].allocate(@data.elems);
  gsl_stats_int_mad($data, $stride, $n, $work);
}

sub Sn0-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Int) is export
{
  my CArray[int32] $sorted-data .= new: @sorted-data».Int;
  my $work = CArray[int32].allocate(@sorted-data.elems);
  gsl_stats_int_Sn0_from_sorted_data($sorted-data, $stride, $n, $work);
}

sub Sn-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $sorted-data .= new: @sorted-data».Int;
  my $work = CArray[int32].allocate(@sorted-data.elems);
  gsl_stats_int_Sn_from_sorted_data($sorted-data, $stride, $n, $work);
}

sub Qn0-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Int) is export
{
  my CArray[int32] $sorted-data .= new: @sorted-data».Int;
  my $work = CArray[int32].allocate(@sorted-data.elems * 3);
  my $work-int = CArray[int32].allocate(@sorted-data.elems * 5);
  gsl_stats_int_Qn0_from_sorted_data($sorted-data, $stride, $n, $work, $work-int);
}

sub Qn-from-sorted-data(@sorted-data! where { [<] @sorted-data }, Int() :$stride? = 1, Int() :$n? = (@sorted-data.elems / $stride).Int --> Num) is export
{
  my CArray[int32] $sorted-data .= new: @sorted-data».Int;
  my $work = CArray[int32].allocate(@sorted-data.elems * 3);
  my $work-int = CArray[int32].allocate(@sorted-data.elems * 5);
  gsl_stats_int_Qn_from_sorted_data($sorted-data, $stride, $n, $work, $work-int);
}
