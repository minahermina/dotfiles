/* /* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
	/* 8 normal colors */
    "#131313", /* black   */
	"#F38BA8",
	"#7797b8",
	"#F9E2AF",
	"#6f6f6f",
	"#F5C2E7",
	"#94E2D5",
	"#F5F5F5",

	/* 8 bright colors */
    "#f2f2f2", /* bright black   */
	"#F38BA8",
	"#FFFFFF",
	"#F9E2AF",
	"#7797b8",
	"#F5C2E7",
	"#94E2D5",
	"#F5F5F5",

[256] = "#FFFFFF", /* default foreground colour */
[257] = "#131313", /* default background colour */
[258] = "#FAF9F6", /*575268*/
// [258] = "#7ba2e1", /*575268*/

};

/*
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultfg = 256;
unsigned int defaultbg = 257;
unsigned int defaultcs = 258;
static unsigned int defaultrcs = 258;
