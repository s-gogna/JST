#!/usr/bin/env python3

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

import os
import sys
import argparse

sys.path.insert(1, os.path.join(sys.path[0], '../'))

from compiler.compiler_state import CompilerState
from parsing.cparser import Parser
from scanning.clexer import Lexer
from exceptions.compile_error import CompileError

# """int main(int argc, char** argv) {int i; return 0;}"""
# PUT A C PROGRAM HERE! CLICK THE GREEN ARROW IN THE UPPER RIGHT WHEN YOU ARE READY TO RUN!
dummy_data = """
    int main() {
        int i = 0;

        {
          int f = 5; 사
        }
    }
    void foo(int x) {}
    int z; !!S
    """


def main():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("input", type=str, help="The C program code file to compile.")
    arg_parser.add_argument("-o", "--outfile", type=str, default='',
                            help="The name of the file output file. Defaults to $(TODO).")
    arg_parser.add_argument("-sym", "--symdebug", type=int, choices=[0, 1], default=0,
                            help="The debug level for the symbol table. \n 0: No debug \n 1: Table content")
    arg_parser.add_argument("-s", "--scandebug", type=int, choices=[0, 1, 2, 3], default=0,
                            help="The debug level for the scanner. \n 0: No debug \n 1: Tokens \n 2: Source Code \n "
                                 "3: Tokens and Source Code")
    arg_parser.add_argument("-p", "--parsedebug", type=int, choices=[0, 1, 2, 3], default=0,
                            help="The debug level for the parser. \n 0: No debug \n 1: Productions \n "
                                 " 2: Productions and Source Code \n 3: Productions, Source, Misc info")
    arg_parser.add_argument("-w", "--warnlevel", type=int, choices=[0, 1], default=0,
                            help="The debug level for the parser.")

    args = arg_parser.parse_args()
    args_dict = vars(args)

    # Set default Symbol Table flags
    print_table = False

    if args_dict['symdebug'] is 1:
        print_table = True

    # Set default Scanner flags
    print_tokens = False
    print_source_scanner = False

    if args_dict['scandebug'] is 1:
        print_tokens = True
    elif args_dict['scandebug'] is 2:
        print_source_scanner = True
    elif args_dict['scandebug'] is 3:
        print_tokens = True
        print_source_scanner = True

    # Set default Parser flags
    print_productions = False
    print_source_parser = False
    print_info = False

    if args_dict['parsedebug'] is 1:
        print_productions = True
    elif args_dict['parsedebug'] is 2:
        print_productions = True
        print_source_parser = True
    elif args_dict['parsedebug'] is 3:
        print_productions = True
        print_source_parser = True
        print_info = True

    source_file = open(args_dict['input'], "r")
    data = source_file.read()
    compiler_state = CompilerState(data,
        print_table=print_table,
        print_tokens=print_tokens, print_source_scanner=print_source_scanner,
        print_productions=print_productions, print_source_parser=print_source_parser, print_info=print_info)

    try:
        parser = Parser(compiler_state, Lexer(compiler_state))
        parser.parse(data)
    except CompileError as error:
        print(error)
    finally:
        parser.teardown()

if __name__ == '__main__':
    main()
