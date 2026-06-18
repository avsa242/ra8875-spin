{                                                                                                       
----------------------------------------------------------------------------------------------------
    Filename:       core.con.ra8875.spin
    Description:    RA8875-specific constants
    Author:         Jesse Burt
    Started:        May 16, 2026
    Updated:        May 23, 2026
    Copyright (c) 2026 - See end of file for terms of use.
----------------------------------------------------------------------------------------------------
}

con

    SPI_MODE        = 3
    SPI_MAX_FREQ    = 20_000_000

    ' instructions
    DATA_WRITE  = $00                                                                                   
    DATA_READ   = $40
    CMD_WRITE   = $80
    CMD_READ    = $c0


    ' registers
    DEV_ID          = $00

    PWRR            = $01
        LCDDISPOFF  = 7
        SLEEPMODE   = 1
        SWRESET     = 0
        DISP_OFF    = 0
        DISP_ON     = 1 << LCDDISPOFF
        DISP_NORMAL = 0
        DISP_SLEEP  = 1 << SLEEPMODE

    MRWC            = $02
    PCSR            = $04
        PCLK_INV    = 7
        PCLK_PERIOD = 0
        PCLK_PERIOD_BITS    = $03
        PCLK_RISING         = 0
        PCLK_FALLING        = 1 << PCLK_INV
        PCLK_PERIOD_SYSCLK  = %00
        PCLK_PERIOD_2CLK    = %01
        PCLK_PERIOD_4CLK    = %10
        PCLK_PERIOD_8CLK    = %11

    SROC            = $05
    SFCLR           = $06
    SYSR            = $10
        COLOR_DEPTH = 2
        MCUIF       = 0
        COLOR_DEPTH_BITS    = $03
        MCUIF_BITS          = $03
        DEPTH_8             = 0
        DEPTH_16            = 2 << COLOR_DEPTH
        MCUIF_8BIT          = 0
        MCUIF_16BIT         = 2 << MCUIF

    GPI             = $12
    GPO             = $13
    HDWR            = $14
    HNDFTR          = $15
        DE_POLARITY = 7
        HNDFT       = 0
        HNDFT_BITS  = $0f
        DE_HIGH     = 0
        DE_LOW      = 1 << DE_POLARITY

    HNDR            = $16
    HSTR            = $17
    HPWR            = $18
        HSYNC_POL   = 7
        HSYNC_PW    = 0
        HSYNC_PW_BITS   = $1f
        HSYNC_POL_LOW   = 0
        HSYNC_POL_HIGH  = 1 << HSYNC_POL

    VDHR0           = $19
    VDHR1           = $1a
    VNDR0           = $1b
    VNDR1           = $1c
    VSTR0           = $1d
    VSTR1           = $1e
    VPWR            = $1f
        VSYNC_POL   = 7
        VSYNC_PW    = 0
        VSYNC_PW_BITS   = $7f
        VSYNC_POL_LOW   = 0
        VSYNC_POL_HIGH  = 1 << VSYNC_POL

    DPCR            = $20

    FNCR0                   = $21
    FNCR0_REGMASK           = $a3
        CGRAM_ROM_FONT      = 7
        CGROM_INT_EXT       = 5
        CGROM_FONT_ENC      = 0
        CGROM_FONT_ENC_BITS = %11
        CGRAM_ROM_FONT_MASK = (1 << CGRAM_ROM_FONT) ^ FNCR0_REGMASK
        CGROM_INT_EXT_MASK  = (1 << CGROM_INT_EXT) ^ FNCR0_REGMASK
        CGROM_INT_EXT_BIT   = (1 << CGROM_INT_EXT)
        CGROM_FONT_MASK     = ((1 << CGRAM_ROM_FONT) | (1 << CGROM_INT_EXT)) ^ FNCR0_REGMASK
        CGROM_FONT_ENC_MASK = CGROM_FONT_ENC_BITS ^ FNCR0_REGMASK
        FONT_RAM            = (1 << CGRAM_ROM_FONT)
        FONT_ENC_ISO8859_1  = %00
        FONT_ENC_ISO8859_2  = %01
        FONT_ENC_ISO8859_3  = %10
        FONT_ENC_ISO8859_4  = %11

    FNCR1                   = $22
    FNCR1_REGMASK           = $df
        FULL_ALIGN          = 7
        FONT_TRANSP         = 6
        FONT_ROTATE         = 4
        FONT_HSCALE         = 2
        FONT_VSCALE         = 0
        FONT_SCALE          = 0
        FONT_HSCALE_BITS    = %11
        FONT_VSCALE_BITS    = %11
        FONT_SCALE_BITS     = %1111
        FONT_HSCALE_MASK    = (FONT_HSCALE_BITS << FONT_HSCALE) ^ FNCR1_REGMASK
        FONT_VSCALE_MASK    = (FONT_VSCALE_BITS << FONT_VSCALE) ^ FNCR1_REGMASK
        FONT_SCALE_MASK     = (FONT_SCALE_BITS << FONT_SCALE) ^ FNCR1_REGMASK

    CGSR            = $23
    HOFS0           = $24
    HOFS1           = $25
    VOFS0           = $26
    VOFS1           = $27
    FLDR            = $29
    F_CURXL         = $2a
    F_CURXH         = $2b
    F_CURYL         = $2c
    F_CURYH         = $2d
    F_TSR           = $2e
    F_SFRS          = $2f

    HSAW0           = $30
    HSAW1           = $31
    VSAW0           = $32
    VSAW1           = $33
    HEAW0           = $34
    HEAW1           = $35
    VEAW0           = $36
    VEAW1           = $37
    HSSW0           = $38
    HSSW1           = $39
    VSSW0           = $3a
    VSSW1           = $3b
    HESW0           = $3c
    HESW1           = $3d
    VESW0           = $3e
    VESW1           = $3f

    MWCR0           = $40
    MWCR0_REGMASK   = $ef
        TME         = 7
        FWC_MWCE    = 6
        FWC_MWCBE   = 5
        MWD         = 2
        MWCAID      = 1
        MRCAID      = 0
        TME_BIT     = (1 << TME)
        TME_MASK    = (1 << TME) ^ MWCR0_REGMASK
        TEXT_MODE   = 1 << TME

    MWCR1           = $41

    BTCR            = $44
    MRCD            = $45
    CURH0           = $46
    CURH1           = $47
    CURV0           = $48
    CURV1           = $49
    RCURH0          = $4a
    RCURH01         = $4b
    RCURV0          = $4c
    RCURV1          = $4d
    CURHS           = $4e
    CURVS           = $4f

    BECR0           = $50
    BECR1           = $51
    LTPR0           = $52
    LTPR1           = $53
    HSBE1           = $55
    VSBE0           = $56
    VSBE1           = $57
    HDBE0           = $58
    HDBE1           = $59
    VDBE0           = $5a
    VDBE1           = $5b
    BEWR0           = $5c
    BEWR1           = $5d
    BEHR0           = $5e
    BEHR1           = $5f
    BGCR0           = $60
    BGCR1           = $61
    BGCR2           = $62
    FGCR0           = $63
    FGCR1           = $64
    FGCR2           = $65
    PTNO            = $66
    BGTR0           = $67
    BGTR1           = $68
    BGTR2           = $69

    TPCR0           = $70
    TPCR1           = $71
    TPXH            = $72
    TPYH            = $73
    TPXYL           = $74

    GCHP0           = $80
    GCHP1           = $81
    GCVP0           = $82
    GCVP1           = $83
    GCC0            = $84
    GCC1            = $85

    PLLC1           = $88
        PLLDIVM     = 7
        PLLDIVN     = 0
        PLLDIVN_BITS    = $1f
        PLLDIVM_DIV1    = 0
        PLLDIVM_DIV2    = 1 << PLLDIVM

    PLLC2           = $89
        PLLDIVK     = 0
        PLLDIVK_BITS    = $07
        PLLDIVK_DIV1    = 0
        PLLDIVK_DIV2    = 1
        PLLDIVK_DIV4    = 2
        PLLDIVK_DIV8    = 3
        PLLDIVK_DIV16   = 4
        PLLDIVK_DIV32   = 5
        PLLDIVK_DIV64   = 6
        PLLDIVK_DIV128  = 7

    P1CR                    = $8a
        PWM1_ENA            = 7
        PWM1_DIS_LEVEL      = 6
        PWM1_FUNC           = 4
        PWM_CLKDIV          = 0
        PWM_CLKDIV_BITS     = $0f
        P1CR_ENABLE         = 1 << PWM1_ENA
        P1CR_DISABLE        = 0
        PWM1_SYSCLK1        = 0
        PWM1_SYSCLK2        = 1
        PWM1_SYSCLK4        = 2
        PWM1_SYSCLK8        = 3
        PWM1_SYSCLK16       = 4
        PWM1_SYSCLK32       = 5
        PWM1_SYSCLK64       = 6
        PWM1_SYSCLK128      = 7
        PWM1_SYSCLK256      = 8
        PWM1_SYSCLK512      = 9
        PWM1_SYSCLK1024     = 10
        PWM1_SYSCLK2048     = 11
        PWM1_SYSCLK4096     = 12
        PWM1_SYSCLK8192     = 13
        PWM1_SYSCLK16384    = 14
        PWM1_SYSCLK32768    = 15

    P1DCR           = $8b

    P2CR            = $8c
    P2DCR           = $8d
    MCLR            = $8e
        MCLR_FUNC   = 7
        MCLR_AREA   = 6
        MCLR_STOP   = 0
        MCLR_START  = 1 << MCLR_FUNC
        MCLR_FULL   = 0
        MCLR_WINDOW = 1 << MCLR_AREA

    DCR             = $90
        DLSTSS      = 7
        DCSS        = 6
        FCSTS       = 5
        DLSSS       = 4
        DTLSSS      = 0
        DRAW_LINE_SQU_TRI   = 1 << DLSTSS
        LINE_SQU_TRI_BUSY   = 1 << DLSTSS
        DRAW_CIRCLE         = 1 << DCSS
        FILL_CIR_SQU_TRI    = 1 << FCSTS
        DRAW_SQUARE         = 1 << DLSSS
        DRAW_TRIANGLE       = 1 << DTLSSS

    DLHSR0          = $91

    DLHSR1          = $92
    DLHSR1_MASK     = $03

    DLVSR0          = $93
    DLVSR1          = $94
    DLVSR1_MASK     = $01

    DLHER0          = $95
    DLHER1          = $96
    DLHER1_MASK     = $03

    DLVER0          = $97
    DLVER1          = $98
    DLVER1_MASK     = $01

    DCHR0           = $99
    DCHR1           = $9a
    DCHR1_MASK      = $03

    DCVR0           = $9b
    DCVR1           = $9c
    DCVR1_MASK      = $01

    DCRR            = $9d

    DCSCR           = $a0
        DECSSS      = 7
        FECSS       = 6
        DEECCSSS    = 5
        DEECSS      = 4
        DECP        = 0
        DECP_BITS   = %11
        DRAW_ELL_CIRSQU = 1 << DECSSS
        ELL_CIRSQU_BUSY = 1 << DECSSS
        FILL_ELL_CIRSQU = 1 << FECSS
        DRAW_ELLIPSE    = 0 << DEECCSSS
        DRAW_CIRSQU     = 1 << DEECCSSS

    ELL_A0          = $a1
    ELL_A1          = $a2
    ELL_B0          = $a3
    ELL_B1          = $a4
    DEHR0           = $a5
    DEHR1           = $a6
    DEVR0           = $a7
    DEVR1           = $a8

    DTPH0           = $a9
    DTPH1           = $aa
    DTPH1_MASK      = $03

    DTPV0           = $ab
    DTPV1           = $ac
    DTPV1_MASK      = $01

    SSAR0           = $b0
    SSAR1           = $b1
    SSAR2           = $b2
    DTNR0           = $b4
    BWR1            = $b5
    DTNR1           = $b6
    BHR1            = $b7
    DTNR2           = $b8
    SPWR1           = $b9
    DMACR           = $bf

    KSCR1           = $c0
    KSCR2           = $c1
    KSDR0           = $c2
    KSDR1           = $c3
    KSDR2           = $c4
    GPIOX           = $c7

    FWSAXA0         = $d0
    FWSAXA1         = $d1
    FWSAYA0         = $d2
    FWSAYA1         = $d3
    FWW0            = $d4
    FWW1            = $d5
    FWH0            = $d6
    FWH1            = $d7
    FWDXA0          = $d8
    FWDXA1          = $d9
    FWDYA0          = $da
    FWDYA1          = $db

    SACS_MODE       = $e0
    SACS_ADDR       = $e1
    SACS_DATA       = $e2

    INTC1           = $f0
    INTC2           = $f1


dat
{
Copyright 2026 Jesse Burt

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}

