# nand2tetris Hack Language Assembler

[![Travis](https://img.shields.io/travis/yitznewton/nand2tetris_assembler.svg)](https://travis-ci.org/yitznewton/nand2tetris_assembler/)
[![license](https://img.shields.io/github/license/yitznewton/nand2tetris_assembler.svg)](https://www.gnu.org/copyleft/gpl.html)

## Background

This is a Ruby assembler for the Hack machine language specified in the
[nand2tetris](http://www.nand2tetris.org/) computer architecture course.

Specification/instructions: [spec](http://www.nand2tetris.org/chapters/chapter%2006.pdf)

## Tests

There is partial unit-test coverage with RSpec, as well as an acceptance test
provided by the nand2tetris project.

To run the nand2tetris test:

```shell
$ ./Assembler pong/Pong.asm > pong/Pong.hack       # output machine code
$ diff pong/Pong.hack pong/Pong.hack_expected      # test against known-good
```

## License

GNU General Public License Version 3.0
