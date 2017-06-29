	.file	"main.c"
	.intel_syntax noprefix
	.comm	_students, 4000, 6
	.globl	_count
	.bss
	.align 4
_count:
	.space 4
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	push	ebp
	mov	ebp, esp
	and	esp, -16
	call	___main
	call	_fileRead
	call	_mainMenu
	mov	eax, 0
	leave
	ret
	.section .rdata,"dr"
LC0:
	.ascii "Please input your choice:\0"
LC1:
	.ascii "%d\0"
LC2:
	.ascii "your choice is error!\0"
	.text
	.globl	_mainMenu
	.def	_mainMenu;	.scl	2;	.type	32;	.endef
_mainMenu:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
L14:
	call	_mymenu
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	lea	eax, [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, 7
	ja	L4
	mov	eax, DWORD PTR L6[0+eax*4]
	jmp	eax
	.section .rdata,"dr"
	.align 4
L6:
	.long	L4
	.long	L5
	.long	L7
	.long	L8
	.long	L9
	.long	L10
	.long	L11
	.long	L12
	.text
L5:
	mov	eax, DWORD PTR _count
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:_students
	call	_insertGrade
	jmp	L13
L7:
	mov	eax, DWORD PTR _count
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:_students
	call	_searchGrade
	jmp	L13
L8:
	mov	eax, DWORD PTR _count
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:_students
	call	_updateGrade
	jmp	L13
L9:
	mov	eax, DWORD PTR _count
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:_students
	call	_deleteGrade
	jmp	L13
L10:
	mov	eax, DWORD PTR _count
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:_students
	call	_printAllGrade
	jmp	L13
L11:
	mov	eax, DWORD PTR _count
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:_students
	call	_sortGrade
	jmp	L13
L12:
	call	_fileWrite
	mov	DWORD PTR [esp], 0
	call	_exit
L4:
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_puts
L13:
	jmp	L14
	.section .rdata,"dr"
	.align 4
LC3:
	.ascii "*1.Add grades info for a student\0"
	.align 4
LC4:
	.ascii "*2.Search Grades info for a student\0"
	.align 4
LC5:
	.ascii "*3.Alter Grades info for a student\0"
	.align 4
LC6:
	.ascii "*4.Delete Grades info for a student\0"
	.align 4
LC7:
	.ascii "*5.Print Grades info for all students\0"
	.align 4
LC8:
	.ascii "*6.Sort Grades info for all students\0"
	.align 4
LC9:
	.ascii "*7.Saving students grades info and exiting\0"
	.text
	.globl	_mymenu
	.def	_mymenu;	.scl	2;	.type	32;	.endef
_mymenu:
	push	ebp
	mov	ebp, esp
	sub	esp, 24
	mov	DWORD PTR [esp], 10
	call	_putchar
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC7
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC9
	call	_puts
	mov	DWORD PTR [esp], 10
	call	_putchar
	leave
	ret
	.section .rdata,"dr"
LC10:
	.ascii "\12Please input student ID:\0"
LC11:
	.ascii "This student exists\0"
LC12:
	.ascii "\12Please input student Name:\0"
LC13:
	.ascii "%s\0"
LC14:
	.ascii "\12Please input C Grades:\0"
LC15:
	.ascii "%f\0"
LC16:
	.ascii "\12Please input Math Grades:\0"
LC17:
	.ascii "\12Please input English Grades:\0"
LC18:
	.ascii "\12Are you sure to add?(y/n)\0"
LC19:
	.ascii "%c\0"
LC20:
	.ascii "This record is added\0"
LC21:
	.ascii "You undoed the add operation!\0"
	.text
	.globl	_insertGrade
	.def	_insertGrade;	.scl	2;	.type	32;	.endef
_insertGrade:
	push	ebp
	mov	ebp, esp
	sub	esp, 72
	mov	DWORD PTR [ebp-16], 1
	mov	eax, DWORD PTR _count
	test	eax, eax
	jne	L17
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	_printf
	lea	eax, [ebp-20]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	jmp	L18
L17:
	jmp	L19
L23:
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	_printf
	lea	eax, [ebp-20]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	mov	DWORD PTR [ebp-16], 0
	mov	DWORD PTR [ebp-12], 0
	jmp	L20
L22:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-20]
	cmp	edx, eax
	jne	L21
	mov	DWORD PTR [esp], OFFSET FLAT:LC11
	call	_puts
	mov	DWORD PTR [ebp-16], 1
