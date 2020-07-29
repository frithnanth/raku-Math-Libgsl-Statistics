use v6;

unit module Math::Libgsl::Raw::Statistics::Uint32:ver<0.0.1>:auth<cpan:FRITH>;

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
sub gsl_stats_uint_mean(CArray[uint32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uint_variance(CArray[uint32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uint_variance_m(CArray[uint32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uint_sd(CArray[uint32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uint_sd_m(CArray[uint32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uint_tss(CArray[uint32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uint_tss_m(CArray[uint32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uint_variance_with_fixed_mean(CArray[uint32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uint_sd_with_fixed_mean(CArray[uint32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_uint_absdev(CArray[uint32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_uint_absdev_m(CArray[uint32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_uint_skew(CArray[uint32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_uint_skew_m_sd(CArray[uint32] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_uint_kurtosis(CArray[uint32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_uint_kurtosis_m_sd(CArray[uint32] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_uint_lag1_autocorrelation(CArray[uint32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_uint_lag1_autocorrelation_m(CArray[uint32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_uint_covariance(CArray[uint32] $data1, size_t $stride1, CArray[uint32] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_uint_covariance_m(CArray[uint32] $data1, size_t $stride1, CArray[uint32] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_uint_correlation(CArray[uint32] $data1, size_t $stride1, CArray[uint32] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_uint_spearman(CArray[uint32] $data1, size_t $stride1, CArray[uint32] $data2, size_t $stride2, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Maximum and Minimum values
sub gsl_stats_uint_max(CArray[uint32] $data, size_t $stride, size_t $n --> uint32) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uint_min(CArray[uint32] $data, size_t $stride, size_t $n --> uint32) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uint_minmax(uint32 $min is rw, uint32 $max is rw, CArray[uint32] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uint_max_index(CArray[uint32] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uint_min_index(CArray[uint32] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uint_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[uint32] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_uint_median_from_sorted_data(CArray[uint32] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_uint_median(CArray[uint32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_uint_quantile_from_sorted_data(CArray[uint32] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_uint_select(CArray[uint32] $data, size_t $stride, size_t $n, size_t $k --> uint32) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_uint_trmean_from_sorted_data(num64 $alpha, CArray[uint32] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_uint_gastwirth_from_sorted_data(CArray[uint32] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_uint_mad0(CArray[uint32] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uint_mad(CArray[uint32] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uint_Sn0_from_sorted_data(CArray[uint32] $sorted-data, size_t $stride, size_t $n, CArray[uint32] $work --> uint32) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uint_Sn_from_sorted_data(CArray[uint32] $sorted-data, size_t $stride, size_t $n, CArray[uint32] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uint_Qn0_from_sorted_data(CArray[uint32] $sorted-data, size_t $stride, size_t $n, CArray[uint32] $work, CArray[int32] $work_int --> uint32) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uint_Qn_from_sorted_data(CArray[uint32] $sorted-data, size_t $stride, size_t $n, CArray[uint32] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
