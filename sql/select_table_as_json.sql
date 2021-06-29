### SINGLE LINE ###
SELECT CONCAT(
    '[', 
    GROUP_CONCAT(JSON_OBJECT('kode_bahan', KODE_BAHAN, 'nama_bahan', NAMA_BAHAN, 'satuan', SATUAN, 'golongan', GOLONGAN)),
    ']'
) 
FROM bahan;



### SINGLE LINE ###
SELECT JSON_ARRAYAGG(JSON_OBJECT('kode_bahan', KODE_BAHAN, 'nama_bahan', NAMA_BAHAN, 'satuan', SATUAN, 'golongan', GOLONGAN)) FROM bahan;



### PER LINE ###
SELECT JSON_ARRAY(JSON_OBJECT('kode_bahan', KODE_BAHAN, 'nama_bahan', NAMA_BAHAN, 'satuan', SATUAN, 'golongan', GOLONGAN)) FROM bahan;