L21:
	add	DWORD PTR [ebp-12], 1
L20:
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp+12]
	jl	L22
L19:
	cmp	DWORD PTR [ebp-16], 0
	jne	L23
L18:
	mov	DWORD PTR [esp], OFFSET FLAT:LC12
	call	_printf
	lea	eax, [ebp-41]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC13
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC14
	call	_printf
	lea	eax, [ebp-48]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC15
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC16
	call	_printf
	lea	eax, [ebp-52]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC15
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC17
	call	_printf
	lea	eax, [ebp-56]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC15
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC18
	call	_printf
	mov	eax, DWORD PTR __imp___iob
	mov	DWORD PTR [esp], eax
	call	_fflush
	lea	eax, [ebp-21]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC19
	call	_scanf
	movzx	eax, BYTE PTR [ebp-21]
	cmp	al, 121
	jne	L24
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-20]
	mov	DWORD PTR [edx], eax
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	lea	edx, [eax+4]
	lea	eax, [ebp-41]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], edx
	call	_strcpy
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-48]
	mov	DWORD PTR [edx+24], eax
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-52]
	mov	DWORD PTR [edx+28], eax
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-56]
	mov	DWORD PTR [edx+32], eax
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	fld	DWORD PTR [ebp-48]
	fld	DWORD PTR [ebp-52]
	faddp	st(1), st
	fld	DWORD PTR [ebp-56]
	faddp	st(1), st
	fstp	DWORD PTR [eax+36]
	mov	eax, DWORD PTR _count
	add	eax, 1
	mov	DWORD PTR _count, eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC20
	call	_puts
	jmp	L25
L24:
	mov	DWORD PTR [esp], OFFSET FLAT:LC21
	call	_puts
L25:
	mov	eax, 0
	leave
	ret
	.section .rdata,"dr"
LC23:
	.ascii "\12No student info can search!\0"
	.align 4
LC24:
	.ascii "No student finded, please input a student ID agian!\0"
	.text
	.globl	_searchGrade
	.def	_searchGrade;	.scl	2;	.type	32;	.endef
_searchGrade:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	DWORD PTR [ebp-16], 1
	cmp	DWORD PTR [ebp+12], 0
	jne	L28
	mov	DWORD PTR [esp], OFFSET FLAT:LC23
	call	_puts
	mov	eax, -1
	jmp	L37
L28:
	jmp	L30
L36:
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	_printf
	lea	eax, [ebp-20]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	mov	DWORD PTR [ebp-16], 1
	mov	DWORD PTR [ebp-12], 0
	jmp	L31
L34:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-20]
	cmp	edx, eax
	jne	L32
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_printGrade
	mov	DWORD PTR [ebp-16], 0
	jmp	L33
L32:
	add	DWORD PTR [ebp-12], 1
L31:
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp+12]
	jl	L34
L33:
	cmp	DWORD PTR [ebp-16], 1
	jne	L30
	mov	DWORD PTR [esp], OFFSET FLAT:LC24
	call	_puts
	jmp	L35
L30:
	cmp	DWORD PTR [ebp-16], 0
	jne	L36
L35:
	call	_mainMenu
	mov	eax, 0
L37:
	leave
	ret
	.section .rdata,"dr"
LC25:
	.ascii "\12No student can update\0"
	.align 4
LC26:
	.ascii "this student is already finded!\0"
LC27:
	.ascii "No student info can be finded\0"
	.text
	.globl	_updateGrade
	.def	_updateGrade;	.scl	2;	.type	32;	.endef
_updateGrade:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	cmp	DWORD PTR [ebp+12], 0
	jne	L39
	mov	DWORD PTR [esp], OFFSET FLAT:LC25
	call	_puts
	mov	eax, -1
	jmp	L45
