-- =====================================================
-- EDA 04 : TOP SELLING PRODUCT
-- Tujuan : Mengidentifikasi produk dengan kontribusi
--          penjualan dan profit terbesar
-- =====================================================

SELECT
    product_name,
    SUM(nett_sales) AS total_sales,
    SUM(nett_profit) AS total_profit
FROM `manifest-alpha-491205-e6.kimia_farma.kf_analysis`
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;