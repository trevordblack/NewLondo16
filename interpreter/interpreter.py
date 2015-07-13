# Copyright            Trevor Black 2015
# Created:             10 July, 2015
# Last Modified:       10 July, 2015

# WARNING:
# IS not currently compatible across Win/Linux
# assumes return characters are /n alone

f = open('assembly.nl_16', 'r')
asm = f.read()

# Not dealing with cases by converting everything to lowercase immediately
asm = asm.lower()
# Not dealing with underscores by annihlating them immediately
asm = asm.replace('_','')

bin = ''

# Finds the next line termination character
term = string.find(asm, '\n')
while term != -1:
	print asm
	inst = asm[:term]
	print inst
	asm = asm[term+1:]
	inst_bin = decode_inst(inst)
	bin = bin + inst_bin
	term = string.find(asm, '\n')


g = open('binary', 'w')
g.write('bin')



def decode_inst(inst):



