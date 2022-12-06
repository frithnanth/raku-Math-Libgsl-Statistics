use v6;

unit module Math::Libgsl::Raw::Statistics::Int64:ver<0.0.2>:auth<zef:FRITH>;

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
sub gsl_stats_long_mean(CArray[int64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_long_variance(CArray[int64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_long_variance_m(CArray[int64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_long_sd(CArray[int64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_long_sd_m(CArray[int64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_long_tss(CArray[int64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_long_tss_m(CArray[int64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_long_variance_with_fixed_mean(CArray[int64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_long_sd_with_fixed_mean(CArray[int64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_long_absdev(CArray[int64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_long_absdev_m(CArray[int64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_long_skew(CArray[int64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_long_skew_m_sd(CArray[int64] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_long_kurtosis(CArray[int64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_long_kurtosis_m_sd(CArray[int64] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_long_lag1_autocorrelation(CArray[int64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_long_lag1_autocorrelation_m(CArray[int64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_long_covariance(CArray[int64] $data1, size_t $stride1, CArray[int64] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_long_covariance_m(CArray[int64] $data1, size_t $stride1, CArray[int64] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_long_correlation(CArray[int64] $data1, size_t $stride1, CArray[int64] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_long_spearman(CArray[int64] $data1, size_t $stride1, CArray[int64] $data2, size_t $stride2, size_t $n, CArray[int64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Maximum and Minimum values
sub gsl_stats_long_max(CArray[int64] $data, size_t $stride, size_t $n --> int64) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_long_min(CArray[int64] $data, size_t $stride, size_t $n --> int64) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_long_minmax(int64 $min is rw, int64 $max is rw, CArray[int64] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_long_max_index(CArray[int64] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_long_min_index(CArray[int64] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_long_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[int64] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_long_median_from_sorted_data(CArray[int64] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_long_median(CArray[int64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_long_quantile_from_sorted_data(CArray[int64] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_long_select(CArray[int64] $data, size_t $stride, size_t $n, size_t $k --> int64) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_long_trmean_from_sorted_data(num64 $alpha, CArray[int64] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_long_gastwirth_from_sorted_data(CArray[int64] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_long_mad0(CArray[int64] $data, size_t $stride, size_t $n, CArray[int64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_long_mad(CArray[int64] $data, size_t $stride, size_t $n, CArray[int64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_long_Sn0_from_sorted_data(CArray[int64] $sorted-data, size_t $stride, size_t $n, CArray[int64] $work --> int64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_long_Sn_from_sorted_data(CArray[int64] $sorted-data, size_t $stride, size_t $n, CArray[int64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_long_Qn0_from_sorted_data(CArray[int64] $sorted-data, size_t $stride, size_t $n, CArray[int64] $work, CArray[int32] $work_int --> int64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_long_Qn_from_sorted_data(CArray[int64] $sorted-data, size_t $stride, size_t $n, CArray[int64] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
