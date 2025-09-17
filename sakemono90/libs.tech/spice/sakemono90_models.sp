* Sakemono 90nm SPICE Device Models
* Production-ready NMOS and PMOS models for circuit simulation
* Based on 90nm process specifications with comprehensive corner coverage

.TITLE Sakemono 90nm Process SPICE Models

* ================================================================
* PROCESS PARAMETERS AND TECHNOLOGY CONSTANTS
* ================================================================

.PARAM
+ TECH=90n                    ; Technology node
+ TOX_CORE=2.1n               ; Core gate oxide thickness (nm)
+ TOX_IO=4.5n                 ; IO gate oxide thickness (nm)
+ LMIN_CORE=90n               ; Minimum core gate length
+ LMIN_IO=350n                ; Minimum IO gate length
+ VDD_NOM=1.8                 ; Nominal supply voltage
+ TEMP_NOM=25                 ; Nominal temperature (°C)

* ================================================================
* CORE NMOS TRANSISTOR MODELS (Standard Vt)
* ================================================================

* Generic NMOS/PMOS models for OpenLane compatibility
.model nfet NMOS LEVEL=8
+ VERSION=3.3.0               
+ TNOM=25                     
+ TOX=2.1e-9                  
+ XJ=1.0e-7                   
+ NCH=1.7e17                  
+ VTH0=0.4                    
+ K1=0.52                     
+ K2=0.024                    
+ U0=0.025                    
+ VSAT=8.0e4                  
+ RDSW=105                    
+ WINT=0.0                    
+ LINT=1.8e-8                 

.model pfet PMOS LEVEL=8
+ VERSION=3.3.0               
+ TNOM=25                     
+ TOX=2.1e-9                  
+ XJ=1.0e-7                   
+ NCH=4.1589e17               
+ VTH0=-0.4                   
+ K1=0.53                     
+ K2=0.032                    
+ U0=0.012                    
+ VSAT=8.0e4                  
+ RDSW=107                    
+ WINT=0.0                    
+ LINT=2.8e-8                 

