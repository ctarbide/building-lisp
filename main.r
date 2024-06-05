#output "main.nw"

#include "lisp.h"

/* the 'main' function lives on lisp.nw
 */

const Atom nil = { AtomType_Nil };

char *slurp(const char *path)
{
	FILE *file;
	char *buf;
	long len;

	file = fopen(path, "r");
	if (!file)
		return NULL;
	fseek(file, 0, SEEK_END);
	len = ftell(file);
	fseek(file, 0, SEEK_SET);

	buf = malloc(len + 1);
	if (!buf)
		return NULL;

	fread(buf, 1, len, file);
	buf[len] = 0;
	fclose(file);

	return buf;
}

void load_file(Atom env, const char *path)
{
	char *text;

	printf("Reading %s...\n", path);
	text = slurp(path);
	if (text) {
		const char *p = text;
		Atom expr;
		while (read_expr(p, &p, &expr) == Error_OK) {
			Atom result;
			Error err = eval_expr(expr, env, &result);
			if (err) {
				printf("Error in expression:\n\t");
				print_expr(expr);
				putchar('\n');
			} else {
				print_expr(result);
				putchar('\n');
			}
		}
		free(text);
	}
}
