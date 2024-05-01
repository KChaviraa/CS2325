//CS 2325/L 24SP
//A6
//Name: Kate Chavira
//Buff-ID: 1096539

.global main

.text

main:
  mov r7, #0
  ldr r4, =n
  ldr r5, =array1
  ldr r6, =array2

loop1:
   cmp r7, r4
   beq start_loop2
   ldr r0, [r5]
   ldr r1, [r6]
   bl __aeabi_idivmod // array1[i] = array1[i] % array2[1]
   str r1, [r5]

   add r5, r5, #4    //increment address of array1
   add r6, r6, #4    //increment address of array2
   add r7, r7, #1    // increment index 

   b loop1


start_loop2:
  //i=0
  mov r7, #0
  ldr r5, =array1
  b loop2

loop2:
  cmp r7,r4
  beq done

  ldr r0, =outstr
  ldr r1, [r5]
  bl  printf

  add r5, r5, #4
  add r7, r7, #1

  b loop2

done:
 //newline
  ldr r0, =newline
  bl  printf
  b   exit


.data
   outstr:  .asciz   "%d "
   newline: .asciz   "\n"

   // test case 1
   array1:  .word    9,11,3,2,4,13,7,6,4,5
   array2:  .word    2,3,3,2,3,3,3,2,2,3
   .equ n, 10

   // test case 2
   //array1:  .word    2,3,3,3,2,2,3,2,3,2,3,3,2,2,3,2,3
   //array2:  .word    3,2,2,2,3,3,2,3,2,3,2,2,3,3,2,3,2
   //.equ n, 17

   // test case 3
   //array1:  .word    123
   //array2:  .word    4
   //.equ n, 1


