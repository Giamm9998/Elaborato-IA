# CSP PIANO DI STUDI
Within the repository is a MiniZinc program for solving a CSP problem on curriculum creation, which was created as a project for the Artificial Intelligence exam of Unifi's Faculty of Computer Engineering.
  
The code for the project is found in the file PDS.mzn, which exploits the datafiles Engineering.dzn and Philosophy.dzn, and is to be run through MiniZinc. The CdL on which the program operates is indicated in the first few lines of the PDS.mzn file via the include command; to change CdLs therefore, it is necessary to change this program line to the keyword include followed by the name of the datafile (.dzn) we want to use in quotation marks (for example: include "Engineering.dzn";). The program requires the user to input 5 values:  

• amax: maximum number of credits for courses with related SSDs <br>
• amin: minimum number of credits for courses with related SSDs <br>
• cmax: maximum number of credits for courses with a characterizing SSD <br> 
• cmin: minimum number of credits for courses with characterizing SSD <br> 
• fp: number of credits assigned to the final examination <br> 
  
Based on the values assigned to the parameters, the program , if there is at least one solution that meets all the constraints of the problem, will list all the valid curricula. To get exactly the same results as I have given in the report the input values must be entered: amax=100, amin=78, cmax=180, cmin=90, fp=6. Also, the Gecode 6.3.0 solver must be configured via the MiniZInc ide's configuration editor so that it finds all possible solutions and shows the statistics of the problem.
