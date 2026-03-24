-- =====================================================
-- STEP 3 : DATA ENRICHMENT (JOIN PRODUCT TABLE)
-- Project : Kimia Farma BigQuery Analysis
-- Tujuan  : Menambahkan informasi nama produk obat
--           ke dalam dataset transaksi + cabang
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
    p.product_name,

    -- rename harga agar sesuai requirement bisnis
    t.price AS actual_price,

    t.discount_percentage,
    t.rating AS rating_transaksi

FROM `manifest-alpha-491205-e6.kimia_farma.kf_final_transaction` AS t

LEFT JOIN `manifest-alpha-491205-e6.kimia_farma.kf_kantor_cabang` AS c
    ON t.branch_id = c.branch_id

LEFT JOIN `manifest-alpha-491205-e6.kimia_farma.kf_product` AS p
    ON t.product_id = p.product_id

LIMIT 20;