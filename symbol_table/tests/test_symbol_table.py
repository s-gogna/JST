# This file is part of JST.
#
# JST is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# JST is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with JST.  If not, see <http://www.gnu.org/licenses/>.

import unittest
from symbol_table.symbol_table import SymbolTable
from symbol_table.symbol import Symbol
from symbol_table.scope import Scope


class TestSymbolTable(unittest.TestCase):
    def setUp(self):
        self.sym = SymbolTable()

    def tearDown(self):
        self.sym = None

    def test_push_pop_and_size(self):
        self.assertTrue(self.sym.size() == 1)
        self.sym.push()
        self.sym.push()
        self.assertTrue(self.sym.size() == 3)
        self.sym.pop()
        self.assertTrue(self.sym.size() == 2)

    def test_find_same_scope(self):
        self.assertTrue(self.sym.insert(Symbol('A')) == Scope.INSERT_SUCCESS)
        found = self.sym.find('A', Symbol)
        self.assertTrue(found is not None)
        self.assertTrue(found.identifier is 'A')
        self.assertTrue(type(found) is Symbol)

    def test_find_diff_scope(self):
        self.sym.insert(Symbol('A'))
        self.sym.push()
        self.sym.insert(Symbol('B'))
        found = self.sym.find('A', Symbol)
        self.assertTrue(found is not None)
        self.assertTrue(found.identifier is 'A')
        self.assertTrue(type(found) is Symbol)

    def test_insert(self):
        self.assertTrue(self.sym.insert(Symbol('A')) == Scope.INSERT_SUCCESS)
        self.assertTrue(self.sym.insert(Symbol('B')) == Scope.INSERT_SUCCESS)

        self.sym.push()
        self.assertTrue(self.sym.insert(Symbol('A')) == Scope.INSERT_SHADOWED)
        self.assertTrue(self.sym.insert(Symbol('B')) == Scope.INSERT_SHADOWED)

        self.assertTrue(self.sym.insert(Symbol('A')) == Scope.INSERT_REDECL)
        self.assertTrue(self.sym.insert(Symbol('B')) == Scope.INSERT_REDECL)

    def test_symbol_table_clone(self):
        self.sym.insert(Symbol('A'))
        self.sym.push()
        self.sym.insert(Symbol('B'))

        clone = self.sym.clone()
        self.assertTrue(self.sym.size() == clone.size())
        self.assertTrue(self.sym.find('A', Symbol) is not clone.find('A', Symbol))
        self.assertTrue(self.sym.find('B', Symbol) is not clone.find('B', Symbol))
        self.sym.pop()
        self.assertTrue(self.sym.size() == clone.size() - 1)
        self.assertTrue(self.sym.find('B', Symbol) is None and clone.find('B', Symbol) is not None)
