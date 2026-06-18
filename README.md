# ra8875-spin
-------------

This is a P8X32A/Propeller, P2X8C4M64P/Propeller 2 driver object for the RAiO RA8875 TFT LCD display controller

**IMPORTANT**: This software is meant to be used with the [spin-standard-library](https://github.com/avsa242/spin-standard-library) (P8X32A) or [p2-spin-standard-library](https://github.com/avsa242/p2-spin-standard-library) (P2X8C4M64P). Please install the applicable library first before attempting to use this code, otherwise you will be missing several files required to build the project.


## Salient Features

* SPI connection at up to 20MHz (P2)
* Drawing primitives: box, box w/rounded corners, circle, line, triangle
* Set foreground color
* Set drawing position
* Text rendering:
    * standard terminal i/o api integration (no control codes support)
    * strings (faster than standard terminal puts(), but non-standard api)
    * built-in ROM font
    * font encoding (ISO-8859-1, -2, -3, -4)
    * font scaling (H, V independent at 1..4x)
    * pixel-level cursor control
* Windowing:
    * set drawable area
    * horizontal/vertical scroll
* Backlight brightness control


## Requirements

P1/SPIN1:
* spin-standard-library

P2/SPIN2:
* p2-spin-standard-library
* terminal.common.spin2h (provided by the above)


## Compiler Compatibility

| Processor | Language | Compiler               | Backend      | Status                |
|-----------|----------|------------------------|--------------|-----------------------|
| P1        | SPIN1    | FlexSpin (7.6.5)       | Bytecode     | Not yet implemented   |
| P1        | SPIN1    | FlexSpin (7.6.5)       | Native/PASM  | Not yet implemented   |
| P2        | SPIN2    | FlexSpin (7.6.5)       | NuCode       | Runtime issues        |
| P2        | SPIN2    | FlexSpin (7.6.5)       | Native/PASM2 | OK                    |

(other versions or toolchains not listed are __not supported__, and _may or may not_ work)


## Hardware compatibility

* Tested with Adafruit RA8875 driver board (P/N 1590) and 5.0" 800x480 LCD with touchscreen (P/N 1596)


## Limitations

* Display should work at over 10MHz but shows reliability issues

