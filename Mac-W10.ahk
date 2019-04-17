;Autohotkey script
;John Walker, 2010-11-25
;http://www.inertreactants.com
;Feel free to reuse, edit and redistribute
;Key remaps for Apple users using boot camp
;(with an Apple notebook or Keyboard)

;following section remaps alt-delete keys to mimic OSX
;command-delete deletes whole line
#BS::Send {LShift down}{Home}{LShift Up}{Del}
!BS::Send {LCtrl down}{BS}{LCtrl up}

;following section mimics command-q and command-w
#SC011::^SC011 ; close window
#SC010::!F4 ;  close app

;; increase / decrease sound volume
; F12::Send {Volume_Up 5} ; increase sound level
; F11::Send {Volume_Down 5} ; decrease sound level

;following section remaps alt-arrow and command-arrow
;keys to mimic OSX behaviour
#Up::Send {Lctrl down}{Home}{Lctrl up}
#Down::Send {Lctrl down}{End}{Lctrl up}
#+Up::Send {ctrl down}{shift down}{Home}{shift up}{ctrl up}
#+Down::Send {ctrl down}{shift down}{End}{shift up}{ctrl up}
#Left::Send {Home}
#Right::Send {End}
#+Left::Send {shift down}{Home}{shift up}
#+Right::Send {shift down}{End}{shift up}
!Up::Send {Home}
!Down::Send {End}
!Left::^Left	
!Right::^Right

; OSX NAVIGATION AND SELECTION WITH ALT
!Left::Send {ctrl down}{Left}{ctrl up}
!Right::Send {ctrl down}{Right}{ctrl up}
!+Left::Send {ctrl down}{shift down}{Left}{shift up}{ctrl up}
!+Right::Send {ctrl down}{shift down}{Right}{shift up}{ctrl up}

; DISABLES UNMODIFIED WIN-KEY IN FAVOR OF OSX SPOTLIGHT-LIKE BEHAVIOR
LWin::return
RWin::return
#Space::LWin
#+Space::LWin

; REPLACES ALT-TAB APPLICATION SWITCHING WITH OSX CMD-TAB
<#Tab::AltTab
!Tab::return

; REMAPS CTRL-LEFT-CLICK TO CMD AND REPLICATES OSX CTRL-CLICK RIGHT-CLICK
LWIN & LBUTTON::send {ctrl down}{LButton}{ctrl up}
RWIN & LBUTTON::send {ctrl down}{LButton}{ctrl up}
CTRL & LBUTTON::send {RButton}

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
; #SC022::Send {LCtrl down}{SC022}{LCtrl up} ; g ;disabled; find next
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
#SC033::Send {LCtrl down}{SC033}{LCtrl up} ; <
#SC034::Send {LCtrl down}{SC034}{LCtrl up} ; >
#SC035::Send {LCtrl down}{SC035}{LCtrl up} ; /
#SC00C::Send {LCtrl down}{SC00C}{LCtrl up} ; -
#SC00D::Send {LCtrl down}{SC00D}{LCtrl up} ; =

; applie keyboard remap
SC056::Send {SC029} 
+SC056::Send {Shift down}{SC029}{Shift up}

;#1::^1
;#2::^2
;#3::^3
;#4::^4
;#5::^5
;#6::^6
;#7::^7
;#8::^8
;#9::^9
;#0::^0
#+SC014::Send {LCtrl down}{Shift down}{SC014}{Shift up}{LCtrl up} ; t
#+SC02C::Send {LCtrl down}{Shift down}{SC02C}{Shift up}{LCtrl up} ; z

; change keyboar layout
!Space::Send {LAlt down}{Shift}{LAlt up}
;PostMessage 0x50, 0, %en%,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST ; NOT WORKING ON win 10 - crashes skype :(
;return

; cmd+g works as find next
#SC022::SendInput, {F3}

; cmd+` switch app windows
#SC056::Send {LWin down}{SC029}{LWin up}
#`::
WinGetClass, ActiveClass, A
WinGet, WinClassCount, Count, ahk_class %ActiveClass%
IF WinClassCount = 1
    Return
Else
WinSet, Bottom,, A
WinActivate, ahk_class %ActiveClass%
return


; CTRL+V /  CTRL+V for terminals
; #IfWinActive ahk_exe mintty.exe
#If WinActive("ahk_exe mintty.exe") || WinActive("ahk_exe MobaXterm.exe")
#SC02E::Send {Ctrl down}{Insert}{Ctrl Up}
#SC02F::Send {Shift down}{Insert}{Shift Up}

#IfWinActive ahk_exe MobaXterm.exe
#Left::Send {Ctrl down}{Left}{Ctrl Up}
#Right::Send {Ctrl down}{Right}{Ctrl Up}
#SC011::Send {LCtrl down}{F4}{LCtrl up} ; close tab

#IfWinActive ahk_exe phpstorm64.exe
#SC011::Send {LCtrl down}{F4}{LCtrl up} ; close tab

#IfWinActive ahk_exe Skype.exe
#SC011::Send {LCtrl down}{F4}{LCtrl up} ; close tab
