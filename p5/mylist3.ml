let remove x l =
  let rec aux acc = function
    [] -> l
    |h::t -> if x = h then List.rev_append acc t
             else aux (h::acc) t
  in aux [] l;;

(* 
	Versión remove no terminal
let rec remove x = function
  [] -> []
  | h::t -> if x=h
            then t
            else h::(remove x t);;
*)

let remove_all a l = List.filter (fun x -> if x = a then false else true) l;;

let ldif l1 l2 = List.fold_right remove_all l1 l2;; 

(* Da un tipo de ('a list -> 'b list -> 'c) -> 'a list -> 'c en vez de 'a list -> 'b list ->
   ('a * 'b ) list
*)
let lprod l1 l2 = List.concat (List.map ( fun a -> List.map(fun b -> (a,b)) l2)l1);;


(*
Da tipo val divide : ('a list -> 'b list -> int -> 'c) -> 'c = <fun>
*)

let rec divide = function 
  [] -> [],[]
  | h:: [] -> [h],[]
  | h1::h2::t -> let l1,l2 = divide t
                 in h1::l1,h2::l2;;