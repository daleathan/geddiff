#
# Gramps - a GTK+/GNOME based genealogy program
#
# Copyright (C) 2000-2006  Donald N. Allingham
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# $Id: _FamilyRelType.py 7878 2007-01-08 01:49:33Z dallingham $

"""
Provides the different family reference types
"""

__revision__ = "$Revision: 7878 $"

from _GrampsType import GrampsType, init_map
from gettext import gettext as _

class FamilyRelType(GrampsType):

    MARRIED     = 0
    UNMARRIED   = 1
    CIVIL_UNION = 2
    UNKNOWN     = 3
    CUSTOM      = 4

    _CUSTOM = CUSTOM
    _DEFAULT = MARRIED

    _DATAMAP = [
        (UNKNOWN,     _("Unknown"),     "Unknown"),
        (CUSTOM,      _("Custom"),      "Custom"),
        (CIVIL_UNION, _("Civil Union"), "Civil Union"),
        (UNMARRIED,   _("Unmarried"),   "Unmarried"),
        (MARRIED,     _("Married"),     "Married"),
        ]

    _I2SMAP = init_map(_DATAMAP, 0, 1)
    _S2IMAP = init_map(_DATAMAP, 1, 0)
    _I2EMAP = init_map(_DATAMAP, 0, 2)
    _E2IMAP = init_map(_DATAMAP, 2, 0)

    def __init__(self, value=None):
        GrampsType.__init__(self, value)
