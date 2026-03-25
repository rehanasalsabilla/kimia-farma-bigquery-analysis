-- =====================================================
-- EDA 07 : TOP 10 NETT SALES BY BRANCH
-- Tujuan : Mengidentifikasi cabang dengan kontribusi
--          pendapatan terbesar
-- =====================================================

SELECT
    branch_name,
    provinsi,
    SUM(nett_sales) AS total_sales
FROM `manifest-alpha-491205-e6.kimia_farma.kf_analysis`
GROUP BY branch_name, provinsi
ORDER BY total_sales DESC
LIMIT 10;