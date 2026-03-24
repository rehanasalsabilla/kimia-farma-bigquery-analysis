-- =========================================
-- STEP 1 : DATA UNDERSTANDING
-- Dataset : kf_final_transaction
-- Tujuan  : melihat struktur data transaksi
-- =========================================

SELECT
    transaction_id,
    date,
    branch_id,
    customer_name,
    product_id,
    price,
    discount_percentage,
    rating
FROM `manifest-alpha-491205-e6.kimia_farma.kf_final_transaction`
LIMIT 20;   