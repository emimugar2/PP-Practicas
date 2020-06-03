(*###### EJERCICIO 2 ######*)

open List

let rec split = function
  [] -> [], []
  | h::[] -> [h],[]
  | h1::h2::t -> let t1,t2 = split t 
in (h1::t1, h2::t2);;

let rec merge ord l1 l2 = match l1,l2 with
  [],l | l,[] -> l1
  | h1::t1, h2::t2 -> if ord h1 h2 then h1::merge ord t1 l2
                      else h2::merge ord l1 t2;;

let rec msort1 ord l = match l with
  [] | _::[] -> l
  | _ -> let l1, l2 = split l in
         merge ord (msort1 ord l1) (msort1 ord l2);;

let rec split_t l= let rec aux acc1 acc2 = function
    [] -> (acc1, acc2)
  | h::[] -> (h::acc1, acc2)
  | h1::h2::t -> aux (h1::acc1) (h2::acc2) t
  in aux [] [] l;;

let rec merge_t ord l1 l2 =
  let rec aux acc = function
      [],l | l,[] -> rev_append acc l
    | h1::t1, h2::t2 ->
        if ord h1 h2 then aux (h1::acc) (t1, h2::t2)
        else aux (h2::acc) (h1::t1, t2)

  in
    aux [] (l1, l2)
  ;;

let rec msort2 ord l = match l with
  [] | _::[] -> l
  | _ -> let l1, l2 = split_t l in
         merge_t ord (msort2 ord l1) (msort2 ord l2);;

let l2 = [];;