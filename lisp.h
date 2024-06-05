
typedef enum {
	Error_OK = 0,
	Error_Syntax,
	Error_Unbound,
	Error_Args,
	Error_Type,
	Error_Exhaustion
} Error;

struct Atom;

typedef int (*Builtin)(struct Atom args, struct Atom *result);

struct Atom {
	enum {
		AtomType_Nil,
		AtomType_Pair,
		AtomType_Symbol,
		AtomType_Integer,
		AtomType_Builtin,
		AtomType_Closure,
		AtomType_Macro
	} type;

	union {
		struct Pair *pair;
		const char *symbol;
		long integer;
		Builtin builtin;
	} value;
};

struct Pair {
	struct Atom atom[2];
};

struct Allocation {
	struct Pair pair;
	struct Allocation *next;
	int mark;
};

typedef struct Atom Atom;

#define car(p) ((p).value.pair->atom[0])
#define cdr(p) ((p).value.pair->atom[1])
#define nilp(atom) ((atom).type == AtomType_Nil)
