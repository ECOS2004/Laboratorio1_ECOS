# Serie de Fibonacci ECOS
# Carga los primeros dos números de Fibonacci en los registros $t0 y $t1
li $t0, 0 # Carga el primer número (0) en el registro $t0
li $t1, 1 # Carga el segundo número (1) en el registro $t1

# Inicializa la variable de iteración y el límite de la serie
li $t2, 0 # Inicializa la variable de iteración en 0
li $t3, 20 # Establece el límite de la serie en 20

# Ciclo para calcular la serie de Fibonacci
Loop:
    # Imprime el número actual en la serie de Fibonacci
    move $a0, $t0 # Mueve el número actual a imprimir al registro $a0
    li $v0, 1 # Establece el código de la llamada al sistema para imprimir en pantalla (syscall) en $v0
    syscall # Realiza la llamada al sistema para imprimir el número actual

    # Calcula el siguiente número de Fibonacci
    add $t2, $t2, 1 # Incrementa la variable de iteración en 1
    add $t0, $t0, $t1 # Suma el número anterior con el actual para calcular el siguiente número de Fibonacci
    move $t1, $a0 # Mueve el número actual al registro $t1 para ser utilizado en el siguiente ciclo

    # Verifica si se alcanzó el límite de la serie
    bne $t2, $t3, Loop # Si la variable de iteración no es igual al límite, salta a la etiqueta "Loop" para continuar el ciclo

# Finaliza el programa
li $v0, 10 # Establece el código de la llamada al sistema para salir del programa en $v0
syscall # Realiza la llamada al sistema para salir del programa
