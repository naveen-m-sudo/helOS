[org 0x7c00]
start:

	call print_message
	jmp end

;==============================
; Print text message
;==============================

print_message:
	mov si, msg
	.loop:
		mov al, [si]
		cmp al, 0
		je .end
		call _print_char
		inc si
		jmp .loop
	.end:
		ret 

_print_char:
	mov ah, 0x0e
	int 0x10
	ret

_read_char:
	mov ah, 0x00
	int 0x16
	ret

end:
	jmp $

msg db "Hello, World!", 0

times 510-($-$$) db 0
dw 0xaa55

