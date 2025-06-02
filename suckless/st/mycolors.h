/* /* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
	/* 8 normal colors */
    "#070707", /* black   */
	"#CC241D",
	"#8f8f8f",
	"#F9E2AF",
	"#8f8f8f",
	"#F5C2E7",
	"#94E2D5",
	"#dedede",

	/* 8 bright colors */
	"#6D8AA8",
	"#CC241D",
	"#8f8f8f",
	"#F9E2AF",
	"#8f8f8f",
	"#dedede",
	"#94E2D5",
	"#F9E2AF",

[256] = "#dedede", /* default foreground colour */
[257] = "#070707", /* default background colour */
[258] = "#FAF9F6", /*575268*/

};

/*
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultfg = 256;
unsigned int defaultbg = 257;
unsigned int defaultcs = 258;
static unsigned int defaultrcs = 258;
