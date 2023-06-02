; Rule of thumb:
; input in r8
; output in r9


section .data 
  welcome1: db "Welcome to taskmanager!", 0x0A, 0x00
  welcome2: db "Enter you tasks below. You can exit by entering '0'", 0x0A, 0x0A, 0x00
  input_prompt: db "Enter a new task: ", 0x00
  input_confirmation1: db "You've entered: ", 0x0A, 0x00
  input_confirmation2: db " - ", 0x00
  input_data: db 100
  exit_data: db 0x0A, 0x00

section .text
  global _start

_start:
  mov r8, welcome1
  call .print_data
  mov r8, welcome2
  call .print_data

  call .task_loop

  call .print_new_line
  call .exit


.task_loop:
  mov r8, input_prompt
  call .print_data

  call .read_data

  mov r8, input_confirmation1
  call .print_data
  mov r8, input_confirmation2
  call .print_data

  mov r8, input_data
  call .print_data

  cmp byte [r8], 0x00
  
  jne .task_loop
  ret

.print_string:
  mov rax, 1          ; write syscall
  mov rdi, 1          ; use stdout as file descriptor
  push r8
  mov rsi, rsp        ; use message as buffer
  call .str_len
  mov rdx, r9   ; supply message length
  pop r9
  syscall
  ret

.print_data:
  mov rax, 1          ; write syscall
  mov rdi, 1          ; use stdout as file descriptor
  mov rsi, r8        ; use message as buffer
  call .str_len
  mov rdx, r9   ; supply message length
  syscall
  ret

.print_char:
  mov rax, 1          ; write syscall
  mov rdi, 1          ; use stdout as file descriptor
  push r8
  mov rsi, rsp        ; use message as buffer
  mov rdx, 1          ; supply message length
  syscall
  pop r8
  ret

.print_new_line:
  mov r8, 0x0A
  call .print_char
  ret

.read_data:
  mov rax, 0
  mov rdi, 0
  mov rsi, input_data
  mov edx, 100
  syscall
  ret

.str_len:             ; length of string in r8
  mov r9, 0              ; initialise length counter 
.str_len_loop:
  add r8, 1              ; increment character pointer
  add r9, 1              ; increment strlen counter
  cmp byte [r8], 0x00    ; look for 0x00 character
  jne .str_len_loop               ; loop if not found
  ret    

.exit:
  mov rax, 60
  mov rdi, 0
  syscall

.test:
  push 0x21
  mov rsi, rsp
  mov rdx, 1
  mov rax, 1
  mov rdi, 1
  syscall
  pop r9
  ret  
