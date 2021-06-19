SELECT 
	bahan.kode_bahan,
	bahan.nama_bahan,
	bahan.awal,
	COALESCE(SUM(masuk.qty),0) AS masuk, 
	COALESCE(vkeluar,0) AS keluar,
	COALESCE(bahan.awal,0)+COALESCE(SUM(masuk.qty),0)-COALESCE(vkeluar,0) AS stok
FROM
	bahan
		LEFT JOIN masuk ON bahan.kode_bahan=masuk.kode_bahan
		LEFT JOIN (SELECT bahan.kode_bahan, SUM(keluar.qty) AS vkeluar FROM bahan, keluar
						WHERE bahan.kode_bahan=keluar.kode_bahan
						GROUP BY keluar.kode_bahan ASC) AS pakai
				ON bahan.kode_bahan=pakai.kode_bahan
GROUP BY bahan.kode_bahan ASC



####ALTERNATIVE

SELECT
    bahan.kode_bahan
    , bahan.nama_bahan
    , bahan.satuan
    , bahan.awal
    , SUM(masuk.qty) AS masuk
    , SUM(keluar.qty) AS keluar
    , bahan.awal+SUM(masuk.qty) AS awaldanmasuk
    , bahan.awal+SUM(masuk.qty)-SUM(keluar.qty) AS stok
From bahan a
LEFT JOIN (select kode_bahan, sum(qty) as jumlah from keluar group by kode_bahan) b
On a.kode_bahan = b.kode_bahan
LEFT JOIN (select kode_bahan, sum(qty) as jumlah from masuk group by kode_bahan) c
On a.kode_bahan = c.kode_bahan



####ALTERNATIVE YANG PALING BENAR

SELECT 
	bahan.kode_bahan,
	bahan.nama_bahan,
	bahan.awal,
	COALESCE(vmasuk,0) AS masuk, 
	COALESCE(vkeluar,0) AS keluar,
	COALESCE(bahan.awal,0)+COALESCE(SUM(vmasuk),0)-COALESCE(vkeluar,0) AS stok
FROM
	bahan
		LEFT JOIN (SELECT bahan.kode_bahan, SUM(masuk.qty) AS vmasuk FROM bahan, masuk
						WHERE bahan.kode_bahan=masuk.kode_bahan
						GROUP BY masuk.kode_bahan ASC) AS m
				ON bahan.kode_bahan=m.kode_bahan
		LEFT JOIN (SELECT bahan.kode_bahan, SUM(keluar.qty) AS vkeluar FROM bahan, keluar
						WHERE bahan.kode_bahan=keluar.kode_bahan
						GROUP BY keluar.kode_bahan ASC) AS k
				ON bahan.kode_bahan=k.kode_bahan
GROUP BY bahan.kode_bahan ASC
ORDER BY bahan.kode_bahan ASC



