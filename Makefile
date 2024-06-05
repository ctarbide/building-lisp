
# automatically generated from Makefile.nw

SH = sh -eu

TARGETS = \
    rttdef.h builtin.nw data.nw eval.nw main.nw \
    print.nw read.nw lisp.c lisp

all: $(TARGETS)

rttdef.h: \
    Makefile.nw
	nofake --error -R'build rttdef.h' $^ | $(SH)

builtin.nw: \
    Makefile.nw builtin.r rttdef.h
	nofake --error -R'build builtin.nw' $^ | $(SH)

data.nw: \
    Makefile.nw data.r rttdef.h
	nofake --error -R'build data.nw' $^ | $(SH)

eval.nw: \
    Makefile.nw eval.r rttdef.h
	nofake --error -R'build eval.nw' $^ | $(SH)

main.nw: \
    Makefile.nw lisp.h main.r rttdef.h
	nofake --error -R'build main.nw' $^ | $(SH)

print.nw: \
    Makefile.nw print.r rttdef.h
	nofake --error -R'build print.nw' $^ | $(SH)

read.nw: \
    Makefile.nw read.r rttdef.h
	nofake --error -R'build read.nw' $^ | $(SH)

lisp.c: \
    Makefile.nw builtin.nw data.nw eval.nw lisp.nw \
    main.nw print.nw read.nw repl.nw
	nofake --error -R'build lisp.c' $^ | $(SH)

lisp: \
    Makefile.nw builtin.nw data.nw eval.nw lisp.c \
    lisp.nw main.nw print.nw read.nw repl.nw
	nofake --error -R'build lisp' $^ | $(SH)

clean:
	-rm -f $(TARGETS)
