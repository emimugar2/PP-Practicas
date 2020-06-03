open Bintree

let bintree1 = Node(5,Empty,Node(4,Node(3,Empty,Empty),Empty));;
let bintree2 = Node(5,Node(4,Node(3,Empty,Empty),Node(3,Empty,Empty)),Node(4,Node(3,Empty,Empty),Node(3,Empty,Empty)));;

(* No da lo que tiene que dar*)
let rec strict = function
    Empty -> false
  | Node(_,Empty,Empty) -> true
  | Node(_,i,d) -> (strict i) && (strict d);;


let rec perfect = function
  Node(_,Empty,_) -> false
 
let rec 