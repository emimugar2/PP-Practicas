(* Tan solo existe una función con esos tipos*)

(* a -> a *)
let f  x = x;;

(* a -> a * a *)
let g  x = x,x;;

(* a * b -> a *)
let h (x,y) = x;;

(* a * b -> b *)
let i (x,y) = y;;

(* a * b -> a list *)
let j x = x::[];;

(* a -> b *)
let l = function x -> raise(Division_by_zero)::[];;

(* a -> b list *)
let k = function x -> raise(Division_by_zero);;


(* Tienen en común que se usa la función raise que es de tipo exn->a'
que nos permite pasar de un tipo fijo a un tipo polimórfico.
Además se pueden crear infinitas funciones de este tipo ya que, aunque el numero de excepciones es finito podemos crear las nuestras propias.
 *)

(* La función sería de la siguiente manera:
let fun_123_ab f = (f [1;2;3]) + (f ['a';'b']);;
Un tipo alfa no significa "cualquier tipo", mas bien es un tipo de variable
que se debe considerar en un contexto. Por ello esa función da error de tipo, ya que al "instanciarse" en f [1;2;3] pasaria a ser una función de f en int->int y no permite hacer f ['a';'b']
*)