L39:
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	_printf
	lea	eax, [ebp-16]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	mov	DWORD PTR [ebp-12], 0
	jmp	L41
L44:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-16]
	cmp	edx, eax
	jne	L42
	mov	DWORD PTR [esp], OFFSET FLAT:LC26
	call	_puts
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_updateThings
	jmp	L43
L42:
	mov	DWORD PTR [esp], OFFSET FLAT:LC27
	call	_puts
L43:
	add	DWORD PTR [ebp-12], 1
L41:
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp+12]
	jl	L44
	call	_mainMenu
	mov	eax, 0
L45:
	leave
	ret
	.section .rdata,"dr"
	.align 4
LC28:
	.ascii "\12The fllowing info will be alter:\0"
	.align 4
LC29:
	.ascii "\12are you sure to alter it ?(y/n)\0"
LC30:
	.ascii "\12This record  is altered !\0"
	.align 4
LC31:
	.ascii "\12You quit this alter operation!\0"
	.text
	.globl	_updateThings
	.def	_updateThings;	.scl	2;	.type	32;	.endef
_updateThings:
	push	ebp
	mov	ebp, esp
	sub	esp, 72
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	_printf
	lea	eax, [ebp-29]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC13
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC14
	call	_printf
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC15
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC16
	call	_printf
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC15
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC17
	call	_printf
	lea	eax, [ebp-44]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC15
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC28
	call	_printf
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_printGrade
	mov	DWORD PTR [esp], OFFSET FLAT:LC29
	call	_printf
	mov	eax, DWORD PTR __imp___iob
	mov	DWORD PTR [esp], eax
	call	_fflush
	lea	eax, [ebp-9]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC19
	call	_scanf
	movzx	eax, BYTE PTR [ebp-9]
	cmp	al, 121
	jne	L47
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	lea	edx, [eax+4]
	lea	eax, [ebp-29]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], edx
	call	_strcpy
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [edx+24], eax
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [edx+28], eax
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	edx, eax
	mov	eax, DWORD PTR [ebp-44]
	mov	DWORD PTR [edx+32], eax
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	fld	DWORD PTR [ebp-36]
	fld	DWORD PTR [ebp-40]
	faddp	st(1), st
	fld	DWORD PTR [ebp-44]
	faddp	st(1), st
	fstp	DWORD PTR [eax+36]
	mov	DWORD PTR [esp], OFFSET FLAT:LC30
	call	_puts
	jmp	L48
L47:
	mov	DWORD PTR [esp], OFFSET FLAT:LC31
	call	_puts
L48:
	mov	eax, 0
	leave
	ret
	.section .rdata,"dr"
LC32:
	.ascii "\12No students info can delete\0"
	.align 4
LC33:
	.ascii "\12Please input student ID what you want to delete:\0"
	.align 4
LC34:
	.ascii " The fllowing info will be deleted:\0"
LC35:
	.ascii "\12Are you sure to delete?(y/n)\0"
	.align 4
LC36:
	.ascii "You quit this delete operation\0"
	.align 4
LC37:
	.ascii "\12No student info can be finded!\0"
	.text
	.globl	_deleteGrade
	.def	_deleteGrade;	.scl	2;	.type	32;	.endef
_deleteGrade:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	eax, DWORD PTR _count
	test	eax, eax
	jne	L51
	mov	DWORD PTR [esp], OFFSET FLAT:LC32
	call	_puts
	mov	eax, -1
	jmp	L59
L51:
	mov	DWORD PTR [esp], OFFSET FLAT:LC33
	call	_printf
	lea	eax, [ebp-16]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	mov	DWORD PTR [ebp-12], 0
	jmp	L53
L58:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-16]
	cmp	edx, eax
	jne	L54
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_puts
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_printGrade
	mov	DWORD PTR [esp], OFFSET FLAT:LC35
	call	_printf
	mov	eax, DWORD PTR __imp___iob
	mov	DWORD PTR [esp], eax
	call	_fflush
	lea	eax, [ebp-17]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC19
	call	_scanf
	movzx	eax, BYTE PTR [ebp-17]
	cmp	al, 121
	jne	L55
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_deteleThings
	jmp	L57
