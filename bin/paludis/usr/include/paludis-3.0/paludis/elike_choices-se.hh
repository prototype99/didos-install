/* vim: set ro : */

/* ******************************************************** */
/* THIS IS A GENERATED FILE. DO NOT EDIT THIS FILE DIRECTLY */
/* ******************************************************** */

enum ELikeWorkChoiceValueParameter
{
    ewcvp_preserve,  ///< Always preserve
    ewcvp_leave,  ///< Do not remove, but allow destructive merges
    ewcvp_tidyup,  ///< Tidy up after a successful build
    ewcvp_remove,  ///< Always remove
    last_ewcvp ///< Number of keys in paludis::ELikeWorkChoiceValueParameter
};

/**
 * Write a ELikeWorkChoiceValueParameter to a stream.
 */
std::ostream &
operator<< (std::ostream &, const ELikeWorkChoiceValueParameter &) PALUDIS_VISIBLE;

/**
 * Read a ELikeWorkChoiceValueParameter from a stream.
 */
std::istream &
operator>> (std::istream &, ELikeWorkChoiceValueParameter &) PALUDIS_VISIBLE;

enum ELikeSymbolsChoiceValueParameter
{
    escvp_preserve,  ///< Do not modify symbols
    escvp_strip,  ///< Strip symbols
    escvp_split,  ///< Split symbols into debug files
    escvp_compress,  ///< Split symbols into compressed debug files
    last_escvp ///< Number of keys in paludis::ELikeSymbolsChoiceValueParameter
};

/**
 * Write a ELikeSymbolsChoiceValueParameter to a stream.
 */
std::ostream &
operator<< (std::ostream &, const ELikeSymbolsChoiceValueParameter &) PALUDIS_VISIBLE;

/**
 * Read a ELikeSymbolsChoiceValueParameter from a stream.
 */
std::istream &
operator>> (std::istream &, ELikeSymbolsChoiceValueParameter &) PALUDIS_VISIBLE;

