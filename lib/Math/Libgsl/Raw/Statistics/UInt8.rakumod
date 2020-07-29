use v6;

unit module Math::Libgsl::Raw::Statistics::Uint8:ver<0.0.1>:auth<cpan:FRITH>;

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
sub gsl_stats_uchar_mean(CArray[uint8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uchar_variance(CArray[uint8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uchar_variance_m(CArray[uint8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uchar_sd(CArray[uint8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uchar_sd_m(CArray[uint8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uchar_tss(CArray[uint8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uchar_tss_m(CArray[uint8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uchar_variance_with_fixed_mean(CArray[uint8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_uchar_sd_with_fixed_mean(CArray[uint8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_uchar_absdev(CArray[uint8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_uchar_absdev_m(CArray[uint8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_uchar_skew(CArray[uint8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_uchar_skew_m_sd(CArray[uint8] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_uchar_kurtosis(CArray[uint8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_uchar_kurtosis_m_sd(CArray[uint8] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_uchar_lag1_autocorrelation(CArray[uint8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_uchar_lag1_autocorrelation_m(CArray[uint8] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_uchar_covariance(CArray[uint8] $data1, size_t $stride1, CArray[uint8] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_uchar_covariance_m(CArray[uint8] $data1, size_t $stride1, CArray[uint8] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_uchar_correlation(CArray[uint8] $data1, size_t $stride1, CArray[uint8] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_uchar_spearman(CArray[uint8] $data1, size_t $stride1, CArray[uint8] $data2, size_t $stride2, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Maximum and Minimum values
sub gsl_stats_uchar_max(CArray[uint8] $data, size_t $stride, size_t $n --> uint8) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uchar_min(CArray[uint8] $data, size_t $stride, size_t $n --> uint8) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uchar_minmax(uint8 $min is rw, uint8 $max is rw, CArray[uint8] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uchar_max_index(CArray[uint8] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uchar_min_index(CArray[uint8] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_uchar_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[uint8] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_uchar_median_from_sorted_data(CArray[uint8] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_uchar_median(CArray[uint8] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_uchar_quantile_from_sorted_data(CArray[uint8] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_uchar_select(CArray[uint8] $data, size_t $stride, size_t $n, size_t $k --> uint8) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_uchar_trmean_from_sorted_data(num64 $alpha, CArray[uint8] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_uchar_gastwirth_from_sorted_data(CArray[uint8] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_uchar_mad0(CArray[uint8] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uchar_mad(CArray[uint8] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uchar_Sn0_from_sorted_data(CArray[uint8] $sorted-data, size_t $stride, size_t $n, CArray[uint8] $work --> uint8) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uchar_Sn_from_sorted_data(CArray[uint8] $sorted-data, size_t $stride, size_t $n, CArray[uint8] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uchar_Qn0_from_sorted_data(CArray[uint8] $sorted-data, size_t $stride, size_t $n, CArray[uint8] $work, CArray[int32] $work_int --> uint8) is native(&LIB) is export(:scale) { * }
sub gsl_stats_uchar_Qn_from_sorted_data(CArray[uint8] $sorted-data, size_t $stride, size_t $n, CArray[uint8] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
