.data
prompt1: .asciiz "Ingresa el primer número: "
prompt2: .asciiz "Ingresa el segundo número: "
prompt3: .asciiz "Ingresa el tercer número: "
result: .asciiz "El número menor es: "

.text
main:
    # Pide el primer número
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Lee el primer número
    li $v0, 5
    syscall
    move $s0, $v0
    
    # Pide el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Lee el segundo número
    li $v0, 5
    syscall
    move $s1, $v0
    
    # Pide el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    
    # Lee el tercer número
    li $v0, 5
    syscall
    move $s2, $v0
    
    # Compara los tres números para encontrar el menor
    # Comienza comparando el primer número con el segundo
    slt $t0, $s0, $s1
    beqz $t0, check_second
    
    # Si el segundo número es el menor, es el nuevo menor
    move $s3, $s0
    j print_result
    
check_second:
    # Compara el segundo número con el tercer número
    slt $t0, $s1, $s2
    beqz $t0, move_third_to_s3
    
    # Si el tercer número es menor, es el nuevo menor
    move $s3, $s1
    j print_result
    
move_third_to_s3:
    # El tercer número es el menor
    move $s3, $s2
    
print_result:
    # Imprime el número menor encontrado
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $s3
    syscall
    
    # Termina el programa
    li $v0, 10
    syscall
