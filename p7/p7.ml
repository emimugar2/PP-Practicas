
let rec suml l = let rec aux acc = function 
    [] -> acc
    |h::t -> aux (acc + h) t
  in aux 0 l;;

let rec maxl = function
  [] -> raise (Failure "maxl")
  |h::t -> let rec aux maxim = (function
           [] -> maxim
           | h::t -> aux (max h maxim) t)
           in aux h t;;

let rec to0from n = let rec aux m l =
    if m <= n then aux (m+1) (m::l)
    else l 
  in aux 0 [];;

let rec fromto m n = let rec aux a l =
    if a >= m then aux (a-1) (a::l)
    else l 
  in aux n [];;

let rec from1to n = let rec aux a l =
    if a >= 1 then aux (a-1) (a::l)
    else l
  in aux n [];;

let rec append l1 l2 =
  let rec aux a = function
    [] -> a
    | h::t -> aux (List.rev(h::(List.rev a))) t   
  in aux l1 l2;;

let rec map f l = let rec aux acc = function
     [] -> List.rev acc
    |h::t -> aux (f h::acc) t
  in aux [] l;; 

let power x y =
  let rec innerpower acc x y = 
    if y = 0 then acc
    else innerpower (acc * x) x (y-1)
  in 
    if y >= 0 then innerpower 1 x y
    else invalid_arg "power";;

let rec incseg l = let rec aux acc n= function
    [] -> List.rev acc
    | h::t -> if acc = [] then aux [h] h t
              else aux ((h+n)::acc) h t 
  in aux [] 0 l;;

let rec insert x l = let rec aux acc = function
    [] -> List.rev (x::acc)
    | h::t -> if x<= h then List.rev_append acc (x::t)
              else aux (h::acc) t 
  in aux [] l;;

let rec insert_gen f x l = let rec aux acc = function
    [] -> List.rev_append acc [x]
    | h::t -> if f x h then List.rev_append acc (x::t)
              else aux (h::acc) t 
  in aux [] l;;

let rec remove x l = let rec aux acc = function
    [] -> l
    |h::t -> if x = h then List.rev_append acc t
             else aux (h::acc) t 
  in aux [] l ;;