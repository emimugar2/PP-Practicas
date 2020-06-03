();;
(*unit=()*)

2 + 5 * 3;;
(*int=17*)

1.0;;
(*float=1.*)

(*1.0 * 2;;*)
(*ERROR* Error: This expression has type float but an expression was expected of type int* Para corregirla->*) 1 * 2;;

(*2 - 2.0;;*)
(*ERROR* Error: This expression has type float but an expression was expected of type int* Para corregirla->*) 2 - 2;;

(*3.0 + 2.0;;*)
(*ERROR* Error: This expression has type float but an expression was expected of type int* Para corregirla->*) 3 + 2;;

5 / 3;;
(*1.66* int=1, ocaml solo comprende enteros*)

5 mod 3;;
(*int = 2*)

3.0 *. 2.0 ** 3.0;;
(*24*El primer punto indica que es flotante y los "**" significa elevado*)

3.0 = float_of_int 3;;
(*true*)

(*sqrt 4;;*)
(*2*Error: This expression has type int but an expression was expected of type float* Para corregirlo->*)  sqrt 4.0;;

int_of_float 2.1 + int_of_float (-2.9);;
(*0*Solo toma la parte entera*)

truncate 2.1 + truncate (-2.9);;
(*0*)

floor 2.1 +. floor (-2.9);;
(*-1*)

(*ceil 2.1 +. ceil -2.9;;*)
(*-0.8*Error: This expression hs type float -> float
       but an expression was expected of type float * Float=1, redondea en positivo*Para corregirlo->*)  ceil 2.1 +. (ceil -2.9);;

'B';;
(*char=B*)

int_of_char 'A';;
(*65[ascii code]*)

char_of_int 66;;
(*'B'*)

Char.code 'B';;
(*66*)

Char.chr 67;;
(*'C'*)

'\067';;
(*'C'*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'Ñ');;
(*ERROR Ñ*Warning 3: deprecated feature: ISO-Latin1 characters in identifiers
Error: Syntax error: operator expected.*Para arreglarlo -> cambiar configuración de terminal*)

Char.uppercase 'ñ';;
(*Error ñ*Warning 3: deprecated feature: ISO-Latin1 characters in identifiers
Error: Syntax error* Para arreglarlo ->cambiar codificación del terminal*)

Char.lowercase 'O';
(*'o'*)

"this is a string";;
(*"this is a string"*)

String.length "longitud";;
(*8* longitud cadena*)

(*"1999" + "1";;*)
(*ERROR*Error: This expression has type string but an expression was expected of type int* Para arreglarlo->*) 1999 + 1;;

"1999" ^ "1";;
(*str="19991"*)

int_of_string "1999" + 1;;
(*2000*)

"\064\065";;
(*@A*)

string_of_int 010;;
(*str=10*)

not true;;
(*false*)

true && false;;
(*false*)

true || false;;
(*true*)

1 < 2 = false;;
(*false*)

"1" < "2";;
(*false* iguales*)

2 < 12;;
(*true*)

"2" < "12";;
(*false*, orden numérico*)

"uno" < "dos";;
(*false*)

2,5;;
(*ERROR*int*int (2,5), array*)

"hola", "adios";;
(*str * str ("hola", "adios")*)

0, 0.0;;
(*int * float = (0 , 0.0)*)

fst('a',0);;(*solo válida en pares*)
(*'a'*)

snd(false, true);;(*solo válida en pares*)
(*true*)

(1,2,3);;
(*int*int*int(1,2,3)*)

((1,2),3);;
(*(int*int)*int ((1,2),3)*)

fst((1,2),3);;
(*(1,2)*)

if 3 = 4 then 0 else 4;;
(*int = 4*)

if 3 = 4 then "0" else "4";;
(*"4"*)

(*if 3 = 4 then 0 else "4";;*)
(*ERROR*Error: This expression has type string but an expression was expected of type int* Para corregirlo->*) if 3 = 4 then 0 else 4;;

(if 3 < 5 then 8 else 10) + 4;;
(*12*)

2.0 *. asin 1.0;;
(*float = 3.14159265358979312*)

sin (2.0*.asin 1.0 /. 2.);;
(*float = 1.*)

function x -> 2 * x;;
(*int -> int = <fun>*)

(function x -> 2 * x) (2 + 1);;
(*int = 6*)

function (x,y) -> 2 * x + y;;
(*int * int -> int = <fun>*)

(function (x,y) -> 2 * x + y) (1 + 2, 3);;
(*int = 9*)














