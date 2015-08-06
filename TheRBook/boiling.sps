DATA LIST FILE= "boiling.txt"  free (",")
/ X_blng_p Y_100_l_ ei  .

VARIABLE LABELS
X_blng_p "X_boiling_point" 
 Y_100_l_ "Y_100_log_pressure" 
 ei "ei" 
 .

EXECUTE.
