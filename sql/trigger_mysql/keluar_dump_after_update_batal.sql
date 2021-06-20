CREATE TRIGGER `keluar_dump_after_update_batal` AFTER UPDATE ON `keluar` FOR EACH ROW BEGIN
	IF NEW.tanggal='0000-00-00' THEN
		DELETE FROM keluar_history
		WHERE no_keluar=OLD.no_keluar;
	END IF;
END
