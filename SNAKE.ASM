org     100h

jmp     start

s_size  equ     7

snake dw s_size dup(0)

tail    dw      ?

left    equ     4bh
right   equ     4dh
up      equ     48h
down    equ     50h

cur_dir db      right

wait_time dw    0


start:
mov     ah, 1
mov     ch, 2bh
mov     cl, 0bh
int     10h           

game_loop:

mov     al, 0 
mov     ah, 05h
int     10h

mov     dx, snake[0]
mov     ah, 02h
int     10h

mov     al, '*'
mov     ah, 09h
mov     bl, 0eh
mov     cx, 1 
int     10h

mov     ax, snake[s_size * 2 - 2]
mov     tail, ax

call    move_snake

mov     dx, tail

mov     ah, 02h
int     10h

mov     al, ' '
mov     ah, 09h
mov     bl, 0eh
mov     cx, 1  
int     10h

check_for_key:

mov     ah, 01h
int     16h
jz      no_key

mov     ah, 00h
int     16h

cmp     al, 1bh
je      stop_game 

mov     cur_dir, ah

no_key:

mov     ah, 00h
int     1ah
cmp     dx, wait_time
jb      check_for_key
add     dx, 4
mov     wait_time, dx

jmp     game_loop

stop_game:

mov     ah, 1
mov     ch, 0bh
mov     cl, 0bh
int     10h

ret

move_snake proc near

mov     ax, 40h
mov     es, ax

  mov   di, s_size * 2 - 2
  mov   cx, s_size-1
move_array:
  mov   ax, snake[di-2]
  mov   snake[di], ax
  sub   di, 2
  loop  move_array


cmp     cur_dir, left
  je    move_left
cmp     cur_dir, right
  je    move_right
cmp     cur_dir, up
  je    move_up
cmp     cur_dir, down
  je    move_down

jmp     stop_move


move_left:
  mov   al, b.snake[0]
  dec   al
  mov   b.snake[0], al
  cmp   al, -1
  jne   stop_move       
  mov   al, es:[4ah]
  dec   al
  mov   b.snake[0], al
  jmp   stop_move

move_right:
  mov   al, b.snake[0]
  inc   al
  mov   b.snake[0], al
  cmp   al, es:[4ah]   
  jb    stop_move
  mov   b.snake[0], 0 
  jmp   stop_move

move_up:
  mov   al, b.snake[1]
  dec   al
  mov   b.snake[1], al
  cmp   al, -1
  jne   stop_move
  mov   al, es:[84h] 
  mov   b.snake[1], al 
  jmp   stop_move

move_down:
  mov   al, b.snake[1]
  inc   al
  mov   b.snake[1], al
  cmp   al, es:[84h]    
  jbe   stop_move
  mov   b.snake[1], 0  
  jmp   stop_move

stop_move:
  ret
move_snake endp


