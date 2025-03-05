[org 0x7c00]        ; Boot sector starts at memory address 0x7C00
mov ah, 0x0e        ; BIOS teletype mode (prints characters)

mov si, message     ; Load address of message
print:
    lodsb           ; Load next character
    or al, al      ; Check for null terminator
    jz halt        ; If null, stop printing
    int 0x10       ; Print character
    jmp print      ; Repeat

halt:
    hlt            ; Halt CPU
    jmp halt       ; Infinite loop

message db 'Hello, OS!', 0

times 510-($-$$) db 0   ; Fill remaining space with zeros
dw 0xaa55               ; Boot signature
