use v6;

unit module Math::Libgsl::Raw::Statistics::Uint16:ver<0.0.1>:auth<zef:FRITH>;

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
sub gsl_stats_ushort_mean(CArray[uint16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ushort_variance(CArray[uint16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ushort_variance_m(CArray[uint16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ushort_sd(CArray[uint16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ushort_sd_m(CArray[uint16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ushort_tss(CArray[uint16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ushort_tss_m(CArray[uint16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ushort_variance_with_fixed_mean(CArray[uint16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_ushort_sd_with_fixed_mean(CArray[uint16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_ushort_absdev(CArray[uint16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_ushort_absdev_m(CArray[uint16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_ushort_skew(CArray[uint16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_ushort_skew_m_sd(CArray[uint16] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_ushort_kurtosis(CArray[uint16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_ushort_kurtosis_m_sd(CArray[uint16] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_ushort_lag1_autocorrelation(CArray[uint16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_ushort_lag1_autocorrelation_m(CArray[uint16] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_ushort_covariance(CArray[uint16] $data1, size_t $stride1, CArray[uint16] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_ushort_covariance_m(CArray[uint16] $data1, size_t $stride1, CArray[uint16] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_ushort_correlation(CArray[uint16] $data1, size_t $stride1, CArray[uint16] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_ushort_spearman(CArray[uint16] $data1, size_t $stride1, CArray[uint16] $data2, size_t $stride2, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Maximum and Minimum values
sub gsl_stats_ushort_max(CArray[uint16] $data, size_t $stride, size_t $n --> uint16) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ushort_min(CArray[uint16] $data, size_t $stride, size_t $n --> uint16) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ushort_minmax(uint16 $min is rw, uint16 $max is rw, CArray[uint16] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ushort_max_index(CArray[uint16] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ushort_min_index(CArray[uint16] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_ushort_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[uint16] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_ushort_median_from_sorted_data(CArray[uint16] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_ushort_median(CArray[uint16] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_ushort_quantile_from_sorted_data(CArray[uint16] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_ushort_select(CArray[uint16] $data, size_t $stride, size_t $n, size_t $k --> uint16) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_ushort_trmean_from_sorted_data(num64 $alpha, CArray[uint16] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_ushort_gastwirth_from_sorted_data(CArray[uint16] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_ushort_mad0(CArray[uint16] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ushort_mad(CArray[uint16] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ushort_Sn0_from_sorted_data(CArray[uint16] $sorted-data, size_t $stride, size_t $n, CArray[uint16] $work --> uint16) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ushort_Sn_from_sorted_data(CArray[uint16] $sorted-data, size_t $stride, size_t $n, CArray[uint16] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ushort_Qn0_from_sorted_data(CArray[uint16] $sorted-data, size_t $stride, size_t $n, CArray[uint16] $work, CArray[int32] $work_int --> uint16) is native(&LIB) is export(:scale) { * }
sub gsl_stats_ushort_Qn_from_sorted_data(CArray[uint16] $sorted-data, size_t $stride, size_t $n, CArray[uint16] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
