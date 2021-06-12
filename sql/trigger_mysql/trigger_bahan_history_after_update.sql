DELIMITER $$

USE `phpapidb`$$

DROP TRIGGER /*!50032 IF EXISTS */ `bahan_history_after_update`$$

CREATE
    /*!50017 DEFINER = 'root'@'localhost' */
    TRIGGER `bahan_history_after_update` AFTER UPDATE ON `bahan` 
    FOR EACH ROW BEGIN
	IF OLD.qty <> NEW.qty THEN
		INSERT INTO bahan_history(kode_bahan, nama_bahan, satuan, awal, qty_old, qty_new, disimpan_pada, STATUS, USER)
		VALUES(OLD.kode_bahan, OLD.nama_bahan, OLD.satuan, OLD.awal, OLD.qty, NEW.qty, CURRENT_TIMESTAMP(),'EDIT', CURRENT_USER );
	END IF;
END;
$$

DELIMITER ;