L55:
	mov	DWORD PTR [esp], OFFSET FLAT:LC36
	call	_puts
	jmp	L57
L54:
	mov	DWORD PTR [esp], OFFSET FLAT:LC37
	call	_puts
L57:
	add	DWORD PTR [ebp-12], 1
L53:
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp+12]
	jl	L58
	call	_mainMenu
	mov	eax, 0
L59:
	leave
	ret
	.section .rdata,"dr"
	.align 4
LC38:
	.ascii "Student ID is %d has been deleted!\12\0"
	.text
	.globl	_deteleThings
	.def	_deteleThings;	.scl	2;	.type	32;	.endef
_deteleThings:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	eax, DWORD PTR [ebp+12]
	sub	eax, 1
	mov	DWORD PTR [ebp-12], eax
	jmp	L61
L62:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	edx, DWORD PTR [ebp-12]
	lea	ecx, [edx+1]
	mov	edx, ecx
	sal	edx, 2
	add	edx, ecx
	sal	edx, 3
	mov	ecx, edx
	mov	edx, DWORD PTR [ebp+8]
	add	edx, ecx
	mov	ecx, DWORD PTR [edx]
	mov	DWORD PTR [eax], ecx
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR [eax+4], ecx
	mov	ecx, DWORD PTR [edx+8]
	mov	DWORD PTR [eax+8], ecx
	mov	ecx, DWORD PTR [edx+12]
	mov	DWORD PTR [eax+12], ecx
	mov	ecx, DWORD PTR [edx+16]
	mov	DWORD PTR [eax+16], ecx
	mov	ecx, DWORD PTR [edx+20]
	mov	DWORD PTR [eax+20], ecx
	mov	ecx, DWORD PTR [edx+24]
	mov	DWORD PTR [eax+24], ecx
	mov	ecx, DWORD PTR [edx+28]
	mov	DWORD PTR [eax+28], ecx
	mov	ecx, DWORD PTR [edx+32]
	mov	DWORD PTR [eax+32], ecx
	mov	edx, DWORD PTR [edx+36]
	mov	DWORD PTR [eax+36], edx
	add	DWORD PTR [ebp-12], 1
L61:
	mov	eax, DWORD PTR _count
	cmp	DWORD PTR [ebp-12], eax
	jl	L62
	mov	eax, DWORD PTR _count
	sub	eax, 1
	mov	DWORD PTR _count, eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC38
	call	_printf
	mov	eax, 0
	leave
	ret
	.section .rdata,"dr"
LC39:
	.ascii "\12No student can sort!\0"
	.align 4
LC40:
	.ascii "Input error,please input a menu choice again!\0"
	.text
	.globl	_sortGrade
	.def	_sortGrade;	.scl	2;	.type	32;	.endef
_sortGrade:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	cmp	DWORD PTR [ebp+12], 0
	jne	L65
	mov	DWORD PTR [esp], OFFSET FLAT:LC39
	call	_puts
	mov	eax, -1
	jmp	L66
L65:
	call	_printSortMenu
	mov	DWORD PTR [ebp-12], eax
	cmp	DWORD PTR [ebp-12], 9
	ja	L67
	mov	eax, DWORD PTR [ebp-12]
	sal	eax, 2
	add	eax, OFFSET FLAT:L69
	mov	eax, DWORD PTR [eax]
	jmp	eax
	.section .rdata,"dr"
	.align 4
L69:
	.long	L67
	.long	L68
	.long	L70
	.long	L71
	.long	L72
	.long	L73
	.long	L74
	.long	L75
	.long	L76
	.long	L77
	.text
L68:
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], 1
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_popSort
	jmp	L78
L70:
	mov	DWORD PTR [esp+12], 2
	mov	DWORD PTR [esp+8], 1
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_popSort
	jmp	L78
L71:
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], 2
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_popSort
	jmp	L78
L72:
	mov	DWORD PTR [esp+12], 2
	mov	DWORD PTR [esp+8], 2
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_popSort
	jmp	L78
L73:
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], 3
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_popSort
	jmp	L78
