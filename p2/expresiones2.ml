(*Emilio Martínez Varela*)
(*emilio.martinez.varela@udc.es*)
let x = 1;;
(* var int x *)

let y = 2;;
(* var int y *)

x - y;;
(*-1*)

let x = y in x - y;;
(* 0, la función "in" cambia el valor de la variable solo en esa expresión *)

x - y;;
(*-1*)

(*z;;*)
(* ERROR *:Error: Unbound value z*)

let z = x + y;;
(* val z = 3 *)

z;;
(* 3 *)

let x = 5;;
(* val x = 5 *)

z;;
(* 3 *)

let y = 5 in x + y;;
(* 10 *)

x + y;;
(* 7 *)

let p = 2,5;;
(* (2, 5) *)

snd p, fst p;;
(* (5,2) *)

p;;
(* 2, 5 *)

let p = 0,1 in snd p, fst p;;
(*1, 0*)

p;;
(*2, 5*)

let x,y = p;;
(* x = 2 , y = 5 *)

let z = x + y;;
(* val z = 7 *)

let x,y = p,x;;
(* val x =(2, 5) tipos, val y = 2*)

let x = let x,y = 2,3 in x * x + y;;
(*7*)

x + y;;
(* 9 *)

z;;
(* 7 *)

let x = x + y in let y = x * y in x + y + z;;
(* 34 *)

x + y + z;;
(* 16 *)

int_of_float;;
(* fun *)

float_of_int;;
(* fun *)

int_of_char;;
(* fun *)

char_of_int;;
(* fun *)

char_of_int;;
(* fun *)

abs;;
(* fun *)

sqrt;;
(* fun *)

truncate;;
(* float->int fun *)

ceil;;
(* float->float fun *)

floor;;
(* float->float fun *)

Char.code;;
(* char->int fun *)

String.length;;
(* string->length *)

fst;;
(* a*b fun *)

snd;;
(* a*b fun *)

let f = function x -> 2 * x;;
(* int->int fun *)

f (2 + 1);;
(* 6 *)

f 2 + 1;;
(* 5 *)

let n = 10;;
(* 10 *)

let sum = function n -> function x -> n + x;;
(* sum = int->int->int fun*)

sum 5;;
(* int->int fun *)

sum 1 2;;
(* 3 *)

let n = 1;;
(* val = 1 *)

sum n 10;;
(* 11 *)

let sumn = sum n;;
(* int->int fun *)

sumn 100;;
(* 101 *)

let n = 1000;;
(* 1000 *)

sumn 100;;
(* 101 *)








