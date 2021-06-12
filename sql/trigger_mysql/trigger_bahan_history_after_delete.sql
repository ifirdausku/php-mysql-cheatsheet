DELIMITER $$

USE `phpapidb`$$

DROP TRIGGER /*!50032 IF EXISTS */ `bahan_history_after_delete`$$

CREATE
    /*!50017 DEFINER = 'root'@'localhost' */
    TRIGGER `bahan_history_after_delete` AFTER DELETE ON `bahan` 
    FOR EACH ROW BEGIN
		INSERT INTO bahan_history(kode_bahan, nama_bahan, satuan, awal, qty_old, qty_new, disimpan_pada, STATUS, user)
		VALUES(OLD.kode_bahan, OLD.nama_bahan, OLD.satuan, OLD.awal, OLD.qty, 0, CURRENT_TIMESTAMP(),'DELETE',CURRENT_USER );
END;
$$

DELIMITER ;