L74:
	mov	DWORD PTR [esp+12], 2
	mov	DWORD PTR [esp+8], 3
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_popSort
	jmp	L78
L75:
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], 4
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_popSort
	jmp	L78
L76:
	mov	DWORD PTR [esp+12], 2
	mov	DWORD PTR [esp+8], 4
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_popSort
	jmp	L78
L77:
	call	_mainMenu
	jmp	L78
L67:
	mov	DWORD PTR [esp], OFFSET FLAT:LC40
	call	_puts
	nop
L78:
	call	_mainMenu
	mov	eax, 0
L66:
	leave
	ret
	.section .rdata,"dr"
LC41:
	.ascii "*1.Sort by C Grades ASC \0"
LC42:
	.ascii "*2.Sort by C Grades DESC \0"
LC43:
	.ascii "*3.Sort by Math Grades ASC \0"
LC44:
	.ascii "*4.Sort by Math Grades DESC\0"
	.align 4
LC45:
	.ascii "*5.Sort by English Grades ASC \0"
	.align 4
LC46:
	.ascii "*6.Sort by English Grades DESC\0"
LC47:
	.ascii "*7.Sort by sum Grades ASC \0"
LC48:
	.ascii "*8.Sort by sum Grades DESC\0"
LC49:
	.ascii "*9.return main menu!\0"
	.align 4
LC50:
	.ascii "Please input your sort choice:\0"
	.text
	.globl	_printSortMenu
	.def	_printSortMenu;	.scl	2;	.type	32;	.endef
