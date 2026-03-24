-- =====================================================
-- EDA 02 : TOTAL PROFIT PER PROVINSI
-- Tujuan : Mengetahui wilayah dengan kontribusi profit
--          terbesar bagi Kimia Farma
-- Insight yang diharapkan :
--          - provinsi paling profitable
--          - distribusi keuntungan per wilayah
-- =====================================================

SELECT
    provinsi,
    SUM(nett_profit) AS total_profit
FROM `manifest-alpha-491205-e6.kimia_farma.kf_analysis`
GROUP BY provinsi
ORDER BY total_profit DESC;