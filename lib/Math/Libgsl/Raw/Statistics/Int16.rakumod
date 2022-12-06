use v6;

unit module Math::Libgsl::Raw::Statistics::Int16:ver<0.0.1>:auth<zef:FRITH>;

use NativeCall;

sub LIB {
  run('/sbin/ldconfig', '-p', :chomp, :out)
    .out
    .slurp(:close)
    .split("\n")
    .grep(/^ \s+ libgsl\.so\. \d+ /)
    .sort
    .head
    .comb(/\S+/)
    .head;
}

# Mean, Standard Deviation and Variance
sub gsl_stats_short_mean(CArray[int16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_short_variance(CArray[int16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_short_variance_m(CArray[int16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_short_sd(CArray[int16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_short_sd_m(CArray[int16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_short_tss(CArray[int16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_short_tss_m(CArray[int16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_short_variance_with_fixed_mean(CArray[int16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_short_sd_with_fixed_mean(CArray[int16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_short_absdev(CArray[int16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_short_absdev_m(CArray[int16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_short_skew(CArray[int16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_short_skew_m_sd(CArray[int16] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_short_kurtosis(CArray[int16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_short_kurtosis_m_sd(CArray[int16] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_short_lag1_autocorrelation(CArray[int16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_short_lag1_autocorrelation_m(CArray[int16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_short_covariance(CArray[int16] $data1, size_t $stride1, CArray[int16] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_short_covariance_m(CArray[int16] $data1, size_t $stride1, CArray[int16] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_short_correlation(CArray[int16] $data1, size_t $stride1, CArray[int16] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_short_spearman(CArray[int16] $data1, size_t $stride1, CArray[int16] $data2, size_t $stride2, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Maximum and Minimum values
sub gsl_stats_short_max(CArray[int16] $data, size_t $stride, size_t $n --> int16) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_short_min(CArray[int16] $data, size_t $stride, size_t $n --> int16) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_short_minmax(int16 $min is rw, int16 $max is rw, CArray[int16] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_short_max_index(CArray[int16] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_short_min_index(CArray[int16] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_short_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[int16] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_short_median_from_sorted_data(CArray[int16] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_short_median(CArray[int16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_short_quantile_from_sorted_data(CArray[int16] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_short_select(CArray[int16] $data, size_t $stride, size_t $n, size_t $k --> int16) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_short_trmean_from_sorted_data(num64 $alpha, CArray[int16] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_short_gastwirth_from_sorted_data(CArray[int16] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_short_mad0(CArray[int16] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_short_mad(CArray[int16] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_short_Sn0_from_sorted_data(CArray[int16] $sorted-data, size_t $stride, size_t $n, CArray[int16] $work --> int16) is native(&LIB) is export(:scale) { * }
sub gsl_stats_short_Sn_from_sorted_data(CArray[int16] $sorted-data, size_t $stride, size_t $n, CArray[int16] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_short_Qn0_from_sorted_data(CArray[int16] $sorted-data, size_t $stride, size_t $n, CArray[int16] $work, CArray[int32] $work_int --> int16) is native(&LIB) is export(:scale) { * }
sub gsl_stats_short_Qn_from_sorted_data(CArray[int16] $sorted-data, size_t $stride, size_t $n, CArray[int16] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
