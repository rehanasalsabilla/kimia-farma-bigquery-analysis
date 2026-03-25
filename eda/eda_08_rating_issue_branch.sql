-- =====================================================
-- EDA 08 : BRANCH WITH HIGH BRANCH RATING
--          BUT LOW TRANSACTION RATING
-- Tujuan : Evaluasi kualitas layanan cabang
-- =====================================================

SELECT
    branch_name,
    kota,
    provinsi,
    AVG(rating_cabang) AS avg_rating_cabang,
    AVG(rating_transaksi) AS avg_rating_transaksi
FROM `manifest-alpha-491205-e6.kimia_farma.kf_analysis`
GROUP BY branch_name, kota, provinsi
HAVING AVG(rating_cabang) > 4.5
ORDER BY avg_rating_transaksi ASC
LIMIT 5;