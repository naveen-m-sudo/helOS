[org 0x7c00]
start:
	mov si, msg
	loop:
		mov al, [si]
		cmp al, 0
		je end
		mov ah, 0x0e
		int 0x10
		inc si
		jmp loop

end:
	jmp $

msg db "Hello, World!", 0

times 510-($-$$) db 0
dw 0xaa55

