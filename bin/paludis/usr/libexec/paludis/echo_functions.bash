#!/usr/bin/env bash
# vim: set sw=4 sts=4 et :



# Copyright (c) 2006, 2007, 2008, 2009, 2010 Ciaran McCreesh
#
# Based in part upon ebuild.sh from Portage, which is Copyright 1995-2005
# Gentoo Foundation and distributed under the terms of the GNU General
# Public License v2.
#
# This file is part of the Paludis package manager. Paludis is free software;
# you can redistribute it and/or modify it under the terms of the GNU General
# Public License, version 2, as published by the Free Software Foundation.
#
# Paludis is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc., 59 Temple
# Place, Suite 330, Boston, MA  02111-1307  USA

[[ -z ${PALUDIS_COLOURS} ]] && PALUDIS_COLOURS=

COLOUR_GREEN=$'\e[32;01m'
COLOUR_YELLOW=$'\e[33;01m'
COLOUR_RED=$'\e[31;01m'
COLOUR_BLUE=$'\e[34;01m'
COLOUR_PINK=$'\e[35;01m'
COLOUR_CYAN=$'\e[36;01m'
COLOUR_BROWN=$'\e[33m'
COLOUR_PURPLE=$'\e[35m'
COLOUR_DARK_BLUE=$'\e[34m'
COLOUR_DARK_GREEN=$'\e[32m'
COLOUR_DARK_CYAN=$'\e[36m'

if [[ ${PALUDIS_COLOURS} == pink ]]; then
    COLOUR_GOOD=${COLOUR_PINK}
    COLOUR_WARN=${COLOUR_YELLOW}
    COLOUR_BAD=${COLOUR_RED}
    COLOUR_BRACKET=${COLOUR_PINK}
else
    COLOUR_GOOD=${COLOUR_GREEN}
    COLOUR_WARN=${COLOUR_YELLOW}
    COLOUR_BAD=${COLOUR_RED}
    COLOUR_BRACKET=${COLOUR_BLUE}
fi

COLOUR_NORMAL=$'\e[0m'
PALUDIS_ENDCOL=$'\e[A\e['$(( ${COLUMNS:-80} - 7 ))'G'

paludis_ecmd()
{
    local cmd="$1" hook="$2" prefix="$3" message="$4" newline="$5"

    # don't try to avoid a newline for einfon. it gets horrible when logging
    # things, and einfon is abused more than it is used correctly.
    echo -e "${prefix}${message}" >&2

    if type perform_hook &>/dev/null ; then
        if [[ -n "${hook}" ]] ; then
            MESSAGE="${message}" perform_hook "${hook}"
        fi
    fi

    if type paludis_pipe_command &>/dev/null ; then
        local r=$(paludis_pipe_command MESSAGE "$EAPI" "$1" "$4" )
        return ${r%%;*}
    fi
}

einfon()
{
    paludis_ecmd \
        "einfon" \
        "einfo" \
        "`echo -ne " ${COLOUR_GOOD}*${COLOUR_NORMAL} "`" \
        "$*"
}

einfo()
{
    paludis_ecmd \
        "einfo" \
        "einfo" \
        "`echo -ne " ${COLOUR_GOOD}*${COLOUR_NORMAL} "`" \
        "$*"
}

einfo_unhooked()
{
    paludis_ecmd \
        "einfo" \
        "" \
        "`echo -ne " ${COLOUR_GOOD}*${COLOUR_NORMAL} "`" \
        "$*"
}

elog()
{
    paludis_ecmd \
        "elog" \
        "elog" \
        "`echo -ne " ${COLOUR_GOOD}*${COLOUR_NORMAL} "`" \
        "$*"

    if [[ -n "${PALUDIS_ELOG_FILE}" ]] ; then
        echo "$@" >> "${PALUDIS_ELOG_FILE}"
    fi
}

ewarn()
{
    paludis_ecmd \
        "ewarn" \
        "ewarn" \
        "`echo -ne " ${COLOUR_WARN}*${COLOUR_NORMAL} "`" \
        "$*"
}

eerror()
{
    paludis_ecmd \
        "eerror" \
        "eerror" \
        "`echo -ne " ${COLOUR_BAD}*${COLOUR_NORMAL} "`" \
        "$*"
}

ebegin()
{
    paludis_ecmd \
        "ebegin" \
        "einfo" \
        "`echo -ne " ${COLOUR_GOOD}*${COLOUR_NORMAL} "`" \
        "$* ..."
}

ebegin_unhooked()
{
    paludis_ecmd \
        "ebegin" \
        "" \
        "`echo -ne " ${COLOUR_GOOD}*${COLOUR_NORMAL} "`" \
        "$* ..."
}

_eend()
{
    local retval=${1:-0} efunc=${2:-eerror} msg
    shift 2

    if [[ ${retval} == 0 ]]; then
        msg="${COLOUR_BRACKET}[ ${COLOUR_GOOD}ok${COLOUR_BRACKET} ]${COLOUR_NORMAL}"
    else
        if [[ -n "$*" ]]; then
            ${efunc} $*
        fi
        msg="${COLOUR_BRACKET}[ ${COLOUR_BAD}!!${COLOUR_BRACKET} ]${COLOUR_NORMAL}"
    fi

    echo -e "${PALUDIS_ENDCOL} ${msg}"

    return ${retval}
}

eend()
{
    local retval=${1:-0}
    shift
    _eend ${retval} eerror "$*"
    return ${retval}
}

ewend()
{
    local retval=${1:-0}
    shift
    _eend ${retval} ewarn "$*"
    return ${retval}
}

