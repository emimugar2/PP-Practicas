let split = function l ->
  (List.map fst l, List.map snd l);;

let combine l1 l2 =
  List.map2 (function a -> function b -> a,b) l1 l2;;

let length l = List.fold_left (fun a _ -> a + 1) 0 l;;

let append l1 l2= List.fold_right (function a -> function b -> a::b) l1 l2;;

let rev l = List.fold_left (fun a x -> x::a) [] l;;

let concat l = List.fold_right (function h -> function t -> h @ t)  l [];; 

let partition f l = 
  (List.filter f l),(List.filter (fun l -> if f l then false else true) l);; 

let remove_all a l = List.filter (fun x -> if x = a then false else true) l;;

let ldif l1 l2 = List.fold_right remove_all l1 l2;;

let lprod l1 l2 = List.concat (List.map ( fun a -> List.map(fun b -> (a,b)) l2)l1);;

let concat l = List.fold_right (function h -> function t -> h @ t) l [];;

let multicomp lf x = 
  List.fold_left (fun acc f -> f acc) x lf;;