use v6;

unit module Math::Libgsl::Raw::Statistics::Int32:ver<0.0.1>:auth<zef:FRITH>;

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
sub gsl_stats_int_mean(CArray[int32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_int_variance(CArray[int32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_int_variance_m(CArray[int32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_int_sd(CArray[int32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_int_sd_m(CArray[int32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_int_tss(CArray[int32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_int_tss_m(CArray[int32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_int_variance_with_fixed_mean(CArray[int32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_int_sd_with_fixed_mean(CArray[int32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_int_absdev(CArray[int32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_int_absdev_m(CArray[int32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_int_skew(CArray[int32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_int_skew_m_sd(CArray[int32] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_int_kurtosis(CArray[int32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_int_kurtosis_m_sd(CArray[int32] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_int_lag1_autocorrelation(CArray[int32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_int_lag1_autocorrelation_m(CArray[int32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_int_covariance(CArray[int32] $data1, size_t $stride1, CArray[int32] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_int_covariance_m(CArray[int32] $data1, size_t $stride1, CArray[int32] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_int_correlation(CArray[int32] $data1, size_t $stride1, CArray[int32] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_int_spearman(CArray[int32] $data1, size_t $stride1, CArray[int32] $data2, size_t $stride2, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Maximum and Minimum values
sub gsl_stats_int_max(CArray[int32] $data, size_t $stride, size_t $n --> int32) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_int_min(CArray[int32] $data, size_t $stride, size_t $n --> int32) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_int_minmax(int32 $min is rw, int32 $max is rw, CArray[int32] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_int_max_index(CArray[int32] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_int_min_index(CArray[int32] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_int_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[int32] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_int_median_from_sorted_data(CArray[int32] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_int_median(CArray[int32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_int_quantile_from_sorted_data(CArray[int32] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_int_select(CArray[int32] $data, size_t $stride, size_t $n, size_t $k --> int32) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_int_trmean_from_sorted_data(num64 $alpha, CArray[int32] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_int_gastwirth_from_sorted_data(CArray[int32] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_int_mad0(CArray[int32] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_int_mad(CArray[int32] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_int_Sn0_from_sorted_data(CArray[int32] $sorted-data, size_t $stride, size_t $n, CArray[int32] $work --> int32) is native(&LIB) is export(:scale) { * }
sub gsl_stats_int_Sn_from_sorted_data(CArray[int32] $sorted-data, size_t $stride, size_t $n, CArray[int32] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_int_Qn0_from_sorted_data(CArray[int32] $sorted-data, size_t $stride, size_t $n, CArray[int32] $work, CArray[int32] $work_int --> int32) is native(&LIB) is export(:scale) { * }
sub gsl_stats_int_Qn_from_sorted_data(CArray[int32] $sorted-data, size_t $stride, size_t $n, CArray[int32] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
