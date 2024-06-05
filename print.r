#include "lisp.h"

#output "print.nw"

void print_expr(Atom atom)
{
	switch (atom.type) {
	case AtomType_Nil:
		printf("NIL");
		break;
	case AtomType_Pair:
		putchar('(');
		print_expr(car(atom));
		atom = cdr(atom);
		while (!nilp(atom)) {
			if (atom.type == AtomType_Pair) {
				putchar(' ');
				print_expr(car(atom));
				atom = cdr(atom);
			} else {
				printf(" . ");
				print_expr(atom);
				break;
			}
		}
		putchar(')');
		break;
	case AtomType_Symbol:
		printf("%s", atom.value.symbol);
		break;
	case AtomType_Integer:
		printf("%ld", atom.value.integer);
		break;
	case AtomType_Builtin:
		printf("#<BUILTIN:%p>", (void*)atom.value.pair);
		break;
	case AtomType_Closure:
		printf("#<CLOSURE:%p>", (void*)atom.value.pair);
		break;
	case AtomType_Macro:
		printf("#<MACRO:%p>", (void*)atom.value.pair);
		break;
	}
}
