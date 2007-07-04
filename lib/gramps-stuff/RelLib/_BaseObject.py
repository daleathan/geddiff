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

# $Id: _BaseObject.py 7878 2007-01-08 01:49:33Z dallingham $

"""
Base Object class for GRAMPS
"""

__revision__ = "$Revision: 7878 $"

#-------------------------------------------------------------------------
#
# standard python modules
#
#-------------------------------------------------------------------------
import re

#-------------------------------------------------------------------------
#
# Base Object
#
#-------------------------------------------------------------------------
class BaseObject:
    """
    The BaseObject is the base class for all data objects in GRAMPS,
    whether primary or not. Its main goal is to provide common capabilites
    to all objects, such as searching through all available information.
    """
    
    def __init__(self):
        """
        Initialize a BaseObject.
        """
        pass

    def serialize(self):
        """
        Converts the object to a serialized tuple of data
        """
        assert False, "Needs to be overridden in the derived class"

    def unserialize(self, data):
        """
        Converts a serialized tuple of data to an object
        """
        assert False, "Needs to be overridden in the derived class"
        return self
    
    def matches_string(self, pattern, case_sensitive=False):
        """
        Returns True if any text data in the object or any of it's child
        objects matches a given pattern.

        @param pattern: The pattern to match.
        @type pattern: str
        @param case_sensitive: Whether the match is case-sensitive.
        @type case_sensitive: bool
        @return: Returns whether any text data in the object or any of it's child objects matches a given pattern.
        @rtype: bool
        """
        # Run through its own items
        patern_upper = pattern.upper()
        for item in self.get_text_data_list():
            if not item:
                continue
            if case_sensitive:
                if item.find(pattern) != -1:
                    return True
            else:
                if item.upper().find(patern_upper) != -1:
                    return True

        # Run through child objects
        for obj in self.get_text_data_child_list():
            if obj.matches_string(pattern, case_sensitive):
                return True

        return False

    def matches_regexp(self, pattern, case_sensitive=False):
        """
        Returns True if any text data in the object or any of it's child
        objects matches a given regular expression.

        @param pattern: The pattern to match.
        @type pattern: str
        @return: Returns whether any text data in the object or any of it's child objects matches a given regexp.
        @rtype: bool
        """

        # Run through its own items
        if case_sensitive:
            pattern_obj = re.compile(pattern)
        else:
            pattern_obj = re.compile(pattern, re.IGNORECASE)
        for item in self.get_text_data_list():
            if item and pattern_obj.match(item):
                return True

        # Run through child objects
        for obj in self.get_text_data_child_list():
            if obj.matches_regexp(pattern, case_sensitive):
                return True

        return False

    def get_text_data_list(self):
        """
        Returns the list of all textual attributes of the object.

        @return: Returns the list of all textual attributes of the object.
        @rtype: list
        """
        return []

    def get_text_data_child_list(self):
        """
        Returns the list of child objects that may carry textual data.

        @return: Returns the list of child objects that may carry textual data.
        @rtype: list
        """
        return []

    def get_referenced_handles(self):
        """
        Returns the list of (classname,handle) tuples for all directly
        referenced primary objects.
        
        @return: Returns the list of (classname,handle) tuples for referenced objects.
        @rtype: list
        """
        return []

    def get_handle_referents(self):
        """
        Returns the list of child objects which may, directly or through
        their children, reference primary objects.
        
        @return: Returns the list of objects refereincing primary objects.
        @rtype: list
        """
        return []

    def get_referenced_handles_recursively(self):
        """
        Returns the list of (classname,handle) tuples for all referenced
        primary objects, whether directly or through child objects.
        
        @return: Returns the list of (classname,handle) tuples for referenced objects.
        @rtype: list
        """
        ret = self.get_referenced_handles()
        
        # Run through child objects
        for obj in self.get_handle_referents():
            ret += obj.get_referenced_handles_recursively()

        return ret
