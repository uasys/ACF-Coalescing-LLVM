#!/usr/bin/python
import sys

with open(sys.argv[1]) as f:
  lines = f.readlines()
  csv = [[s.strip() for s in l.split(',')] for l in lines]
  div_TP = 0.0
  div_FP = 0.0
  div_FN = 0.0
  col_TP = 0.0
  col_FP = 0.0
  col_FN = 0.0
  for i in range(1,len(csv)):
    dtp = float(csv[i][1])
    dfp = float(csv[i][2])
    dfn = float(csv[i][3])
    ctp = float(csv[i][4])
    cfp = float(csv[i][5])
    cfn = float(csv[i][6])
    div_TP += dtp
    div_FP += dfp
    div_FN += dfn
    col_TP += ctp
    col_FP += cfp
    col_FN += cfn
  print ""
  print "Branch Divergence:"
  print "  Precision: "+str(div_TP/(div_TP+div_FP))
  print "  Accuracy:  "+str(div_TP/(div_TP+div_FN))
  print ""
  print "Uncoalesced Accesses:"
  print "  Precision: "+str(col_TP/(col_TP+col_FP))
  print "  Accuracy:  "+str(col_TP/(col_TP+col_FN))
