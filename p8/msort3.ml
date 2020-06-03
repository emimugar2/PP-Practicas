let split_firsts n l =
    let n1 = (n+1) / 2 
    and n2 = n / 2 in 
  let rec cut i l = 
    if i > 0 then cut (i-1) (List.tl l) 
             else l in (n1, l, n2, cut n1 l);;

let rec merge_t ord l1 l2 =
  let rec aux acc = function
      [],l | l,[] -> List.rev_append acc l
    | h1::t1, h2::t2 ->
        if ord h1 h2 then aux (h1::acc) (t1, h2::t2)
        else aux (h2::acc) (h1::t1, t2)

  in
    aux [] (l1, l2)
  ;;

let rec msort2 ord l = let rec split_firsts = function n -> match n with
  0 -> l
  | _ -> let n1,l1,n2,l2 = split_firsts (n/2) in
         merge_t ord (msort2 ord l1) (msort2 ord l2)
  in split_firsts (List.length l) l;;