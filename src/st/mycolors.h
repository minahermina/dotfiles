/* /* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
	/* 8 normal colors */
    "#101010", /* black   */
	"#F38BA8",
	"#8f8f8f",
	"#F9E2AF",
	"#6f6f6f",
	"#F5C2E7",
	"#94E2D5",
	"#F5F5F5",

	/* 8 bright colors */
    "#295340", /* bright black   */
	"#F38BA8",
	"#8f8f8f",
	"#F9E2AF",
	"#8f8f8f",
	"#ffffff",
	"#94E2D5",
    "#ffffff", /* bright black   */

[256] = "#FFFFFF", /* default foreground colour */
[257] = "#101010", /* default background colour */
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
