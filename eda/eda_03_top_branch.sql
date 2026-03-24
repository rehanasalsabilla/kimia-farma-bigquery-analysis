-- =====================================================
-- EDA 03 : TOP PERFORMING BRANCH
-- Tujuan : Mengidentifikasi cabang Kimia Farma dengan
--          kontribusi profit tertinggi
-- Insight yang diharapkan :
--          - cabang dengan performa terbaik
--          - distribusi profit antar cabang
-- =====================================================

SELECT
    branch_name,
    kota,
    provinsi,
    SUM(nett_profit) AS total_profit
FROM `manifest-alpha-491205-e6.kimia_farma.kf_analysis`
GROUP BY branch_name, kota, provinsi
ORDER BY total_profit DESC
LIMIT 10;