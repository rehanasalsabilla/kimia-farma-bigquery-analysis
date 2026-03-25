-- =====================================================
-- EDA 06 : TOP 10 TOTAL TRANSACTION BY BRANCH
-- Tujuan : Mengidentifikasi cabang dengan jumlah
--          transaksi tertinggi
-- =====================================================

SELECT
    branch_name,
    provinsi,
    COUNT(transaction_id) AS total_transaksi
FROM `manifest-alpha-491205-e6.kimia_farma.kf_analysis`
GROUP BY branch_name, provinsi
ORDER BY total_transaksi DESC
LIMIT 10;