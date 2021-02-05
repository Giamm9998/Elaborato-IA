include "Ingegneria.dzn";
%include "Filosofia.dzn";
enum exams;
array[exams] of int: cfu;
enum CSSD;
enum ASSD;
set of int: dp;
int: fp;
enum SSD= A(ASSD) ++ C(CSSD);
array[exams] of SSD: SSD_of_exam;
array[exams] of int: dp_of_exam;
int: totalCFU= sum([cfu[exam]| exam in exams]);
int: amin;
int: amax;
int: cmin;
int: cmax;
array[exams] of var bool: pds;

%Vincolo sui cfu per SSD
constraint sum([cfu[exam] | exam in exams where SSD_of_exam[exam] in A(ASSD) /\ pds[exam]]) <=amax /\
           sum([cfu[exam] | exam in exams where SSD_of_exam[exam] in A(ASSD)/\ pds[exam]]) >=amin;
constraint sum([cfu[exam] | exam in exams where SSD_of_exam[exam] in C(CSSD) /\ pds[exam]] ) <=cmax /\
           sum([cfu[exam] | exam in exams where SSD_of_exam[exam] in C(CSSD)/\ pds[exam]] ) >=cmin;

%Vincolo sui cfu totali           
constraint sum([cfu[exam] | exam in exams where pds[exam]])==180-fp;

%Vincolo sui cfu per anno
constraint sum([cfu[exam] | exam in exams where pds[exam] /\ (dp_of_exam[exam] == 1 \/ dp_of_exam[exam] == 2)])==60;
constraint sum([cfu[exam] | exam in exams where pds[exam] /\ (dp_of_exam[exam] == 3 \/ dp_of_exam[exam] == 4)])==60;

%Vincolo sul semestre della prova finale
constraint sum([cfu[exam] | exam in exams where pds[exam] /\ dp_of_exam[exam] == 6]) ==30-fp; 

%Vincolo sui cfu per periodo didattico
constraint forall(n in dp)(sum([cfu[exam] | exam in exams where pds[exam] /\ dp_of_exam[exam] == n]) <=30); 

%Vincolo (ridondante) sui cfu degli esami non scelti
constraint redundant_constraint(sum([cfu[exam] | exam in exams where pds[exam]==false]) ==totalCFU-(180-fp));

solve ::bool_search(pds, first_fail, indomain_min)
satisfy;

output["PIANO DI STUDI\n\n"]++
      ["\(e)  CFU: \(cfu[e])  SSD: \(SSD_of_exam[e])  PD: \(dp_of_exam[e]) \n" | e in exams where fix(pds[e])]++
      ["\nCFU TOTALI:\(sum([cfu[e] | e in exams where fix(pds[e])]))"]++
      ["\nCFU ASSD: \(sum([cfu[exam] | exam in exams where fix(pds[exam]) /\  SSD_of_exam[exam] in A(ASSD)]))"] ++
      ["\nCFU CSSD: \(sum([cfu[exam] | exam in exams where fix(pds[exam]) /\  SSD_of_exam[exam] in C(CSSD)]))"] ++
      ["\nCFU semestre \(n): \(sum([cfu[exam] | exam in exams where fix(pds[exam]) /\  dp_of_exam[exam]==n]))" | n in dp];
output["\n\nEsami non scelti:"]++
      ["\n\(exam)   PD: \(dp_of_exam[exam])   CFU: \(cfu[exam])"|exam in exams where fix(pds[exam])==false];
