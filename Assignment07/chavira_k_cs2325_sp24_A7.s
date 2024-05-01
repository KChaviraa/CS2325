//CS 2325/L 24SP
//A7
//Name: Kate Chavira
//Buff-ID: 1096539

.global main

.text

main:
  mov r7, #0

  ldr r0, =outstr1
  bl printf       //printf("Enter first integer: ")

  ldr r0, =intstr //scanf("%d, &a)
  ldr r1, =a
  bl  scanf
  ldr r4, =a
  ldr r4, [r4]

  ldr r0, =outstr2 //printf("Enter second integer: ")
  bl printf

  ldr r0, =intstr //scanf(%d, &b)
  ldr r1, =b
  bl  scanf
  ldr r5, =b
  ldr r5, [r5]

loop:
  cmp r5, #0
  beq done      //if b==0, quit loop

  and r6, r5, #1  //b & 1
  cmp r6, #1     //b & 1 == 1 -> if_loop
  beq if_loop
  mov r4, r4, lsl #1 //a = a << 1
  mov r5, r5, lsr #1 //b = b >> 1

  b loop

if_loop:
  add r7, r7, r4         //c = c + a
  mov r4, r4, lsl #1     //a = a << 1
  mov r5, r5, lsr #1     //b = b >> 1
  b loop

done:
  ldr r0, =outstr3
  ldr r1, =a
  ldr r1, [r1]
  ldr r2, =b
  ldr r2, [r2]
  mov r3, r7
  bl  printf

  b exit

.data
  outstr1: .asciz "Enter first integer: "
  outstr2: .asciz "Enter second integer: "
  intstr:  .asciz "%d"
  outstr3: .asciz "%d multiplied by %d is %d\n"
  a: .word 0 //int a = 0
  b: .word 0 //int b = 0
  c: .word 0 //int c = 0

