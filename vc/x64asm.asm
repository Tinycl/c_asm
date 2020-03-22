option casemap:none


cfun1 Proto
cfun2 Proto
printf Proto

EXTERN cvar1:qword


public asmvar1
.data
asmvar1 qword 1234H
asmstr DB 'at the asmfun', 0AH,00H

.code

asmfun1 Proc
	
	ret
asmfun1 Endp

asmfun_call_cfun1 Proc
	
	call cfun1
	ret
asmfun_call_cfun1 Endp

asmfun_call_cfun2_1 Proc
	
	;register  pass para rcx, rdx, r8, r9, stack -> register need stack to save
	mov rcx, 1h
	mov rdx, 2h
	mov r8,  3h
	mov r9,  4h
	sub rsp, 20h  ; register pass para, yet need stack 8 * refisters, otherwise destory caller stack
	sub rsp, 8h  ; fifth para
	mov qword ptr[rsp + 20h], 5h
	call cfun2
	add rsp, 20h  ;registers
	add rsp, 8h   ;stack
	ret
asmfun_call_cfun2_1 Endp


asmfun_call_cfun2_2 Proc
	
	sub rsp, 8h
	push r10
	mov r10, qword ptr[rsp + 38h] ;call auto push ret address, 8
	mov qword ptr[rsp + 8h], r10
	pop r10
	sub rsp, 20h
	;mov qword ptr[rsp + 20h], 
	call cfun2
	add rsp, 28h

	ret
asmfun_call_cfun2_2 Endp


asmfun_call_cprintf Proc
	push rdi
	sub  rsp, 20h ;variable para need at least 20h
	lea  rcx, [asmstr]
	call printf
	add  rsp, 20h
	pop rdi
	ret
asmfun_call_cprintf Endp

END