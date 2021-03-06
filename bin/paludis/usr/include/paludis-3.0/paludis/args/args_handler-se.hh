/* vim: set ro : */

/* ******************************************************** */
/* THIS IS A GENERATED FILE. DO NOT EDIT THIS FILE DIRECTLY */
/* ******************************************************** */

enum ArgsHandlerOption
{
    aho_stop_on_first_parameter,  ///< Stop on the first parameter encountered
    aho_separate_after_dashes,  ///< \since 0.47 Collect everything after a -- separately
    last_dstpo ///< Number of keys in paludis::args::ArgsHandlerOption
};

/**
 * Write a ArgsHandlerOption to a stream.
 */
std::ostream &
operator<< (std::ostream &, const ArgsHandlerOption &) PALUDIS_VISIBLE;

/**
 * Read a ArgsHandlerOption from a stream.
 */
std::istream &
operator>> (std::istream &, ArgsHandlerOption &) PALUDIS_VISIBLE;

