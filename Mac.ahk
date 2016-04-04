;Autohotkey script
;John Walker, 2010-11-25
;http://www.inertreactants.com
;Feel free to reuse, edit and redistribute
;Key remaps for Apple users using boot camp
;(with an Apple notebook or Keyboard)

;following section remaps alt-delete keys to mimic OSX
;command-delete deletes whole line
#BS::Send {LShift down}{Home}{LShift Up}{Del}

;alt-function-delete deletes next word
!Delete::Send {LShift down}{LCtrl down}{Right}{LShift Up}{Lctrl up}{Del}

;alt-delete deletes previous word
!BS::Send {LShift down}{LCtrl down}{Left}{LShift Up}{Lctrl up}{Del}

;following section mimics command-q and command-w
;behaviour to close windows
;note these had to be disabled below for the
;command to ctrl key remaps
#SC011::^F4 ; w
#SC010::!F4 ; q

;following section remaps alt-arrow and command-arrow
;keys to mimic OSX behaviour
#Up::Send {Lctrl down}{Home}{Lctrl up}
#Down::Send {Lctrl down}{End}{Lctrl up}
#Left::Send {Home}
#Right::Send {End}
!Up::Send {Home}
!Down::Send {End}
!Left::^Left	
!Right::^Right

;following section remaps command key to control key
;affects all number and letter keys
;note that some keys, like winkey-l and winkey-d
;need to be remapped a differeny way
;otherwise autohotkey will not take over

#SC01E::Send {LCtrl down}{SC01E}{LCtrl up} ; a
#SC030::Send {LCtrl down}{SC030}{LCtrl up} ; b
#SC02E::Send {LCtrl down}{SC02E}{LCtrl up} ; c
#SC020::Send {LCtrl down}{SC020}{LCtrl up} ; d
; #SC012::Send {LCtrl down}{SC012}{LCtrl up} ; e ;disabled, open explorer
#SC021::Send {LCtrl down}{SC021}{LCtrl up} ; f
#SC022::Send {LCtrl down}{SC022}{LCtrl up} ; g
#SC023::Send {LCtrl down}{SC023}{LCtrl up} ; h
#SC017::Send {LCtrl down}{SC017}{LCtrl up} ; i
#SC024::Send {LCtrl down}{SC024}{LCtrl up} ; j
#SC025::Send {LCtrl down}{SC025}{LCtrl up} ; k
;#SC026::Send {LCtrl down}{SC026}{LCtrl up} ; l ;disabled, I like winkey-L
#SC032::Send {LCtrl down}{SC032}{LCtrl up} ; m
#SC031::Send {LCtrl down}{SC031}{LCtrl up} ; n
#SC018::Send {LCtrl down}{SC018}{LCtrl up} ; o
#SC019::Send {LCtrl down}{SC019}{LCtrl up} ; p
;#q::^q ;disabled --remapped to alt-F4 instead
#SC013::Send {LCtrl down}{SC013}{LCtrl up} ; r
#SC01F::Send {LCtrl down}{SC01F}{LCtrl up} ; s
#SC014::Send {LCtrl down}{SC014}{LCtrl up} ; t
#SC016::Send {LCtrl down}{SC016}{LCtrl up} ; u
#SC02F::Send {LCtrl down}{SC02F}{LCtrl up} ; v
;#w::^w ;disabled --remapped to ctrl-F4 instead
#SC02D::Send {LCtrl down}{SC02D}{LCtrl up} ; x
#SC015::Send {LCtrl down}{SC015}{LCtrl up} ; y
#SC02C::Send {LCtrl down}{SC02C}{LCtrl up} ; z
#1::^1
#2::^2
#3::^3
#4::^4
#5::^5
#6::^6
#7::^7
#8::^8
#9::^9
#0::^0

#+SC014::Send {LCtrl down}{Shift down}{SC014}{Shift up}{LCtrl up} ; t
#+SC02C::Send {LCtrl down}{Shift down}{SC02C}{Shift up}{LCtrl up} ; z
 
; change keyboar layout
;!Space::
;PostMessage, 0x50, 0x02,0,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST
;return
;#Space::
;PostMessage, 0x50, 0x02,0,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST
;return
$^Space::
PostMessage, 0x50, 0x02,0,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST
return   

; mac keyboard change ~ position
+SC056::Send {LShift down}{SC029}{LShift up}
#SC056::Send {LWin down}{SC029}{LWin up}


; cmd+tab emulation
LWin & Tab::AltTab
!MButton::  ; Middle mouse button. The ! prefix makes it fire while the Alt key is down (which it is if the alt-tab menu is visible).
IfWinExist ahk_class #32771  ; Indicates that the alt-tab menu is present on the screen.
    Send !{Escape}{Alt up}
return

; cmd+` switch app windows
#`::
WinGetClass, ActiveClass, A
WinGet, WinClassCount, Count, ahk_class %ActiveClass%
IF WinClassCount = 1
    Return
Else
WinSet, Bottom,, A
WinActivate, ahk_class %ActiveClass%
return



; PHP STORM OPTIONS !!!!
; Show autocomplete
#Space::
Send {Ctrl down}{Space}{Ctrl up}
return

#IfWinActive ahk_exe PhpStorm.exe
#SC022::SendInput, {F3} ; cmd+g works as find next