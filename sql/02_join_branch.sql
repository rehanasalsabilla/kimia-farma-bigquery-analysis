-- =====================================================
-- STEP 2 : DATA ENRICHMENT (JOIN BRANCH TABLE)
-- Project : Kimia Farma BigQuery Analysis
-- Tujuan  : Menambahkan informasi cabang (nama, kota, provinsi)
--           ke dalam data transaksi
-- =====================================================

SELECT
    t.transaction_id,
    t.date,
    t.branch_id,
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,
    t.customer_name,
    t.product_id,
    t.price,
    t.discount_percentage,
    t.rating AS rating_transaksi

FROM `manifest-alpha-491205-e6.kimia_farma.kf_final_transaction` AS t

LEFT JOIN `manifest-alpha-491205-e6.kimia_farma.kf_kantor_cabang` AS c
    ON t.branch_id = c.branch_id

LIMIT 20;