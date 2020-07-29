use v6;

unit module Math::Libgsl::Raw::Statistics::Uint64:ver<0.0.1>:auth<cpan:FRITH>;

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
sub gsl_stats_ulong_mean(CArray[uint64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ulong_variance(CArray[uint64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ulong_variance_m(CArray[uint64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ulong_sd(CArray[uint64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ulong_sd_m(CArray[uint64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ulong_tss(CArray[uint64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ulong_tss_m(CArray[uint64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ulong_variance_with_fixed_mean(CArray[uint64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ulong_sd_with_fixed_mean(CArray[uint64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_ulong_absdev(CArray[uint64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_ulong_absdev_m(CArray[uint64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_ulong_skew(CArray[uint64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_ulong_skew_m_sd(CArray[uint64] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_ulong_kurtosis(CArray[uint64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_ulong_kurtosis_m_sd(CArray[uint64] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_ulong_lag1_autocorrelation(CArray[uint64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_ulong_lag1_autocorrelation_m(CArray[uint64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_ulong_covariance(CArray[uint64] $data1, size_t $stride1, CArray[uint64] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_ulong_covariance_m(CArray[uint64] $data1, size_t $stride1, CArray[uint64] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_ulong_correlation(CArray[uint64] $data1, size_t $stride1, CArray[uint64] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_ulong_spearman(CArray[uint64] $data1, size_t $stride1, CArray[uint64] $data2, size_t $stride2, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Maximum and Minimum values
sub gsl_stats_ulong_max(CArray[uint64] $data, size_t $stride, size_t $n --> uint64) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ulong_min(CArray[uint64] $data, size_t $stride, size_t $n --> uint64) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ulong_minmax(uint64 $min is rw, uint64 $max is rw, CArray[uint64] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ulong_max_index(CArray[uint64] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ulong_min_index(CArray[uint64] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ulong_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[uint64] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_ulong_median_from_sorted_data(CArray[uint64] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_ulong_median(CArray[uint64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_ulong_quantile_from_sorted_data(CArray[uint64] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_ulong_select(CArray[uint64] $data, size_t $stride, size_t $n, size_t $k --> uint64) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_ulong_trmean_from_sorted_data(num64 $alpha, CArray[uint64] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_ulong_gastwirth_from_sorted_data(CArray[uint64] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_ulong_mad0(CArray[uint64] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ulong_mad(CArray[uint64] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ulong_Sn0_from_sorted_data(CArray[uint64] $sorted-data, size_t $stride, size_t $n, CArray[uint64] $work --> uint64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ulong_Sn_from_sorted_data(CArray[uint64] $sorted-data, size_t $stride, size_t $n, CArray[uint64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ulong_Qn0_from_sorted_data(CArray[uint64] $sorted-data, size_t $stride, size_t $n, CArray[uint64] $work, CArray[int32] $work_int --> uint64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ulong_Qn_from_sorted_data(CArray[uint64] $sorted-data, size_t $stride, size_t $n, CArray[uint64] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
