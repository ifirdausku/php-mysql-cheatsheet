SELECT
    bahan.kode_bahan
    , bahan.nama_bahan
    , bahan.satuan
    , bahan.awal
    , SUM(masuk.qty) AS masuk
    , SUM(keluar.qty) AS keluar
    , bahan.awal+SUM(masuk.qty) AS nilai
    , bahan.awal+SUM(masuk.qty)-SUM(keluar.qty) AS stok
FROM

    bahan
    LEFT JOIN keluar
        ON (bahan.kode_bahan = keluar.kode_bahan)
    LEFT JOIN masuk 
        ON (bahan.kode_bahan = masuk.kode_bahan)
GROUP BY bahan.kode_bahan
ORDER BY bahan.kode_bahan ASC;
