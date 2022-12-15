-- 1. Lassen Sie sich mit SELECT alle Datensätze Ihrer DVD-Sammlung ausgeben.
SELECT
   *
FROM
   filmedatenbank.dvd_sammlung
;


-- 2. Erstellen Sie eine Anweisung, die alle Filmtitel und die jeweils zugehörige Nummer ausgibt.
SELECT
    d.film AS 'Filmtitel',
    d.nummer AS 'Nummer'
FROM
    filmedatenbank.dvd_sammlung d
;
    

-- 3. Erstellen Sie eine Anweisung, die alle Filmtitel und den jeweils zugehörigen Regisseur ausgibt.
SELECT
    d.film AS 'Filmtitel',
    d.regisseur AS 'Regisseur'
FROM
    filmedatenbank.dvd_sammlung d
;    


-- 4. Erstellen Sie eine Liste mit allen Filmen von Quentin Tarantino.
SELECT
    d.film AS 'Filmtitel',
    d.regisseur AS 'Regisseur'
FROM
    filmedatenbank.dvd_sammlung d
WHERE
    d.regisseur = 'Quentin Tarantino'   
;  
  

-- 5. Erstellen Sie eine Liste mit allen Filmen von Steven Spielberg.
SELECT
    d.film AS 'Filmtitel',
    d.regisseur AS 'Regisseur'
FROM
    filmedatenbank.dvd_sammlung d
WHERE
    d.regisseur = 'Steven Spielberg'   
;  
  

-- 6. Erstellen Sie eine Liste aller Filme, in denen der Regisseur den Vornamen "Steven" hat.
SELECT
    d.film AS 'Filmtitel',
    d.regisseur AS 'Regisseur'
FROM
    filmedatenbank.dvd_sammlung d
ORDER BY d.regisseur DESC
LIMIT 3
;
  

-- 7. Erstellen Sie eine Liste mit allen Filmen, die länger als 2 Stunden sind.
SELECT
     d.film,
     d.laenge_minuten
FROM 
    filmedatenbank.dvd_sammlung d
GROUP BY   d.film   
HAVING  d.laenge_minuten > 120   
;


-- 8. Erstellen Sie eine Liste mit allen Filmen, die von Tarantino oder von Spielberg gedreht wurden.
SELECT
    d.film AS 'Filmtitel',
    d.regisseur AS 'Regisseur'
FROM
    filmedatenbank.dvd_sammlung d
WHERE
    d.regisseur = 'Quentin Tarantino' OR d.regisseur = 'Steven Spielberg' 
;
 

-- 9. Suchen Sie alle Filme heraus, die von Tarantino gedreht wurden und kürzer als 90 Minuten sind.
SELECT
    d.film AS 'Filmtitel',
    d.regisseur AS 'Regisseur',
    d.laenge_minuten
FROM
    filmedatenbank.dvd_sammlung d
WHERE
    d.regisseur = 'Quentin Tarantino'
HAVING  d.laenge_minuten < 90
;  


-- 10. Sie erinnern sich an einen Film, in dessen Titel "Sibirien" vorkam. Suchen Sie ihn.
SELECT
     d.film AS 'Filmen,in dessen Titel "Sibirien" vorkam'
FROM
     filmedatenbank.dvd_sammlung d
WHERE
     d.film
LIKE '%Sibirien%'
;


-- 11. Lassen Sie sich alle Teile von "Das große Rennen" ausgeben.
SELECT
   *
FROM
    filmedatenbank.dvd_sammlung d
WHERE 
    d.film = 'Das große Rennen' 
;   
   

-- 12. Lassen Sie sich eine Liste aller Filme ausgeben, sortiert nach Regisseur.
SELECT
     d.film,
     d.regisseur
FROM
	filmedatenbank.dvd_sammlung d
;    
	

-- 13. Lassen Sie sich eine Liste aller Filme ausgeben, sortiert nach Regisseur, dann nach Filmtitel.
SELECT
    d.regisseur AS 'Regisseur',
    d.film AS 'Filmtitel'
FROM
   filmedatenbank.dvd_sammlung d
;        


-- 14. Lassen Sie sich eine Liste aller Filme von Tarantino ausgeben, die längsten zuerst.
SELECT
	d.laenge_minuten,
    d.film,
    d.regisseur
FROM
    filmedatenbank.dvd_sammlung d
WHERE
    d.regisseur = 'Quentin Tarantino'     
;    