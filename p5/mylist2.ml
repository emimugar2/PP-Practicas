(* Parte 1 *)
open List

let hd = function 
	| h::_ -> h
	| [] -> raise (Failure "hd ");;

let tl = function  
	| h::[] -> []
	| _::t -> t
	| [] -> raise(Failure"td");;

let length = function a ->
	let rec length_aux = function 
		| [],i -> i
		| h::t,i -> length_aux (t,i+1)
	in length_aux (a,0);;

(* let compare_lengths = function a -> function b ->
	if length a > length b then 1
	else if length a < length b then -1
	else 0;;

let rec compare_lengths = function
	[] -> (function [] -> 0 |l->-1)
	| _::t1 -> (function [] -> 1 | _::t2 -> compare_lengths t1 t2);; *)

let rec compare_lengths l1 l2 = match (l1,l2) with 
	[],[] -> 0
	| [],_ -> -1
	| _,[] -> 1
	| _::t1,_::t2 -> compare_lengths t1 t2;;

let nth l n = 
	if n<0 then raise(Invalid_argument "mynth")
	else let rec aux = function 
		[],_ -> raise (Failure "nth")
		| h::_,0 -> h
		| _::t,i -> aux (t,i -1)
		in aux (l,n);;

let rec append l1 l2 =
  let rec aux a = function
    [] -> a
    | h::t -> aux (List.rev(h::(List.rev a))) t   
  in aux l1 l2;;


(* Parte 2 *)

let rec init = function i -> function f ->  
	if i < 0 then raise(Invalid_argument "myinit") else
	let rec init_aux = (function (l,n,m)->
		if n > m then init_aux ((f m)::l,n,m +1) 
		else l)
	in init_aux ([],i,0);; 


		
let rec rev l =
	let rec aux i = function
	| [] -> i
	| h::t -> aux(h::i) t in 
	aux [] l;;

let rec rev_append l1 l2 = match l1 with
	[] -> l2
	| h::t -> rev_append t (h :: l2);;

let rec concat li = let rec aux l acc = match l with
     [] -> acc
    | h::t -> aux t (List.append acc h) 
  in aux li [];;

let rec flatten = concat;;
  
let rec map f l = let rec aux acc = function
     [] -> acc
    |h::t -> aux (f h :: acc) t
  in aux [] l;; 

let rec rev_map = function f -> function l ->
	let revL = rev l in 
	map f revL;;


let rec map2 f l1 l2 = let rec aux a b acc =
  match a,b with
    [],[] -> acc
    |h1::t1,h2::t2 -> aux t1 t2 (List.rev((f h1 h2)::List.rev acc))
    | _ -> raise(Invalid_argument "mymap2")
  in aux l1 l2 [];;

let rec fold_left f i l = match l with 
	| [] -> i
	| h::l -> fold_left f (f i h) l;;

let rec fold_right f l i = match l with 
	| [] -> i
	| h::l -> f h (fold_right f l i);;



(* Parte 3 *)

let rec find f = function
	 [] -> raise(Not_found)
	| h::t -> if f h then h else find f t;; 

let rec for_all f = function
	| [] -> true
	| h::t -> f h && for_all f t;;

let rec exists f = function
	| [] -> false
	| h::t -> f h || exists f t;;

let rec mem n = function
	| [] -> false
	| h::t -> compare h n = 0 || mem n t;;

let rec filter f = 
	let rec aux i = function
	| [] -> rev i
	| h::t -> if f h then aux (h::i) t else aux i t 
	in aux [];;

let rec find_all = filter;;

let rec partition f = function 
	[] -> [],[]
	| h::t -> let (l1,l2) = partition f t in
		if f h then (h::l1,l2)
		else (l1,h::l2);;

let rec split = function 
	| [] -> [],[]
	| (a,b) :: l -> let l1,l2 = split l in (a::l1,b::l2);;

let rec combine l1 l2 = 
  let rec aux a b acc = match (a,b) with
    [],[] -> List.rev acc
    |h1::t1,h2::t2 -> aux t1 t2 ((h1,h2)::acc)
    | _ -> raise(Invalid_argument "mycombine")
  in aux l1 l2 [];;