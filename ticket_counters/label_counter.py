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


class LabelCounter(object):
    next_value = 0
    str_format = '%05d'

    @staticmethod
    def get():
        result = LabelCounter.str_format % LabelCounter.next_value
        LabelCounter.next_value += 1
        return result

    @staticmethod
    def reset():
        LabelCounter.next_value = 0
