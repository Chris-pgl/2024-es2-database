-- Esercizi solo con SELECT
-- 1. Seleziona tutti i professori dal dipartimento di Informatica.
-- res: 
SELECT * 
FROM professor 
WHERE department = 'Informatica';

-- 2. Elenca tutti gli studenti iscritti nell'anno 2021.
-- res: 
SELECT * 
FROM student 
WHERE subscription_year = 2021;

-- 3. Visualizza tutti i corsi offerti dal dipartimento di Fisica.
-- res: 
SELECT * 
FROM course 
WHERE department = 'Fisica';


-- 4. Mostra i nomi dei corsi insieme ai relativi dipartimenti.
-- res: 
SELECT name, department 
FROM course;

-- 5. Conta il numero totale di studenti iscritti all'università.
-- res: 
SELECT COUNT(*) AS total_students 
FROM student;

-- Esercizi con GROUP BY e HAVING
-- res: 
-- 6. Conta quanti corsi sono offerti in ogni dipartimento.
-- res: 
SELECT department, COUNT(*) AS course_count 
FROM course 
GROUP BY department;

-- 7. Trova i dipartimenti che hanno più di 3 corsi.
-- res: 
SELECT department, COUNT(*) AS course_count 
FROM course 
GROUP BY department 
HAVING COUNT(*) > 3;    
-- nessun dipartimento a più di 3 corsi



-- 8. Elenca il numero di studenti iscritti per ogni anno di iscrizione.
-- res: 
SELECT subscription_year, COUNT(*) AS student_count 
FROM student 
GROUP BY subscription_year;

-- 10. Trova i professori che insegnano più di un corso.
-- res: 
SELECT professor_id, COUNT(*) AS course_count
FROM course
GROUP BY professor_id
HAVING COUNT(*) > 1; 
-- risultato nullo


-- Esercizi con JOIN
-- res: 
SELECT s.name AS student_name, c.name AS course_name
FROM student s
JOIN course_subscription cs ON s.id = cs.student_id
JOIN course c ON cs.course_id = c.id;


-- 11. Mostra il nome di ogni studente insieme al nome del corso a cui sono iscritti.
-- res: 
SELECT s.name AS student_name, c.name AS course_name
FROM student s
JOIN course_subscription cs ON s.id = cs.student_id
JOIN course c ON cs.course_id = c.id;


-- 12. Elenca tutti i corsi insieme ai nomi dei professori che li insegnano.
-- res: 
SELECT c.name AS course_name, p.name AS professor_name
FROM course c
JOIN professor p ON c.professor_id = p.id;


-- 13. Trova gli studenti e i corsi relativi al dipartimento di Chimica.
-- res: 
SELECT s.name AS student_name, c.name AS course_name
FROM student s
JOIN course_subscription cs ON s.id = cs.student_id
JOIN course c ON cs.course_id = c.id
WHERE c.department = 'Chimica';


-- 14. Visualizza i nomi degli studenti e i corsi che hanno frequentato nel 2022.
-- res: 
SELECT s.name AS student_name, c.name AS course_name
FROM student s
JOIN course_subscription cs ON s.id = cs.student_id
JOIN course c ON cs.course_id = c.id
WHERE s.subscription_year = 2022;


-- 15. Elencare i professori con i loro corsi e i relativi dipartimenti.
-- res: 
SELECT p.name AS professor_name, c.name AS course_name, c.department
FROM professor p
JOIN course c ON p.id = c.professor_id;

-- DELETED
-- 16. Trova i corsi senza studenti iscritti.
-- res: 
-- DELETED

-- DELETED
-- 17. Mostra i corsi con più di 5 iscritti.
-- res: 
-- DELETED

-- DELETED
-- 18. Elenca tutti i professori che non hanno corsi assegnati.
-- res: 
-- DELETED


-- 19. Visualizza i corsi con il maggior numero di studenti.
-- res: 
SELECT c.name AS course_name, COUNT(cs.student_id) AS student_count
FROM course c
JOIN course_subscription cs ON c.id = cs.course_id
GROUP BY c.id
ORDER BY student_count DESC
LIMIT 1;


-- DELETED
-- 20. Trova gli studenti che sono iscritti a più di 3 corsi.
-- res: 
-- DELETED
