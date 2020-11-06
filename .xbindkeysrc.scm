; mod1 - Alt
; mod4 - win

; 1 - стрелки
(xbindkey '(mod4 j)       "xdotool   keyup --delay 0 j   keyup --delay 0 Super   key --delay 0 Down    keydown --delay 0 Super")
(xbindkey '(Shift mod4 j) "xdotool   keyup --delay 0 j   keyup --delay 0 Super   key --delay 0 Down    keydown --delay 0 Super")
(xbindkey '(mod4 k)       "xdotool   keyup --delay 0 k   keyup --delay 0 Super   key --delay 0 Up      keydown --delay 0 Super")
(xbindkey '(Shift mod4 k) "xdotool   keyup --delay 0 k   keyup --delay 0 Super   key --delay 0 Up      keydown --delay 0 Super")
(xbindkey '(mod4 h)       "xdotool   keyup --delay 0 h   keyup --delay 0 Super   key --delay 0 Left    keydown --delay 0 Super")
(xbindkey '(Shift mod4 h) "xdotool   keyup --delay 0 h   keyup --delay 0 Super   key --delay 0 Left    keydown --delay 0 Super")
(xbindkey '(mod4 l)       "xdotool   keyup --delay 0 l   keyup --delay 0 Super   key --delay 0 Right   keydown --delay 0 Super")
(xbindkey '(Shift mod4 l) "xdotool   keyup --delay 0 l   keyup --delay 0 Super   key --delay 0 Right   keydown --delay 0 Super")

; 2 - home, end
(xbindkey '(mod4 f)       "xdotool   keyup --delay 0 f   keyup --delay 0 Super   key --delay 0 Home    keydown --delay 0 Super")
(xbindkey '(Shift mod4 f) "xdotool   keyup --delay 0 f   keyup --delay 0 Super   key --delay 0 Home    keydown --delay 0 Super")
(xbindkey '(mod4 g)       "xdotool   keyup --delay 0 g   keyup --delay 0 Super   key --delay 0 End     keydown --delay 0 Super")
(xbindkey '(Shift mod4 g) "xdotool   keyup --delay 0 g   keyup --delay 0 Super   key --delay 0 End     keydown --delay 0 Super")

; 3 - word (left, right)
(xbindkey '(mod4 w)       "xdotool   keyup --delay 0 w   keyup --delay 0 Super   keydown --delay 0 Ctrl   key --delay 0 Right   keyup --delay 0 Ctrl   keydown --delay 0 Super")
(xbindkey '(Shift mod4 w) "xdotool   keyup --delay 0 w   keyup --delay 0 Super   keydown --delay 0 Ctrl   key --delay 0 Right   keyup --delay 0 Ctrl   keydown --delay 0 Super")
(xbindkey '(mod4 b)       "xdotool   keyup --delay 0 b   keyup --delay 0 Super   keydown --delay 0 Ctrl   key --delay 0 Left    keyup --delay 0 Ctrl   keydown --delay 0 Super")
(xbindkey '(Shift mod4 b) "xdotool   keyup --delay 0 b   keyup --delay 0 Super   keydown --delay 0 Ctrl   key --delay 0 Left    keyup --delay 0 Ctrl   keydown --delay 0 Super")

; 4 - вертикальные варп прыжки (х5)
(xbindkey '(mod4 i)       "xdotool   keyup --delay 0 i   keyup --delay 0 Super   key --delay 0 --repeat 5  Up      keydown --delay 0 Super")
(xbindkey '(Shift mod4 i) "xdotool   keyup --delay 0 i   keyup --delay 0 Super   key --delay 0 --repeat 5  Up      keydown --delay 0 Super")
(xbindkey '(mod4 o)       "xdotool   keyup --delay 0 o   keyup --delay 0 Super   key --delay 0 --repeat 5  Down    keydown --delay 0 Super")
(xbindkey '(Shift mod4 o) "xdotool   keyup --delay 0 o   keyup --delay 0 Super   key --delay 0 --repeat 5  Down    keydown --delay 0 Super")
