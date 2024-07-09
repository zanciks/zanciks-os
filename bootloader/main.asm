org 0x7C00  ; starting location of this code, for the assembler
bits 16     ; puts us into "real mode"

start:
    mov si, message 
    call print
    jmp halt

halt: hlt 

message: db "Hello, world!", 0

print: 
    push si 
    push ax 

.loop:
    lodsb
    or al, al ; is the bit zero? 
    jz print.done  ; if so, jump to done

    mov ah, 0x0e ; else, we print the char
    int 0x10
    jmp print.loop

.done:
    pop ax
    pop si
    ret

times 510-($-$$) db 0 ; this along with the next two bytes put us up to 512 bytes
dw 0AA55h ; 512 bytes for a bootloader is a requirement. 