_printSortMenu:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	DWORD PTR [esp], 10
	call	_putchar
	mov	DWORD PTR [esp], OFFSET FLAT:LC41
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC42
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC43
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC44
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC45
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC46
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC47
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC48
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC49
	call	_puts
	mov	DWORD PTR [esp], 10
	call	_putchar
	mov	DWORD PTR [esp], OFFSET FLAT:LC50
	call	_printf
	lea	eax, [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	mov	eax, DWORD PTR [ebp-12]
	leave
	ret
	.globl	_popSort
	.def	_popSort;	.scl	2;	.type	32;	.endef
_popSort:
	push	ebp
	mov	ebp, esp
	sub	esp, 88
	mov	DWORD PTR [ebp-28], 1
	mov	DWORD PTR [ebp-20], 0
	jmp	L82
L96:
	mov	eax, DWORD PTR [ebp-20]
	add	eax, 1
	mov	DWORD PTR [ebp-24], eax
	jmp	L83
L93:
	cmp	DWORD PTR [ebp+16], 1
	jne	L84
	mov	edx, DWORD PTR [ebp-20]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR [ebp-12], eax
	mov	edx, DWORD PTR [ebp-24]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR [ebp-16], eax
	jmp	L85
L84:
	cmp	DWORD PTR [ebp+16], 2
	jne	L86
	mov	edx, DWORD PTR [ebp-20]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR [ebp-12], eax
	mov	edx, DWORD PTR [ebp-24]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR [ebp-16], eax
	jmp	L85
L86:
	cmp	DWORD PTR [ebp+16], 3
	jne	L87
	mov	edx, DWORD PTR [ebp-20]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR [ebp-12], eax
	mov	edx, DWORD PTR [ebp-24]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR [ebp-16], eax
	jmp	L85
L87:
	cmp	DWORD PTR [ebp+16], 4
	jne	L85
	mov	edx, DWORD PTR [ebp-20]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR [ebp-12], eax
	mov	edx, DWORD PTR [ebp-24]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR [ebp-16], eax
L85:
	cmp	DWORD PTR [ebp+20], 1
	jne	L88
	fld	DWORD PTR [ebp-12]
	fld	DWORD PTR [ebp-16]
	fxch	st(1)
	fucomip	st, st(1)
	fstp	st(0)
	ja	L98
	jmp	L91
L98:
	mov	edx, DWORD PTR [ebp-24]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ebp-68], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ebp-64], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ebp-60], edx
	mov	edx, DWORD PTR [eax+12]
	mov	DWORD PTR [ebp-56], edx
	mov	edx, DWORD PTR [eax+16]
	mov	DWORD PTR [ebp-52], edx
	mov	edx, DWORD PTR [eax+20]
	mov	DWORD PTR [ebp-48], edx
	mov	edx, DWORD PTR [eax+24]
	mov	DWORD PTR [ebp-44], edx
	mov	edx, DWORD PTR [eax+28]
	mov	DWORD PTR [ebp-40], edx
	mov	edx, DWORD PTR [eax+32]
	mov	DWORD PTR [ebp-36], edx
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR [ebp-32], eax
	mov	edx, DWORD PTR [ebp-24]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	ecx, DWORD PTR [ebp-20]
	mov	edx, ecx
	sal	edx, 2
	add	edx, ecx
	sal	edx, 3
	mov	ecx, edx
	mov	edx, DWORD PTR [ebp+8]
	add	edx, ecx
	mov	ecx, DWORD PTR [edx]
	mov	DWORD PTR [eax], ecx
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR [eax+4], ecx
	mov	ecx, DWORD PTR [edx+8]
	mov	DWORD PTR [eax+8], ecx
	mov	ecx, DWORD PTR [edx+12]
	mov	DWORD PTR [eax+12], ecx
	mov	ecx, DWORD PTR [edx+16]
	mov	DWORD PTR [eax+16], ecx
	mov	ecx, DWORD PTR [edx+20]
	mov	DWORD PTR [eax+20], ecx
	mov	ecx, DWORD PTR [edx+24]
	mov	DWORD PTR [eax+24], ecx
	mov	ecx, DWORD PTR [edx+28]
	mov	DWORD PTR [eax+28], ecx
	mov	ecx, DWORD PTR [edx+32]
	mov	DWORD PTR [eax+32], ecx
	mov	edx, DWORD PTR [edx+36]
	mov	DWORD PTR [eax+36], edx
	mov	edx, DWORD PTR [ebp-20]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	edx, DWORD PTR [ebp-68]
	mov	DWORD PTR [eax], edx
	mov	edx, DWORD PTR [ebp-64]
	mov	DWORD PTR [eax+4], edx
	mov	edx, DWORD PTR [ebp-60]
	mov	DWORD PTR [eax+8], edx
	mov	edx, DWORD PTR [ebp-56]
	mov	DWORD PTR [eax+12], edx
	mov	edx, DWORD PTR [ebp-52]
	mov	DWORD PTR [eax+16], edx
	mov	edx, DWORD PTR [ebp-48]
	mov	DWORD PTR [eax+20], edx
	mov	edx, DWORD PTR [ebp-44]
	mov	DWORD PTR [eax+24], edx
	mov	edx, DWORD PTR [ebp-40]
	mov	DWORD PTR [eax+28], edx
	mov	edx, DWORD PTR [ebp-36]
	mov	DWORD PTR [eax+32], edx
	mov	edx, DWORD PTR [ebp-32]
	mov	DWORD PTR [eax+36], edx
	mov	DWORD PTR [ebp-28], 0
	jmp	L91
