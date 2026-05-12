DELIMITER $$
CREATE PROCEDURE
transfer (IN valor DECIMAL(7, 2), IN remetante INT, IN destinatario INT)
BEGIN
INSERT INTO transaction
(txn_date, account_id, txn_type_cd, amount, funds_avail_date)
VALUES (now(), remetante, 'DBT', valor, now());
UPDATE account
SET avail_balance = avail_balance - valor, last_activity_date = date(now())
WHERE account_id = remetante;
INSERT INTO transaction
(txn_date, account_id, txn_type_cd, amount, funds_avail_date)
VALUES (now(), destinatario, 'CDT', valor, now());
UPDATE account
SET avail_balance = avail_balance + valor, last_activity_date = date(now())
WHERE account_id = destinatario;
END $$
DELIMITER ;
