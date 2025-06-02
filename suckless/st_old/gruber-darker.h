/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
    /* 8 normal colors */
    "#101010", /* black   */
    "#F43841", /* red     */
    "#7cbe7c", /* green   */
    "#FFDD33", /* yellow  */
    "#96A6C8", /* blue    */
    "#9E95C7", /* magenta */
    "#95A99F", /* cyan    */
    "#E4E4E4", /* white   */
    /* 8 bright colors */
    "#453D41", /* bright black   */
    "#F43841", /* bright red     */
    "#7cbe7c", /* bright green   */
    "#FFDD33", /* bright yellow  */
    "#96A6C8", /* bright blue    */
    "#9E95C7", /* bright magenta */
    "#95A99F", /* bright cyan    */
    "#FFFFFF", /* bright white   */

    /* default colors */
    [256] = "#E4E4E4", /* default foreground color */
    [257] = "#181818", /* default background color */
    [258] = "#FFDD33", /* default cursor color */
    [259] = "#E4E4E4", /* default foreground color */
};
//
/*
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultfg = 256;
unsigned int defaultbg = 257;
unsigned int defaultcs = 258;
unsigned int defaultrcs = 259;
