/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy  = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
    "monospace:pixelsize=17:antialias=true:autohint=true"  // fallback font
    "Symbols Nerd Font:pixelsize=15:antialias=true:autohint=true"  // fallback font
};
static const char *prompt = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*                          fg           bg       */
	[SchemeNorm]          = { "#ffffff", "#070707" },
	[SchemeSel]           = { "#ffffff", "#555555" },
	[SchemeSelHighlight]  = { "#F9E2AF", "#555555" },
	[SchemeNormHighlight] = { "#F9E2AF", "#070707" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