* NMOS Core SVT (Standard Threshold Voltage) - Typical Corner
.MODEL NMOS_SVT_TT NMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=2.1e-9                  ; Gate oxide thickness (m)
+ XJ=1.5e-7                   ; Junction depth (m)
+ NCH=1.7e17                  ; Channel doping concentration (cm^-3)
+ VTH0=0.35                   ; Threshold voltage @ Vbs=0 (V)
+ K1=0.45                     ; Body effect coefficient
+ K2=-0.05                    ; Body effect coefficient
+ K3=80                       ; Body effect coefficient
+ K3B=0                       ; Body effect coefficient
+ W0=2.5e-6                   ; Narrow width effect parameter
+ NLX=1.8e-7                  ; Lateral non-uniform doping effect
+ DVT0W=0                     ; Short channel effect coefficient
+ DVT1W=5.3e6                 ; Short channel effect coefficient
+ DVT2W=-0.032                ; Short channel effect coefficient
+ DVT0=2.2                    ; DIBL effect coefficient
+ DVT1=0.53                   ; DIBL effect coefficient
+ DVT2=-0.032                 ; DIBL effect coefficient
+ U0=260                      ; Low-field mobility (cm^2/V-s)
+ UA=-1.4e-9                  ; Mobility degradation coefficient
+ UB=2.2e-18                  ; Mobility degradation coefficient
+ UC=-4.65e-11                ; Mobility degradation coefficient
+ VSAT=8.0e4                  ; Saturation velocity (m/s)
+ A0=1.2                      ; Bulk charge effect coefficient
+ AGS=0.15                    ; Gate bias dependent bulk charge
+ B0=5.5e-7                   ; Bulk charge effect width coefficient
+ B1=1.2e-6                   ; Bulk charge effect length coefficient
+ KETA=-0.047                 ; Body bias coefficient
+ A1=0                        ; Non-saturation effect coefficient
+ A2=0.99                     ; Non-saturation effect coefficient
+ RDSW=200                    ; Source-drain resistance per width
+ PRWG=0.5                    ; Gate bias effect on source-drain resistance
+ PRWB=-0.2                   ; Body bias effect on source-drain resistance
+ WR=1                        ; Width dependence of source-drain resistance
+ WINT=5e-9                   ; Width offset fitting parameter
+ LINT=1.5e-8                 ; Length offset fitting parameter
+ XL=0                        ; Length mask bias
+ XW=0                        ; Width mask bias
+ DWG=0                       ; Width reduction coefficient
+ DWB=0                       ; Width reduction coefficient
+ VOFF=-0.08                  ; Offset voltage in subthreshold region
+ NFACTOR=2.5                 ; Subthreshold swing coefficient
+ CIT=0                       ; Interface trap capacitance
+ CDSC=2.4e-4                 ; Drain/Source and channel coupling capacitance
+ CDSCD=0                     ; Drain/Source and channel coupling capacitance
+ CDSCB=0                     ; Body-bias dependence of CDSC
+ ETA0=0.08                   ; Drain-induced barrier lowering coefficient
+ ETAB=-0.07                  ; Body-bias dependence of ETA0
+ DSUB=0.56                   ; DIBL coefficient in subthreshold region
+ PCLM=1.3                    ; Channel length modulation coefficient
+ PDIBLC1=0.39                ; Drain-induced barrier lowering coefficient
+ PDIBLC2=0.0086              ; Drain-induced barrier lowering coefficient
+ PDIBLCB=-0.1                ; Body-bias dependence of PDIBLC
+ DROUT=0.56                  ; DIBL coefficient of output resistance
+ PSCBE1=4.24e8               ; Substrate current body-bias effect coefficient
+ PSCBE2=1e-5                 ; Substrate current body-bias effect coefficient
+ PVAG=0                      ; Gate dependence of output resistance
+ DELTA=0.01                  ; Effective Vds parameter
+ RSH=6.8                     ; Source-drain sheet resistance (ohm/sq)
+ MOBMOD=1                    ; Mobility model selector
+ PRT=0                       ; Temperature coefficient of RDSW
+ UTE=-1.5                    ; Temperature coefficient of mobility
+ KT1=-0.11                   ; Temperature coefficient of VTH
+ KT1L=0                      ; Channel length dependence of KT1
+ KT2=0.022                   ; Body-bias coefficient of KT1
+ UA1=4.31e-9                 ; Temperature coefficient of UA
+ UB1=-7.61e-18               ; Temperature coefficient of UB
+ UC1=-5.6e-11                ; Temperature coefficient of UC
+ AT=3.3e4                    ; Temperature coefficient of VSAT
+ PRT=0                       ; Temperature coefficient of RDSW
+ XTI=3                       ; Temperature exponent of junction current
+ CGSO=1.5e-10                ; Gate-source overlap capacitance per width
+ CGDO=1.5e-10                ; Gate-drain overlap capacitance per width
+ CGBO=1e-12                  ; Gate-bulk overlap capacitance per length
+ CJ=9.68e-4                  ; Bottom junction capacitance per area
+ PB=0.69                     ; Bottom junction potential
+ MJ=0.36                     ; Bottom junction grading coefficient
+ CJSW=2.43e-10               ; Sidewall junction capacitance per perimeter
+ PBSW=0.69                   ; Sidewall junction potential
+ MJSW=0.1                    ; Sidewall junction grading coefficient
+ CJSWG=3.3e-10               ; Gate sidewall junction capacitance per perimeter
+ PBSWG=0.69                  ; Gate sidewall junction potential
+ MJSWG=0.1                   ; Gate sidewall junction grading coefficient
+ CF=0                        ; Fringing field capacitance
+ PVTH0=1.888e-3              ; Length dependence of VTH0
+ PRDSW=-5                    ; Length dependence of RDSW
+ PK2=1.8e-3                  ; Length dependence of K2
+ WKETA=-1.8e-3               ; Width dependence of KETA
+ LKETA=-2.e-3                ; Length dependence of KETA
+ PU0=-1.5                    ; Length dependence of U0
+ PUA=8e-11                   ; Length dependence of UA
+ PUB=0                       ; Length dependence of UB
+ PVSAT=2e3                   ; Length dependence of VSAT
+ PETA0=1e-4                  ; Length dependence of ETA0
+ PKETA=-2.5e-3               ; Length dependence of KETA