L88:
	cmp	DWORD PTR [ebp+20], 2
	jne	L91
	fld	DWORD PTR [ebp-16]
	fld	DWORD PTR [ebp-12]
	fxch	st(1)
	fucomip	st, st(1)
	fstp	st(0)
	jbe	L91
	mov	edx, DWORD PTR [ebp-24]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ebp-68], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ebp-64], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ebp-60], edx
	mov	edx, DWORD PTR [eax+12]
	mov	DWORD PTR [ebp-56], edx
	mov	edx, DWORD PTR [eax+16]
	mov	DWORD PTR [ebp-52], edx
	mov	edx, DWORD PTR [eax+20]
	mov	DWORD PTR [ebp-48], edx
	mov	edx, DWORD PTR [eax+24]
	mov	DWORD PTR [ebp-44], edx
	mov	edx, DWORD PTR [eax+28]
	mov	DWORD PTR [ebp-40], edx
	mov	edx, DWORD PTR [eax+32]
	mov	DWORD PTR [ebp-36], edx
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR [ebp-32], eax
	mov	edx, DWORD PTR [ebp-24]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	ecx, DWORD PTR [ebp-20]
	mov	edx, ecx
	sal	edx, 2
	add	edx, ecx
	sal	edx, 3
	mov	ecx, edx
	mov	edx, DWORD PTR [ebp+8]
	add	edx, ecx
	mov	ecx, DWORD PTR [edx]
	mov	DWORD PTR [eax], ecx
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR [eax+4], ecx
	mov	ecx, DWORD PTR [edx+8]
	mov	DWORD PTR [eax+8], ecx
	mov	ecx, DWORD PTR [edx+12]
	mov	DWORD PTR [eax+12], ecx
	mov	ecx, DWORD PTR [edx+16]
	mov	DWORD PTR [eax+16], ecx
	mov	ecx, DWORD PTR [edx+20]
	mov	DWORD PTR [eax+20], ecx
	mov	ecx, DWORD PTR [edx+24]
	mov	DWORD PTR [eax+24], ecx
	mov	ecx, DWORD PTR [edx+28]
	mov	DWORD PTR [eax+28], ecx
	mov	ecx, DWORD PTR [edx+32]
	mov	DWORD PTR [eax+32], ecx
	mov	edx, DWORD PTR [edx+36]
	mov	DWORD PTR [eax+36], edx
	mov	edx, DWORD PTR [ebp-20]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	edx, DWORD PTR [ebp-68]
	mov	DWORD PTR [eax], edx
	mov	edx, DWORD PTR [ebp-64]
	mov	DWORD PTR [eax+4], edx
	mov	edx, DWORD PTR [ebp-60]
	mov	DWORD PTR [eax+8], edx
	mov	edx, DWORD PTR [ebp-56]
	mov	DWORD PTR [eax+12], edx
	mov	edx, DWORD PTR [ebp-52]
	mov	DWORD PTR [eax+16], edx
	mov	edx, DWORD PTR [ebp-48]
	mov	DWORD PTR [eax+20], edx
	mov	edx, DWORD PTR [ebp-44]
	mov	DWORD PTR [eax+24], edx
	mov	edx, DWORD PTR [ebp-40]
	mov	DWORD PTR [eax+28], edx
	mov	edx, DWORD PTR [ebp-36]
	mov	DWORD PTR [eax+32], edx
	mov	edx, DWORD PTR [ebp-32]
	mov	DWORD PTR [eax+36], edx
	mov	DWORD PTR [ebp-28], 0
L91:
	add	DWORD PTR [ebp-24], 1
L83:
	mov	eax, DWORD PTR [ebp-24]
	cmp	eax, DWORD PTR [ebp+12]
	jl	L93
	cmp	DWORD PTR [ebp-28], 0
	je	L94
	jmp	L95
L94:
	add	DWORD PTR [ebp-20], 1
L82:
	mov	eax, DWORD PTR [ebp+12]
	sub	eax, 1
	cmp	eax, DWORD PTR [ebp-20]
	jg	L96
L95:
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_printAllGrade
	mov	eax, 0
	leave
	ret
	.section .rdata,"dr"
LC51:
	.ascii "wb\0"
LC52:
	.ascii "test.txt\0"
LC53:
	.ascii "\12Can't open this file!\0"
LC54:
	.ascii "\12Writen file error!\0"
	.text
	.globl	_fileWrite
	.def	_fileWrite;	.scl	2;	.type	32;	.endef
_fileWrite:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC51
	mov	DWORD PTR [esp], OFFSET FLAT:LC52
	call	_fopen
	mov	DWORD PTR [ebp-16], eax
	cmp	DWORD PTR [ebp-16], 0
	jne	L101
	mov	DWORD PTR [esp], OFFSET FLAT:LC53
	call	_puts
	mov	eax, -1
	jmp	L102
L101:
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+12], eax
	mov	DWORD PTR [esp+8], 1
	mov	DWORD PTR [esp+4], 4
	mov	DWORD PTR [esp], OFFSET FLAT:_count
	call	_fwrite
	cmp	eax, 1
	je	L103
	mov	DWORD PTR [esp], OFFSET FLAT:LC54
	call	_puts
	mov	eax, -1
	jmp	L102
