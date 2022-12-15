zahlen-- SQL Abfrage

/*
      SELECT Abfrage:
     1. einfache select
     
     
     SELECT
     
     Spalte_1, Spalte_2, ... , Spalte_n   
     
     
     FROM
     
     Tabelle_1
     
     
     
     ;
     SELECT
         *-> alle Spalten
         
     
     Aggregat-Funktionen:
         COUNT(spalte_name)  > gibt anzahl der Zeile zurück
         z.b.
         COUNT(idlaender)
         COUNT(*)
         
     AS -> alias für Spalte_name oder Tabelle_name
     
     SELECT
         COUNT(*) AS 'Anzahl_der_Länder'
         
         
     WHERE -> Where-Klausel : Bedingungen 
     Operator dazu sind "AND" , "OR" wenn mehrere Bedingungen vorkommt.
     SELECT
     
     FROM
     
     WHERE
		 landname = "Deutschland" AND 
		 landname = "China" AND
         landname = "Bulgarien"
         
     ;
     
     NULL -> in where-klausen
     
     IS NULL
     IS NOT NULL
         
     
	
         
     
*/ 
USE parkhome;
SELECT
    idlaender,
    landname

FROM
	parkhome.laender
 ; 
 
 SELECT
     *
 FROM
     parkhome.laender
 ;  
 
  SELECT
     COUNT(*)  AS 'Anzahl_der_Länder'
 FROM
     parkhome.laender
 ;  
 
 SELECT
     *
 FROM
     parkhome.laender
     
 WHERE
            landname = "Deutschland" 
		 OR landname = "China" 
         OR landname = "Bulgarien"
 ;  
 
 SELECT
     COUNT(*) AS 'Anzahl der Länder'
 FROM
     parkhome.laender
     
 WHERE
            landname IS NOT NULL
 ;  
     

     