* NMOS Core LVT (Low Threshold Voltage) - Typical Corner
.MODEL NMOS_LVT_TT NMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=2.1e-9
+ VTH0=0.25                   ; Lower threshold voltage for LVT
+ K1=0.42                     ; Adjusted body effect
+ K2=-0.08                    ; Adjusted body effect
+ U0=280                      ; Higher mobility for LVT
+ UA=-1.2e-9                  ; Adjusted mobility parameters
+ UB=2.0e-18
+ UC=-4.2e-11
+ VSAT=8.2e4                  ; Slightly higher saturation velocity
+ RDSW=180                    ; Lower resistance
+ NFACTOR=2.2                 ; Better subthreshold slope
+ KT1=-0.13                   ; Different temperature dependence
+ XTI=3
+ CGSO=1.6e-10                ; Slightly higher overlap capacitance
+ CGDO=1.6e-10
+ CGBO=1e-12
+ CJ=9.8e-4
+ PB=0.68
+ MJ=0.35
+ CJSW=2.5e-10
+ PBSW=0.68
+ MJSW=0.1

* NMOS Core HVT (High Threshold Voltage) - Typical Corner  
.MODEL NMOS_HVT_TT NMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=2.1e-9
+ VTH0=0.45                   ; Higher threshold voltage for HVT
+ K1=0.48                     ; Adjusted body effect
+ K2=-0.02                    ; Adjusted body effect
+ U0=240                      ; Lower mobility for HVT
+ UA=-1.6e-9                  ; Adjusted mobility parameters
+ UB=2.4e-18
+ UC=-5.0e-11
+ VSAT=7.8e4                  ; Slightly lower saturation velocity
+ RDSW=220                    ; Higher resistance
+ NFACTOR=2.8                 ; Worse subthreshold slope
+ KT1=-0.09                   ; Different temperature dependence
+ XTI=3
+ CGSO=1.4e-10                ; Slightly lower overlap capacitance
+ CGDO=1.4e-10
+ CGBO=1e-12
+ CJ=9.5e-4
+ PB=0.70
+ MJ=0.37
+ CJSW=2.4e-10
+ PBSW=0.70
+ MJSW=0.1

* ================================================================
* CORE PMOS TRANSISTOR MODELS (Standard Vt)
* ================================================================

* PMOS Core SVT (Standard Threshold Voltage) - Typical Corner
.MODEL PMOS_SVT_TT PMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=2.1e-9
+ XJ=1.5e-7
+ NCH=4.1589e17               ; Higher doping for PMOS
+ VTH0=-0.35                  ; Negative threshold for PMOS
+ K1=0.56                     ; Body effect coefficient
+ K2=0.032                    ; Body effect coefficient
+ K3=0                        ; Body effect coefficient
+ K3B=20                      ; Body effect coefficient
+ W0=1e-6                     ; Narrow width effect
+ NLX=1.8e-7
+ DVT0W=0
+ DVT1W=5.3e6
+ DVT2W=0.032
+ DVT0=0.5                    ; DIBL effect (different for PMOS)
+ DVT1=0.226
+ DVT2=0.1
+ U0=115                      ; Lower mobility for PMOS (holes)
+ UA=2.0e-9                   ; Mobility degradation
+ UB=5.87e-19
+ UC=-9.8e-11
+ VSAT=7.0e4                  ; Lower saturation velocity for holes
+ A0=1.4
+ AGS=0.25
+ B0=-6.9e-8
+ B1=-1e-7
+ KETA=0.023
+ A1=0.54
+ A2=0.99
+ RDSW=460                    ; Higher sheet resistance for PMOS
+ PRWG=0.5
+ PRWB=-0.2
+ WR=1
+ WINT=0
+ LINT=2.93e-8
+ XL=0
+ XW=0
+ DWG=0
+ DWB=0
+ VOFF=-0.126                 ; Offset voltage
+ NFACTOR=2.0                 ; Subthreshold swing
+ CIT=0
+ CDSC=2.4e-4
+ CDSCD=0
+ CDSCB=0
+ ETA0=0.0225
+ ETAB=0.07
+ DSUB=0.1
+ PCLM=2.13                   ; Channel length modulation
+ PDIBLC1=4.8e-4
+ PDIBLC2=0.0017
+ PDIBLCB=3.4e-4
+ DROUT=9.0e-4
+ PSCBE1=1.7e9
+ PSCBE2=5e-10
+ PVAG=0.11
+ DELTA=0.01
+ RSH=6.8
+ MOBMOD=1
+ PRT=0
+ UTE=-1.5
+ KT1=-0.11
+ KT1L=0
+ KT2=0.022
+ UA1=4.31e-9
+ UB1=-7.61e-18
+ UC1=-5.6e-11
+ AT=3.3e4
+ PRT=0
+ XTI=3
+ CGSO=1.5e-10
+ CGDO=1.5e-10
+ CGBO=1e-12
+ CJ=1.165e-3                 ; Different junction capacitances for PMOS
+ PB=0.84
+ MJ=0.41
+ CJSW=2.326e-10
+ PBSW=0.84
+ MJSW=0.13
+ CJSWG=4.22e-10
+ PBSWG=0.84
+ MJSWG=0.13
+ CF=0

