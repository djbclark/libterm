#include <stdint.h>
#include <sys/types.h>
#include <libterm.h>

typedef struct term_t_i {
	// Width in characters
	int width;
	// Height in characters
	int height;
	// Total height of buffer including offscreen
	int history;
	// Current top row of the buffer
	int row;
	// Cursor row
	int crow;
	// Cursor column
	int ccol;
	// Grid of characters
	uint32_t **grid;
	// Grid of attributes
	uint32_t **attribs;
	// pid of the child
	pid_t child;
	// pty file descriptor
	int fd;
	// render callback
	void (*update)(term_t handle, int x, int y, int width, int height);
	// Whether we're in the midst of processing an escape code
	bool escape_mode;
	// Bytes that have been received so far for an escape code
	char *escape_code;
	int escape_bytes;
	int escape_max_bytes;
	// Name of the shell to use
	char *shell;
	// Type of terminal to emulate
	term_type type;
	// opaque user data
	void *user_data;
} term_t_i;

bool term_allocate_grid(term_t_i *term);
void term_release_grid(term_t_i *term);
void term_process_output_data(term_t_i *term, char *buf, int length);
int term_send_escape(term_t_i *term, char *buf, int length);
bool term_fork(term_t_i *term);
void term_slay(term_t_i *term);
void term_shiftrows(term_t_i *term);

#define TO_S(x) ((term_t_i *)x)
#define TO_H(x) ((term_t)x)
