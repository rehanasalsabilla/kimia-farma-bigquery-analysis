-- =====================================================
-- EDA 01 : SALES TREND PER YEAR
-- Tujuan : Mengetahui tren penjualan Kimia Farma
--          berdasarkan total nett sales setiap tahun
-- =====================================================

SELECT
    EXTRACT(YEAR FROM date) AS tahun,
    SUM(nett_sales) AS total_nett_sales
FROM `manifest-alpha-491205-e6.kimia_farma.kf_analysis`
GROUP BY tahun
ORDER BY tahun;