* PMOS Core LVT (Low Threshold Voltage) - Typical Corner
.MODEL PMOS_LVT_TT PMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=2.1e-9
+ VTH0=-0.25                  ; Higher magnitude threshold for LVT PMOS
+ K1=0.52                     ; Adjusted parameters
+ K2=0.045
+ U0=125                      ; Higher mobility for LVT
+ UA=1.8e-9
+ UB=5.2e-19
+ UC=-8.8e-11
+ VSAT=7.2e4
+ RDSW=420
+ NFACTOR=1.8
+ KT1=-0.13
+ CGSO=1.6e-10
+ CGDO=1.6e-10
+ CJ=1.18e-3
+ PB=0.83
+ MJ=0.40
+ CJSW=2.4e-10
+ PBSW=0.83
+ MJSW=0.12

* PMOS Core HVT (High Threshold Voltage) - Typical Corner
.MODEL PMOS_HVT_TT PMOS LEVEL=8  
+ VERSION=3.3.0
+ TOX=2.1e-9
+ VTH0=-0.45                  ; Lower magnitude threshold for HVT PMOS
+ K1=0.60                     ; Adjusted parameters
+ K2=0.018
+ U0=105                      ; Lower mobility for HVT
+ UA=2.2e-9
+ UB=6.5e-19
+ UC=-1.1e-10
+ VSAT=6.8e4
+ RDSW=500
+ NFACTOR=2.2
+ KT1=-0.09
+ CGSO=1.4e-10
+ CGDO=1.4e-10
+ CJ=1.15e-3
+ PB=0.85
+ MJ=0.42
+ CJSW=2.3e-10
+ PBSW=0.85
+ MJSW=0.14

* ================================================================
* IO TRANSISTOR MODELS (Thick oxide, higher voltage)
* ================================================================

* IO NMOS - Thick oxide for 1.8V/2.0V operation
.MODEL NMOS_IO NMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=4.5e-9                  ; Thick oxide for higher voltage
+ VTH0=0.4                    ; Higher threshold for IO
+ K1=0.50
+ K2=-0.02
+ U0=220                      ; Lower mobility due to thick oxide
+ UA=-1.8e-9
+ UB=2.8e-18
+ UC=-5.5e-11
+ VSAT=7.5e4
+ RDSW=250
+ NFACTOR=2.8
+ KT1=-0.10
+ CGSO=1.2e-10               ; Lower overlap cap due to thick oxide
+ CGDO=1.2e-10
+ CJ=8.8e-4
+ PB=0.72
+ MJ=0.38

* IO PMOS - Thick oxide for 1.8V/2.0V operation  
.MODEL PMOS_IO PMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=4.5e-9                  ; Thick oxide for higher voltage
+ VTH0=-0.4                   ; Higher magnitude threshold for IO
+ K1=0.62
+ K2=0.025
+ U0=95                       ; Lower mobility due to thick oxide
+ UA=2.5e-9
+ UB=7.0e-19
+ UC=-1.2e-10
+ VSAT=6.5e4
+ RDSW=550
+ NFACTOR=2.5
+ KT1=-0.10
+ CGSO=1.2e-10               ; Lower overlap cap due to thick oxide
+ CGDO=1.2e-10
+ CJ=1.05e-3
+ PB=0.88
+ MJ=0.44

* ================================================================
* PROCESS CORNER DEFINITIONS
* ================================================================

* Fast-Fast Corner (FF) - Low Vt, High mobility, -40°C, 1.95V
.MODEL NMOS_SVT_FF NMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=2.0e-9                  ; Thinner oxide (process variation)
+ VTH0=0.28                   ; Lower threshold (FF corner)
+ U0=310                      ; Higher mobility (FF corner)
+ VSAT=8.5e4                  ; Higher saturation velocity
+ RDSW=160                    ; Lower resistance
+ KT1=-0.15                   ; Temperature coefficient adjusted

