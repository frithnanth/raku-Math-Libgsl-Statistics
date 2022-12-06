use v6;

unit module Math::Libgsl::Raw::Statistics::Int8:ver<0.0.1>:auth<zef:FRITH>;

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
sub gsl_stats_char_mean(CArray[int8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_char_variance(CArray[int8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_char_variance_m(CArray[int8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_char_sd(CArray[int8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_char_sd_m(CArray[int8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_char_tss(CArray[int8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_char_tss_m(CArray[int8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_char_variance_with_fixed_mean(CArray[int8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_char_sd_with_fixed_mean(CArray[int8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_char_absdev(CArray[int8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_char_absdev_m(CArray[int8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_char_skew(CArray[int8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_char_skew_m_sd(CArray[int8] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_char_kurtosis(CArray[int8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_char_kurtosis_m_sd(CArray[int8] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_char_lag1_autocorrelation(CArray[int8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_char_lag1_autocorrelation_m(CArray[int8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_char_covariance(CArray[int8] $data1, size_t $stride1, CArray[int8] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_char_covariance_m(CArray[int8] $data1, size_t $stride1, CArray[int8] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_char_correlation(CArray[int8] $data1, size_t $stride1, CArray[int8] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_char_spearman(CArray[int8] $data1, size_t $stride1, CArray[int8] $data2, size_t $stride2, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Maximum and Minimum values
sub gsl_stats_char_max(CArray[int8] $data, size_t $stride, size_t $n --> int8) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_char_min(CArray[int8] $data, size_t $stride, size_t $n --> int8) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_char_minmax(int8 $min is rw, int8 $max is rw, CArray[int8] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_char_max_index(CArray[int8] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_char_min_index(CArray[int8] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_char_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[int8] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_char_median_from_sorted_data(CArray[int8] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_char_median(CArray[int8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_char_quantile_from_sorted_data(CArray[int8] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_char_select(CArray[int8] $data, size_t $stride, size_t $n, size_t $k --> int8) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_char_trmean_from_sorted_data(num64 $alpha, CArray[int8] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_char_gastwirth_from_sorted_data(CArray[int8] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_char_mad0(CArray[int8] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_char_mad(CArray[int8] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_char_Sn0_from_sorted_data(CArray[int8] $sorted-data, size_t $stride, size_t $n, CArray[int8] $work --> int8) is native(&LIB) is export(:scale) { * }
sub gsl_stats_char_Sn_from_sorted_data(CArray[int8] $sorted-data, size_t $stride, size_t $n, CArray[int8] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_char_Qn0_from_sorted_data(CArray[int8] $sorted-data, size_t $stride, size_t $n, CArray[int8] $work, CArray[int32] $work_int --> int8) is native(&LIB) is export(:scale) { * }
sub gsl_stats_char_Qn_from_sorted_data(CArray[int8] $sorted-data, size_t $stride, size_t $n, CArray[int8] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
