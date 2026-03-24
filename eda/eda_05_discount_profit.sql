-- =====================================================
-- EDA 05 : DISCOUNT VS PROFIT
-- Tujuan : Menganalisis pengaruh tingkat diskon terhadap
--          jumlah transaksi dan total profit
-- =====================================================

SELECT
    ROUND(discount_percentage,2) AS discount_rate,
    COUNT(transaction_id) AS total_transaksi,
    SUM(nett_profit) AS total_profit
FROM `manifest-alpha-491205-e6.kimia_farma.kf_analysis`
GROUP BY discount_rate
ORDER BY discount_rate;