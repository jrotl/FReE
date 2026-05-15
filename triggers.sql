DELIMITER $$

CREATE TRIGGER t_dbt_cdt AFTER INSERT ON transaction
FOR EACH ROW
BEGIN
UPDATE account SET
avail_balance = IF(NEW.txn_type_cd = 'DBT',
avail_balance - NEW.amount,
avail_balance + NEW.amount)
WHERE account_id = NEW.account_id;
END $$

CREATE TRIGGER t2_dbt_cdt AFTER DELETE ON transaction
FOR EACH ROW
BEGIN
UPDATE account SET
avail_balance = IF(OLD.txn_type_cd = 'DBT',
avail_balance + OLD.amount,
avail_balance - OLD.amount)
WHERE account_id = OLD.account_id;
END $$

DELIMITER ;
