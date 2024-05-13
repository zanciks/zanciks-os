[bits 16] ; 16 bit mode. required for bootloaders
[org 0x7c00] ; where we are required to start our bootloader 

start:
  ; print hello_world data 
  mov si, hello_world 
  call print 

print:
  ; we are going to modify these, so we want to be able to restore them
  push si
  push ax

  .loop:
    lodsb ; load next character into al 
    or al, al ; if char is null
    jz .done ; then jump to done

    mov ah, 0x0e ; set interrupt to print char (inside of VIDEO)
    int 0x10 ; call interrupt of type VIDEO
    jmp .loop

  .done:
    ; reset the values we modified
    pop ax
    pop si 
    ret

hello_world: db "Hello, world!", 13, 0 ; 13 is ENDL ; 0 is end string

times (510 - ($-$$)) db 0x00 ; set all bytes to 0x00 until we have 510 
dw 0xAA55 ; set our remaining bytes to 0xAA and 0x55, putting us to 512 bytes