.MODEL PMOS_SVT_FF PMOS LEVEL=8
+ VERSION=3.3.0  
+ TOX=2.0e-9
+ VTH0=-0.28                  ; Lower magnitude threshold (FF corner)
+ U0=140                      ; Higher mobility (FF corner)
+ VSAT=7.5e4
+ RDSW=380
+ KT1=-0.15

* Slow-Slow Corner (SS) - High Vt, Low mobility, 125°C, 1.62V
.MODEL NMOS_SVT_SS NMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=2.2e-9                  ; Thicker oxide (process variation)
+ VTH0=0.42                   ; Higher threshold (SS corner)
+ U0=210                      ; Lower mobility (SS corner)
+ VSAT=7.5e4                  ; Lower saturation velocity
+ RDSW=240                    ; Higher resistance
+ KT1=-0.07                   ; Temperature coefficient adjusted

.MODEL PMOS_SVT_SS PMOS LEVEL=8
+ VERSION=3.3.0
+ TOX=2.2e-9
+ VTH0=-0.42                  ; Higher magnitude threshold (SS corner)
+ U0=90                       ; Lower mobility (SS corner)
+ VSAT=6.5e4
+ RDSW=520
+ KT1=-0.07

* ================================================================
* PARASITIC ELEMENT MODELS
* ================================================================

* Resistor models
.MODEL RES_POLY R RSH=350 TC1=1000e-6 TC2=0
.MODEL RES_DIFF R RSH=50 TC1=2000e-6 TC2=0  
.MODEL RES_HIRES R RSH=2000 TC1=800e-6 TC2=0

* Capacitor models  
.MODEL CAP_MIM C TC1=50e-6 TC2=0
.MODEL CAP_MOM C TC1=30e-6 TC2=0

* Diode models for substrate/well diodes
.MODEL DIODE_NW D IS=1e-14 RS=10 CJO=1e-12 VJ=0.7 M=0.5
.MODEL DIODE_PW D IS=1e-14 RS=10 CJO=1e-12 VJ=0.7 M=0.5

* ================================================================
* SUBCIRCUIT DEFINITIONS FOR STANDARD USAGE
* ================================================================

* Basic NMOS with body connection
.SUBCKT NMOS_CORE D G S B L=90n W=1u M=1 CORNERS=TT VT=SVT
.PARAM LM={L} WM={W}
.IF (VT == 'LVT')
  .IF (CORNERS == 'TT')
    MN D G S B NMOS_LVT_TT L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'FF') 
    MN D G S B NMOS_LVT_FF L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'SS')
    MN D G S B NMOS_LVT_SS L={LM} W={WM} M={M}
  .ENDIF
.ELSEIF (VT == 'HVT')
  .IF (CORNERS == 'TT')
    MN D G S B NMOS_HVT_TT L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'FF')
    MN D G S B NMOS_HVT_FF L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'SS')
    MN D G S B NMOS_HVT_SS L={LM} W={WM} M={M}
  .ENDIF
.ELSE
  .IF (CORNERS == 'TT')
    MN D G S B NMOS_SVT_TT L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'FF')
    MN D G S B NMOS_SVT_FF L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'SS')
    MN D G S B NMOS_SVT_SS L={LM} W={WM} M={M}
  .ENDIF
.ENDIF
.ENDS NMOS_CORE

* Basic PMOS with body connection
.SUBCKT PMOS_CORE D G S B L=90n W=2u M=1 CORNERS=TT VT=SVT
.PARAM LM={L} WM={W}
.IF (VT == 'LVT')
  .IF (CORNERS == 'TT')
    MP D G S B PMOS_LVT_TT L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'FF')
    MP D G S B PMOS_LVT_FF L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'SS')
    MP D G S B PMOS_LVT_SS L={LM} W={WM} M={M}
  .ENDIF
.ELSEIF (VT == 'HVT')
  .IF (CORNERS == 'TT')
    MP D G S B PMOS_HVT_TT L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'FF')
    MP D G S B PMOS_HVT_FF L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'SS')
    MP D G S B PMOS_HVT_SS L={LM} W={WM} M={M}
  .ENDIF
.ELSE
  .IF (CORNERS == 'TT')
    MP D G S B PMOS_SVT_TT L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'FF')
    MP D G S B PMOS_SVT_FF L={LM} W={WM} M={M}
  .ELSEIF (CORNERS == 'SS')
    MP D G S B PMOS_SVT_SS L={LM} W={WM} M={M}
  .ENDIF
.ENDIF
.ENDS PMOS_CORE

* ================================================================
* END OF SPICE MODELS
* ================================================================