CREATE TRIGGER `keluar_dump_after_update` AFTER UPDATE ON `keluar` FOR EACH ROW BEGIN
	IF (OLD.tanggal='0000-00-00' AND NEW.tanggal!='0000-00-00') THEN
		INSERT INTO keluar_history(no_keluar, tanggal)
		VALUES(OLD.no_keluar, NEW.tanggal);
	END IF;
END
