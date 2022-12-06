use v6;

unit module Math::Libgsl::Raw::Statistics:ver<0.0.2>:auth<zef:FRITH>;

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
sub gsl_stats_mean(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_variance(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_variance_m(CArray[num64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_sd(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_sd_m(CArray[num64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_tss(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_tss_m(CArray[num64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_variance_with_fixed_mean(CArray[num64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
sub gsl_stats_sd_with_fixed_mean(CArray[num64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:base) { * }
# Absolute deviation
sub gsl_stats_absdev(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:absdev) { * }
sub gsl_stats_absdev_m(CArray[num64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:absdev) { * }
# Higher moments (skewness and kurtosis)
sub gsl_stats_skew(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_skew_m_sd(CArray[num64] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_kurtosis(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:higher) { * }
sub gsl_stats_kurtosis_m_sd(CArray[num64] $data, size_t $stride, size_t $n, num64 $mean, num64 $sd --> num64) is native(&LIB) is export(:higher) { * }
# Autocorrelation
sub gsl_stats_lag1_autocorrelation(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:auto) { * }
sub gsl_stats_lag1_autocorrelation_m(CArray[num64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:auto) { * }
# Covariance
sub gsl_stats_covariance(CArray[num64] $data1, size_t $stride1, CArray[num64] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:covar) { * }
sub gsl_stats_covariance_m(CArray[num64] $data1, size_t $stride1, CArray[num64] $data2, size_t $stride2, size_t $n, num64 $mean1, num64 $mean2 --> num64) is native(&LIB) is export(:covar) { * }
# Correlation
sub gsl_stats_correlation(CArray[num64] $data1, size_t $stride1, CArray[num64] $data2, size_t $stride2, size_t $n --> num64) is native(&LIB) is export(:correl) { * }
sub gsl_stats_spearman(CArray[num64] $data1, size_t $stride1, CArray[num64] $data2, size_t $stride2, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:correl) { * }
# Weighted Samples
sub gsl_stats_wmean(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wvariance(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wvariance_m(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n, num64 $wmean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wsd(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wsd_m(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n, num64 $wmean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wvariance_with_fixed_mean(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wsd_with_fixed_mean(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n, num64 $mean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wtss(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wtss_m(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n, num64 $wmean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wabsdev(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wabsdev_m(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n, num64 $wmean --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wskew(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wskew_m_sd(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n, num64 $wmean, num64 $wsd --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wkurtosis(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:weighted) { * }
sub gsl_stats_wkurtosis_m_sd(CArray[num64] $w, size_t $wstride, CArray[num64] $data, size_t $stride, size_t $n, num64 $wmean, num64 $wsd --> num64) is native(&LIB) is export(:weighted) { * }
# Maximum and Minimum values
sub gsl_stats_max(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_min(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_minmax(num64 $min is rw, num64 $max is rw, CArray[num64] $data, size_t $stride, size_t $n) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_max_index(CArray[num64] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_min_index(CArray[num64] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
sub gsl_stats_minmax_index(size_t $min_index is rw, size_t $max_index is rw, CArray[num64] $data, size_t $stride, size_t $n --> size_t) is native(&LIB) is export(:minmax) { * }
# Median and Percentiles
sub gsl_stats_median_from_sorted_data(CArray[num64] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_median(CArray[num64] $data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:median) { * }
sub gsl_stats_quantile_from_sorted_data(CArray[num64] $sorted-data, size_t $stride, size_t $n, num64 $f --> num64) is native(&LIB) is export(:median) { * }
# Order Statistics
sub gsl_stats_select(CArray[num64] $data, size_t $stride, size_t $n, size_t $k --> num64) is native(&LIB) is export(:order) { * }
# Robust Location Estimates
sub gsl_stats_trmean_from_sorted_data(num64 $alpha, CArray[num64] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
sub gsl_stats_gastwirth_from_sorted_data(CArray[num64] $sorted-data, size_t $stride, size_t $n --> num64) is native(&LIB) is export(:location) { * }
# Robust Scale Estimates
sub gsl_stats_mad0(CArray[num64] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_mad(CArray[num64] $data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_Sn0_from_sorted_data(CArray[num64] $sorted-data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_Sn_from_sorted_data(CArray[num64] $sorted-data, size_t $stride, size_t $n, CArray[num64] $work --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_Qn0_from_sorted_data(CArray[num64] $sorted-data, size_t $stride, size_t $n, CArray[num64] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
sub gsl_stats_Qn_from_sorted_data(CArray[num64] $sorted-data, size_t $stride, size_t $n, CArray[num64] $work, CArray[int32] $work_int --> num64) is native(&LIB) is export(:scale) { * }
