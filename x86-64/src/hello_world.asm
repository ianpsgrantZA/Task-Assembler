; Hello World

global _start

section .text
_start:
  mov rax, 1          ; write syscall
  mov rdi, 1          ; use stdout as file descriptor
  mov rsi, msg1       ; use message as buffer
  mov rdx, msg1_len   ; supply message length
  syscall

  mov rax, 0          ; read syscall
  mov rdi, 0          ; use stdin as file descriptor
  mov rsi, buffer     ; rsi <- address of the buffer.  lea rsi, [rel buffer]
  mov edx, BUFSIZE    ; rdx <- size of the buffer

  mov rax, 0x3C       ; exit syscall
  mov rdi, 0          ; exit gracefully
  syscall

section .bss          ; uninitialised data
  buffer:
  buffer_len:

section .data         ; initialised data

section .rodata       ; constants data
  msg1: db "Hello, world!", 0xA
  msg1_len: equ $-msg1


; syscalls: https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
; %rax	System call
; 0x0	sys_read
; 0x1	sys_write
; 0x3C sys_exit