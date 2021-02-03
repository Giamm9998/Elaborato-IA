# Progetto-IA
All’interno del repository è presente un programma MiniZinc che permette di risolvere un problema CSP sulla creazione di un piano di studi, realizzato come progetto per l’esame di Intelligenza artificiale della facoltà di ingegneria informatica di Unifi.  
  
Il codice del progetto si trova nel file PDS.mzn,  che sfrutta i datafiles Ingegneria.dzn e Filosofia.dzn, e va eseguito tramite MiniZinc. Il programma richiede all’utente di inserire in input 5 valori:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • amax: numero massimo di crediti per i corsi con SSD affine  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • amin: numero minimo di crediti per i corsi con SSD affine  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • cmax: numero massimo di crediti per i corsi con SSD caratterizzante  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • cmin: numero minimo di crediti per i corsi con SSD affine  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • fp: numero di crediti assegnati alla prova finale  
  
In base ai valori assegnati ai parametri il programma , se esiste almeno una soluzione che rispetta tutti i vincoli del problema, elencherà tutti i piani di studio validi per il CdL. Per ottenere esattamente gli stessi risultati che ho riportato nella relazione vanno inseriti i valori di input: amax=100, amin=78, cmax=180, cmin=90, fp=6. Inoltre va configurato il solver Gecode 6.3.0 tramite il configuration editor dell’ide di MiniZInc, in modo che trovi tutte le possibili soluzioni e mostri le statistiche del problema.
