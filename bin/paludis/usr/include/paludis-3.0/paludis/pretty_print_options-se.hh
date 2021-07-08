/* vim: set ro : */

/* ******************************************************** */
/* THIS IS A GENERATED FILE. DO NOT EDIT THIS FILE DIRECTLY */
/* ******************************************************** */

enum PrettyPrintOption
{
    ppo_multiline_allowed,  ///< Print over multiple lines if appropriate
    ppo_include_special_annotations,  ///< Include dsak_expanded and dsak_synthetic annotations
    last_ppo ///< Number of keys in paludis::PrettyPrintOption
};

/**
 * Write a PrettyPrintOption to a stream.
 */
std::ostream &
operator<< (std::ostream &, const PrettyPrintOption &) PALUDIS_VISIBLE;
