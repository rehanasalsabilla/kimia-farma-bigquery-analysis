-- ============================================================
-- STEP 4 : CREATE FINAL ANALYTICAL TABLE
-- Project : Kimia Farma BigQuery Business Performance Analysis
-- Tujuan  : Membuat tabel analisa final (data mart) yang berisi
--           hasil join transaksi, cabang, produk serta
--           perhitungan metrik bisnis.
--
-- Output  : Table kf_analysis (siap digunakan untuk dashboard
--           dan business insight)
-- ============================================================

CREATE OR REPLACE TABLE
`manifest-alpha-491205-e6.kimia_farma.kf_analysis`
AS

SELECT
    -- IDENTITAS TRANSAKSI
    t.transaction_id,
    t.date,
    t.branch_id,

    -- INFORMASI CABANG
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,

    -- INFORMASI CUSTOMER & PRODUK
    t.customer_name,
    t.product_id,
    p.product_name,

    -- HARGA & DISKON
    t.price AS actual_price,
    t.discount_percentage,

    -- PERHITUNGAN GROSS PROFIT (%)
    CASE
        WHEN t.price <= 50000 THEN 0.10
        WHEN t.price <= 100000 THEN 0.15
        WHEN t.price <= 300000 THEN 0.20
        WHEN t.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba,

    -- PERHITUNGAN NETT SALES
    t.price - (t.price * t.discount_percentage) AS nett_sales,

    -- PERHITUNGAN NETT PROFIT
    (t.price - (t.price * t.discount_percentage)) *
    CASE
        WHEN t.price <= 50000 THEN 0.10
        WHEN t.price <= 100000 THEN 0.15
        WHEN t.price <= 300000 THEN 0.20
        WHEN t.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS nett_profit,

    -- RATING TRANSAKSI
    t.rating AS rating_transaksi

FROM `manifest-alpha-491205-e6.kimia_farma.kf_final_transaction` AS t

LEFT JOIN `manifest-alpha-491205-e6.kimia_farma.kf_kantor_cabang` AS c
    ON t.branch_id = c.branch_id

LEFT JOIN `manifest-alpha-491205-e6.kimia_farma.kf_product` AS p
    ON t.product_id = p.product_id;