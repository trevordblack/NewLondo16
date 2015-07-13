This interpreter will be written in Python 2.7

The order of optimizations

1) Convert NL16 into binary
  Functions as an attempt to create binary for the ensuing hdl
  This pass will not support:
  	binary or decimal values
  	Address names

2) Convert all Supported Syntax to NL16 Syntax
  This pass functions to convert binary & decimal into hexidecimal
  This pass also maps address names with branch distances

3) Interpret synthesized commands into NL16 syntax
  This pass natively interprets synthesized commands (e.g. load32) into hexidecimal syntax only

