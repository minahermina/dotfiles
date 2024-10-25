/* /* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
	/* 8 normal colors */
	"#585B70",
	"#F38BA8",
	"#89B4FA",
	"#F9E2AF",
	"#FFFFFF",
	"#F5C2E7",
	"#94E2D5",
	"#F5F5F5",

	/* 8 bright colors */
	"#585B70",
	"#F38BA8",
	"#FFFFFF",
	"#F9E2AF",
	"#89B4FA",
	"#F5C2E7",
	"#94E2D5",
	"#F5F5F5",

[256] = "#FFFFFF", /* default foreground colour */
[257] = "#16181d", /* default background colour */
[258] = "#FAF9F6", /*575268*/

};

/*
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultfg = 256;
unsigned int defaultbg = 257;
unsigned int defaultcs = 258;
static unsigned int defaultrcs = 258;
