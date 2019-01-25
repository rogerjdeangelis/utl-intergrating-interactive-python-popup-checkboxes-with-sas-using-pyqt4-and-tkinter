%let pgm=utl-intergrating-interactive-python-popup-checkboxes-with-sas-using-pyqt4-and-tkinter ;                                
                                                                                                                                
Intergrating interactive python popup checkboxes with sas using pyqt4 and tkinter;                                              
                                                                                                                                
Python is aleader in web, sever and workstation interactive forms?                                                              
                                                                                                                                
Problem: Select SAS table to print using a popup checkbox                                                                       
                                                                                                                                
github                                                                                                                          
https://tinyurl.com/ybx7ag4h                                                                                                    
https://github.com/rogerjdeangelis/utl-intergrating-interactive-python-popup-checkboxes-with-sas-using-pyqt4-and-tkinter        
                                                                                                                                
inspired by                                                                                                                     
https://tinyurl.com/y9g6p4en                                                                                                    
https://stackoverflow.com/questions/54262868/how-to-center-the-text-in-the-list-of-the-qcombobox                                
                                                                                                                                
PyQt4 solution                                                                                                                  
https://tinyurl.com/ybx33tf4                                                                                                    
https://github.com/rogerjdeangelis/utl_sas_python_interactive_checkbox_input_to_sas                                             
                                                                                                                                
see tkinter solutions                                                                                                           
https://tinyurl.com/y7o4hzyq                                                                                                    
https://github.com/rogerjdeangelis/utl_interactive_checkbox_input_using_python_tkinter_to_subset_sas_dataset                    
                                                                                                                                
macros                                                                                                                          
https://tinyurl.com/y9nfugth                                                                                                    
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                      
                                                                                                                                
                                                                                                                                
INPUT                                                                                                                           
=====                                                                                                                           
                                                                                                                                
  sashelp.class                                                                                                                 
  sashelp.iris                                                                                                                  
                                                                                                                                
                                                                                                                                
EXAMPLE OUTPUT  (select class and a listing of sashelp.class will appear)                                                       
-------------------------------------------------------------------------                                                       
                                                                                                                                
    +---+---------------+                                                                                                       
    |   |  --   []  [X] |                                                                                                       
    +---+---------------+                                                                                                       
    |                   |                                                                                                       
    |  +---+            |                                                                                                       
    |  | X |  Class     |                                                                                                       
    |  +---+            |                                                                                                       
    |                   |                                                                                                       
    |  +---+            |                                                                                                       
    |  |   |  Iris      |                                                                                                       
    |  +---+            |                                                                                                       
    |                   |                                                                                                       
    +-------------------+                                                                                                       
                                                                                                                                
Table sashelp.Class                                                                                                             
                                                                                                                                
Obs    NAME       SEX    AGE    HEIGHT    WEIGHT                                                                                
                                                                                                                                
  1    Alfred      M      14     69.0      112.5                                                                                
  2    Alice       F      13     56.5       84.0                                                                                
  3    Barbara     F      13     65.3       98.0                                                                                
  4    Carol       F      14     62.8      102.5                                                                                
  5    Henry       M      14     63.5      102.5                                                                                
 ...                                                                                                                            
                                                                                                                                
                                                                                                                                
PROCESS                                                                                                                         
=======                                                                                                                         
                                                                                                                                
%symdel frompy / nowarn;                                                                                                        
                                                                                                                                
%utl_submit_py64('                                                                                                              
import sys;                                                                                                                     
import pyperclip;                                                                                                               
from PyQt4.QtCore import *;                                                                                                     
from PyQt4.QtGui import *;                                                                                                      
class checkdemo(QWidget):;                                                                                                      
.  def __init__(self, parent = None):;                                                                                          
.     super(checkdemo, self).__init__(parent);                                                                                  
.     layout = QHBoxLayout();                                                                                                   
.     self.b1 = QCheckBox("Class");                                                                                             
.     self.b1.setChecked(False);                                                                                                
.     self.b1.stateChanged.connect(lambda:self.btnstate(self.b1));                                                              
.     layout.addWidget(self.b1);                                                                                                
.     self.b2 = QCheckBox("Iris");                                                                                              
.     self.b2.toggled.connect(lambda:self.btnstate(self.b2));                                                                   
.     layout.addWidget(self.b2);                                                                                                
.     self.setLayout(layout);                                                                                                   
.     self.setWindowTitle("checkbox demo");                                                                                     
.  def btnstate(self,b):;                                                                                                       
.     if b.text() == "Class":;                                                                                                  
.        if b.isChecked() == True:;                                                                                             
.           pyperclip.copy("Class");                                                                                            
.     if b.text() == "Iris":;                                                                                                   
.           pyperclip.copy("Iris");                                                                                             
def main():;                                                                                                                    
.  app = QApplication(sys.argv);                                                                                                
.  ex = checkdemo();                                                                                                            
.  ex.show();                                                                                                                   
.  sys.exit(app.exec_());                                                                                                       
if __name__ == "__main__":;                                                                                                     
.  main();                                                                                                                      
',return=frompy);                                                                                                               
                                                                                                                                
%put &=frompy;                                                                                                                  
                                                                                                                                
proc print data=sashelp.&frompy;                                                                                                
title "Table sashelp.&frompy";                                                                                                  
run;quit;                                                                                                                       
                                                                                                                                
                                                                                                                                
OUTPUT                                                                                                                          
======                                                                                                                          
see above                                                                                                                       
                                                                                                                                
                                                                                                                                
