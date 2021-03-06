/* vim: set ro : */

/* ******************************************************** */
/* THIS IS A GENERATED FILE. DO NOT EDIT THIS FILE DIRECTLY */
/* ******************************************************** */

        /**
         * Options for parse_user_package_dep_spec.
         *
         * \ingroup g_dep_spec
         * \since 0.26
         */
enum UserPackageDepSpecOption
{
    updso_allow_wildcards,  ///< Allow wildcards for category, package
    updso_throw_if_set,  ///< Check if it's a set, and throw GotASetNotAPackageDepSpec if so. \since 0.28
    updso_no_disambiguation,  ///< Require an explicit category. \since 0.28
    last_updso ///< Number of keys in paludis::UserPackageDepSpecOption
};

/**
 * Write a UserPackageDepSpecOption to a stream.
 */
std::ostream &
operator<< (std::ostream &, const UserPackageDepSpecOption &) PALUDIS_VISIBLE;

        /**
         * Comparators for UserKeyRequirement.
         *
         * \ingroup g_dep_spec
         * \since 1.0.1
         */
enum UserKeyRequirementOperator
{
    ukro_equal,  ///< '='  : Matches if key is equal to value, only ever matches for simple values, sets and sequences
    ukro_not_equal,  ///< '!=' : Matches if key is not equal to value, only ever matches for simple values, sets and sequences
    ukro_greater,  ///< '>'  : Matches if key is greater-than value, only ever matches for numeric values
    ukro_less_or_subset,  ///< '<'  : Matches if key is less-than value for numeric values or if values is part-of key for sets, sequences and spec trees
    ukro_exists,  ///< '?'  : Matches only if the specified key exists, takes no value
    last_ukro ///< Number of keys in paludis::UserKeyRequirementOperator
};

/**
 * Write a UserKeyRequirementOperator to a stream.
 */
std::ostream &
operator<< (std::ostream &, const UserKeyRequirementOperator &) PALUDIS_VISIBLE;

