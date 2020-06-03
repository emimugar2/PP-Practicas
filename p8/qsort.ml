open List;;

let crono f g x = 
  let t = Sys.time() in
    let _ = f g x in 
      Sys.time() -. t;;

let rec init = function i -> function f ->  
  let rec init_aux = (function (l,n,m)->
    if n > m then init_aux ((f m)::l,n,m +1) 
    else l)
  in init_aux ([],i,0);; 

(*###### EJERCICIO 1 ######*)


(* 
  qsort1 tendrá un mal rendimiento cuando la lista esta ordenada en el orden
  inverso a como se quiere ordenar. Ya que en cada iteración solo se va a 
  ordenar un elemento (h)
 *)

let rec qsort1 ord = function
  [] -> []
  | h::t -> let after, before = partition (ord h) t in
      qsort1 ord before @ h :: qsort1 ord after ;;
(*  
  qsort2 al ser terminal se puede hacer sobre listas con muchos elementos sin
  que haya desbordamiento del stack
*)

let l1 = init 300_000 (fun x-> Random.int 100_000);; 

(*
Con 30.000 elementos ordenados descendentemente los tiempos de ejecución son:
  qsort1: 61.018979s
  qsort2: 69.679609s
La penalización es de un 14.19%
 
*)

let rec qsort2 ord = function
  [] -> []
  | h::t -> let after, before = partition (ord h) t in
    rev_append ( rev (qsort2 ord before)) (h :: qsort2 ord after);;

let qsort3 ord l = 
  let rec sort_asc = function
    [] -> []
    | h::t -> let after,before = partition (ord h) t in
      rev_append (sort_des before) (h::(sort_asc after))
  and sort_des = function
    [] -> []
    | h::t -> let after,before = partition (ord h) t in
      rev_append (sort_asc after) (h::(sort_des before)) 
  in sort_asc l;;

(*
Con 30.000 elementos ordenados descendentemente los tiempos de ejecución son:
  qsort3: 50.11063s
  qsort2: 68.9382670000000246s
  qsort1: 61.6488809999999887

El cambio de rendimiento es:
  qsort3 sobre qsort2: 37.57% más rapido.
  qsort3 sobre qsort1: 23.0254 % más rapido.
 
*)