L103:
	mov	DWORD PTR [ebp-12], 0
	jmp	L104
L106:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	lea	edx, _students[eax]
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+12], eax
	mov	DWORD PTR [esp+8], 1
	mov	DWORD PTR [esp+4], 40
	mov	DWORD PTR [esp], edx
	call	_fwrite
	cmp	eax, 1
	je	L105
	mov	DWORD PTR [esp], OFFSET FLAT:LC54
	call	_puts
	mov	eax, -1
	jmp	L102
L105:
	add	DWORD PTR [ebp-12], 1
L104:
	mov	eax, DWORD PTR _count
	cmp	DWORD PTR [ebp-12], eax
	jl	L106
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	call	_fclose
	mov	eax, 0
L102:
	leave
	ret
	.section .rdata,"dr"
LC55:
	.ascii "r\0"
	.align 4
LC56:
	.ascii "fileRead error,No such this file!\0"
	.text
	.globl	_fileRead
	.def	_fileRead;	.scl	2;	.type	32;	.endef
_fileRead:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC55
	mov	DWORD PTR [esp], OFFSET FLAT:LC52
	call	_fopen
	mov	DWORD PTR [ebp-16], eax
	cmp	DWORD PTR [ebp-16], 0
	jne	L108
	mov	DWORD PTR [esp], OFFSET FLAT:LC56
	call	_puts
	mov	eax, -1
	jmp	L109
L108:
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+12], eax
	mov	DWORD PTR [esp+8], 1
	mov	DWORD PTR [esp+4], 4
	mov	DWORD PTR [esp], OFFSET FLAT:_count
	call	_fread
	cmp	eax, 1
	je	L110
	mov	DWORD PTR _count, -1
	jmp	L111
L110:
	mov	DWORD PTR [ebp-12], 0
	jmp	L112
L113:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	lea	edx, _students[eax]
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+12], eax
	mov	DWORD PTR [esp+8], 1
	mov	DWORD PTR [esp+4], 40
	mov	DWORD PTR [esp], edx
	call	_fread
	add	DWORD PTR [ebp-12], 1
L112:
	mov	eax, DWORD PTR _count
	cmp	DWORD PTR [ebp-12], eax
	jl	L113
L111:
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	call	_fclose
	mov	eax, 0
L109:
	leave
	ret
	.section .rdata,"dr"
LC57:
	.ascii "\12No student info can display!\0"
	.text
	.globl	_printAllGrade
	.def	_printAllGrade;	.scl	2;	.type	32;	.endef
_printAllGrade:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	cmp	DWORD PTR [ebp+12], 0
	jne	L115
	mov	DWORD PTR [esp], OFFSET FLAT:LC57
	call	_puts
L115:
	mov	DWORD PTR [ebp-12], 0
	jmp	L116
L117:
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_printGrade
	add	DWORD PTR [ebp-12], 1
L116:
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp+12]
	jl	L117
	leave
	ret
	.section .rdata,"dr"
	.align 4
LC58:
	.ascii "\12StuId: %d, StuName: %s, CGrades: %.2f, MGrades: %.2f, EGrades: %.2f, SumGrades: %.2f\12\0"
	.text
	.globl	_printGrade
	.def	_printGrade;	.scl	2;	.type	32;	.endef
_printGrade:
	push	ebp
	mov	ebp, esp
	sub	esp, 56
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	fld	DWORD PTR [eax+36]
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	fld	DWORD PTR [eax+32]
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	fld	DWORD PTR [eax+28]
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	fld	DWORD PTR [eax+24]
	fxch	st(3)
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	lea	ecx, [eax+4]
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 3
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	eax, DWORD PTR [eax]
	fstp	QWORD PTR [esp+36]
	fxch	st(1)
	fstp	QWORD PTR [esp+28]
	fstp	QWORD PTR [esp+20]
	fstp	QWORD PTR [esp+12]
	mov	DWORD PTR [esp+8], ecx
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC58
	call	_printf
	leave
	ret
	.ident	"GCC: (tdm-1) 4.9.2"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_fflush;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fwrite;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_fread;	.scl	2;	.type	32;	.endef
