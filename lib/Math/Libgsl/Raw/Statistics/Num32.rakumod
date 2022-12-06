use v6;

unit module Math::Libgsl::Raw::Statistics::Num32:ver<0.0.2>:auth<zef:FRITH>;

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
sub gsl_stats_float_mean(CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_float_variance(CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_float_variance_m(CArray[num32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_float_sd(CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_float_sd_m(CArray[num32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_float_tss(CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_float_tss_m(CArray[num32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_float_variance_with_fixed_mean(CArray[num32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_float_sd_with_fixed_mean(CArray[num32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_float_absdev(CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_float_absdev_m(CArray[num32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_float_skew(CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_float_skew_m_sd(CArray[num32] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_float_kurtosis(CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_float_kurtosis_m_sd(CArray[num32] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_float_lag1_autocorrelation(CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_float_lag1_autocorrelation_m(CArray[num32] $data, size_t $stride, size_t $n, num64 $mean, --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_float_covariance(CArray[num32] $data1, size_t $stride1, CArray[num32] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_float_covariance_m(CArray[num32] $data1, size_t $stride1, CArray[num32] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_float_correlation(CArray[num32] $data1, size_t $stride1, CArray[num32] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_float_spearman(CArray[num32] $data1, size_t $stride1, CArray[num32] $data2, size_t $stride2, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Weighted Samples
sub gsl_stats_float_wmean(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wvariance(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wvariance_m(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n, num64 $wmean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wsd(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wsd_m(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n, num64 $wmean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wvariance_with_fixed_mean(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wsd_with_fixed_mean(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wtss(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wtss_m(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n, num64 $wmean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wabsdev(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wabsdev_m(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n, num64 $wmean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wskew(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wskew_m_sd(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n, num64 $wmean, num64 $wsd --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wkurtosis(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_float_wkurtosis_m_sd(CArray[num32] $w, size_t $wstride, CArray[num32] $data, size_t $stride, size_t $n, num64 $wmean, num64 $wsd --> num64) is native(&LIB) is export(:weighted) { * }
# Maximum and Minimum values
sub gsl_stats_float_max(CArray[num32] $data, size_t $stride, size_t $n --> num32) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_float_min(CArray[num32] $data, size_t $stride, size_t $n --> num32) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_float_minmax(num32 $min is rw, num32 $max is rw, CArray[num32] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_float_max_index(CArray[num32] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_float_min_index(CArray[num32] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_float_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[num32] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_float_median_from_sorted_data(CArray[num32] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_float_median(CArray[num32] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_float_quantile_from_sorted_data(CArray[num32] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_float_select(CArray[num32] $data, size_t $stride, size_t $n, size_t $k --> num32) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_float_trmean_from_sorted_data(num64 $alpha, CArray[num32] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_float_gastwirth_from_sorted_data(CArray[num32] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_float_mad0(CArray[num32] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_float_mad(CArray[num32] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_float_Sn0_from_sorted_data(CArray[num32] $sorted-data, size_t $stride, size_t $n, CArray[num32] $work --> num32) is native(&LIB) is export(:scale) { * }
sub gsl_stats_float_Sn_from_sorted_data(CArray[num32] $sorted-data, size_t $stride, size_t $n, CArray[num32] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_float_Qn0_from_sorted_data(CArray[num32] $sorted-data, size_t $stride, size_t $n, CArray[num32] $work, CArray[int32] $work_int --> num32) is native(&LIB) is export(:scale) { * }
sub gsl_stats_float_Qn_from_sorted_data(CArray[num32] $sorted-data, size_t $stride, size_t $n, CArray[num32] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
