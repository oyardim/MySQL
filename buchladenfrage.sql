-- 1) Gesucht sind alle Lieferanten, die ihren Sitz in Freiburg haben. Geben Sie Lieferantenname, Lieferantenort und Postleitzahl aus.
-- (Lösungshinweis: Es werden drei Lieferanten ausgegeben.)
SELECT
    l.name AS 'Lieferantname',
    o.name AS 'Lieferantort',
    o.postleitzahl AS 'Postleitzahl'
FROM
   buchladen.lieferanten l
   INNER JOIN buchladen.orte o ON l.orte_orte_id = o.orte_id
WHERE
    o.name = 'Freiburg'   
;


-- 2) Gesucht sind alle Verlage, die ihren Sitz in München haben. Geben Sie Verlagsname und Verlagsort aus.
-- (Lösungshinweis: Es werden drei Verlage ausgegeben.)
SELECT
     v.name AS 'Verlagsname',
     o.name AS 'Verlagsort'
FROM
	buchladen.verlage v
    INNER JOIN buchladen.orte o ON v.orte_orte_id = o.orte_id
WHERE
    o.name = 'München'    
;


-- 3) Gesucht sind alle Bücher, die im Verlag Assal erschienen sind. Geben Sie Buchtitel, Erscheinungsjahr und Verlagsname aus, absteigend sortiert nach Erscheinungsjahr.
-- (Lösungshinweis: Es werden vier Bücher ausgegeben.)
SELECT
    b.titel AS 'Buchtitel',
    b.erscheinungsjahr AS 'Erscheinungsjahr',
    v.name AS 'Verlagsname'
FROM
    buchladen.buecher b
    INNER JOIN buchladen.verlage v ON b.verlage_verlage_id = v.verlage_id
 WHERE 
     v.name = 'Assal'   
ORDER BY b.erscheinungsjahr DESC
;    



-- 4) Gesucht sind alle Bücher des Lieferanten Schustermann. Geben Sie Buchtitel und Lieferantenname aus.
-- (Lösungshinweis: Es werden drei Bücher ausgegeben.)
SELECT 
    b.titel AS 'Buchtitel',
    l.name AS 'Lieferantname'
FROM
   buchladen.buecher b
   INNER JOIN buchladen.buecher_has_lieferanten bhl ON buecher_id = buecher_buecher_id
   INNER JOIN buchladen.lieferanten l ON lieferanten_id =lieferanten_lieferanten_id
WHERE
    l.name = 'Schustermann'
;    
   


-- 5) Gesucht sind alle Thriller. Geben Sie Buchtitel und Sparte aus, sortiert nach Buchtitel.
-- (Lösungshinweis: Es werden fünf Bücher ausgegeben, das erste ist "Ein letzter Kuss".)
SELECT 
    b.titel AS 'Buchtitel',
    s.bezeichnung AS 'Sparte'
FROM 
   buchladen.buecher b
   INNER JOIN buchladen.buecher_has_sparten bhs ON buecher_id =buecher_buecher_id
   INNER JOIN buchladen.sparten s ON sparten_id = sparten_sparten_id
WHERE
    s.bezeichnung = 'Thriller'
ORDER BY b.titel ASC   
;


-- 6) Gesucht sind alle Liebesromane. Geben Sie Buchtitel, Sparte und Verlagsname aus, sortiert nach Buchtitel aufsteigend.
-- (Lösungshinweis: Es werden sieben Datensätze ausgegeben, "Der Landarzt und seine Sekretärin" zuerst.)
SELECT
    b.titel AS 'Buchtitel',
    s.bezeichnung AS 'Sparte',
    v.name AS 'Verlagsname'
FROM 
   buchladen.buecher b    
   INNER JOIN buchladen.buecher_has_sparten bhs ON buecher_id =buecher_buecher_id
   INNER JOIN buchladen.sparten s ON sparten_id = sparten_sparten_id
   INNER JOIN buchladen.verlage v ON v.verlage_id = b.verlage_verlage_id
WHERE 
    s.bezeichnung = 'Liebe'  
ORDER BY b.titel ASC
;
    