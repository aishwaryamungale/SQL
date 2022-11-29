-- ==================== Assignment 3 ====================
-- ====================  Question 1  ====================
use assignment;
SELECT * FROM RENTALS;

DELIMITER //
CREATE PROCEDURE order_status(IN Y INTEGER, IN M INTEGER)
BEGIN
	SELECT ordernumber, STATUS, orderdate  FROM ORDERS
    WHERE MONTH(ORDERDATE)=M AND YEAR(orderDATE)=Y;
END //
DELIMITER  ;

call order_status(2004,11);

-- ====================  Question 2(a)  ====================
CREATE TABLE CANCELLATIONS (
ID INTEGER auto_increment,
customerNumber INTEGER NOT NULL,
orderNumber INTEGER NOT NULL,
comments text,
PRIMARY KEY(ID),
FOREIGN KEY (customernumber) REFERENCES customers(customernumber),
FOREIGN KEY (ordernumber) REFERENCES ORDERS(ordernumber)
);

-- ====================  Question 2(b)  ====================
DELIMITER //
CREATE PROCEDURE CACNCELLATION_TABLE_VALUES()
BEGIN
    INSERT INTO CANCELLATIONS(customerNumber, orderNumber,comments)
    SELECT customerNumber, orderNumber, comments FROM ORDERS
    WHERE STATUS='Cancelled';
    SELECT * FROM CANCELLATIONS;
END //
DELIMITER  ;

CALL CACNCELLATION_TABLE_VALUES();

-- ====================  Question 3  ====================
-- ==================== Question 3(a)  ====================
DELIMITER //
CREATE FUNCTION Purchase_Status ( i INT )
RETURNS varchar(20)
NOT DETERMINISTIC
BEGIN
   DECLARE pur_status varchar(20); 
   DECLARE amt float;
   SELECT SUM(amount) INTO amt FROM payments WHERE customernumber = i;
   IF amt < 25000 THEN
      SET pur_status = 'Silver';
	elseif amt > 25000 AND amt< 50000 THEN
		SET pur_status = 'Gold';
	elseif amt > 50000 THEN
		SET pur_status = 'Platinum';
   END IF;
   RETURN pur_status;
END; //
DELIMITER ;

-- ==================== Question 3(b)  ====================
SELECT customerNumber, customername, Purchase_Status(customerNumber) FROM CUSTOMERS;

-- ====================  Question 4  ====================
DELIMITER $$
CREATE TRIGGER movies_update
AFTER DELETE ON movies
FOR EACH ROW
BEGIN
    UPDATE rentals
    SET movieid = id
    WHERE movieid = OLD.id ;
END;
DELIMITER $$

CREATE TRIGGER movies_delete 
AFTER DELETE ON movies 
FOR EACH ROW 
BEGIN
    DELETE FROM  rentals
    WHERE movieid 
    NOT IN (SELECT DISTINCT id FROM movies);
END;


-- ====================  Question 5  ====================
WITH EMPRANK AS
(
  SELECT *, ROW_NUMBER() OVER( ORDER BY SALARY) AS RANKS
  FROM EMPLOYEE
)
SELECT FNAME
FROM EMPRANK
WHERE RANKS=3
ORDER BY Ranks;

-- ====================  Question 6  ====================
SELECT *, dense_rank() OVER( ORDER BY SALARY) AS RANKS
FROM EMPLOYEE
ORDER BY Ranks;
