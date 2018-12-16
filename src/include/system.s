global inport   ; make the label inport visible outside this file
global outport  ; make the label outport visible outside this file

; inport - returns a byte from the given I/O port
; stack: [esp + 4] The address of the I/O port
;        [esp    ] The return address
inport:
mov dx, [esp + 4]     ; move the address of the I/O port to the dx register
in  al, dx            ; read a byte from the I/O port and store it in the al register
ret                   ; return the read byte

; outport - send a byte to an I/O port
; stack: [esp + 8] the data byte
;        [esp + 4] the I/O port
;        [esp    ] return address
outport:
mov al, [esp + 8]     ; move the data to be sent into the al register
mov dx, [esp + 4]     ; move the address of the I/O port into the dx register
out dx, al            ; send the data to the I/O port
ret                   ; return to the calling function