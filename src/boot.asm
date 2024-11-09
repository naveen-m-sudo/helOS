; Naveen M 08-11-2024

[org 0x7c00]

start:
	call _clear_screen		; clears the screen
	call print_message		; print text
	call _print_tag			; prints '>>> ' for getting user input
	jmp end				; jump to end of the program

;==============================
; Get and process commands
;==============================

get_process: 

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

;==============================
; Utility functions
;==============================

_print_tag:
	mov si, cmd_tag
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

_clear_screen:
	mov ax, 0x0003
	int 0x10
	ret

;==============================
; End of the program
;==============================
end:
	jmp $

;==============================
; Messages and buffers
;==============================

cmd_tag db 0xd, 0xa, ">>> ", 0

msg db "helOS!", 0
clear_cmd db "clear", 0
command_buffer times 12 db 0
command_buffer_len db 0
;=================================================================
; Fill remaining empty memory with 0 and put boot signature
;=================================================================
times 510-($-$$) db 0
dw 0xaa55

