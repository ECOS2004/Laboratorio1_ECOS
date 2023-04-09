.data
prompt1: .asciiz "Ingrese el primer n�mero: "
prompt2: .asciiz "Ingrese el segundo n�mero: "
prompt3: .asciiz "Ingrese el tercer n�mero: "
result: .asciiz "El n�mero mayor es: "

.text
.globl main

main:
# Imprimir el primer mensaje
li $v0, 4
la $a0, prompt1
syscall

# Leer el primer numero
li $v0, 5
syscall
move $t0, $v0

# Imprimir el segundo mensaje
li $v0, 4
la $a0, prompt2
syscall

# Leer el segundo numero
li $v0, 5
syscall
move $t1, $v0

# Imprimir el tercer mensaje
li $v0, 4
la $a0, prompt3
syscall

# Leer el tercer numero
li $v0, 5
syscall
move $t2, $v0

# Encontrar el numero mayor
move $t3, $t0     # Inicialmente el programa asume que el primer numero es el mayor
ble $t1, $t3, check_t1
move $t3, $t1     # Si el segundo numero es mayor, actualiza el numero mayor
check_t1:
ble $t2, $t3, check_t2
move $t3, $t2     # Si el tercer numero es mayor, actualiza el numero mayor
check_t2:

# Imprimir el resultado
li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $t3
syscall

# Salida del programa
li $v0, 10
syscall
