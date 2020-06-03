(*Emilio Martínez Varela*)
(*emilio.martinez.varela@udc.es*)

(*Función hd*)
let hd = function
	[] -> raise (Failure "hd")
	|(h :: _) -> h;;
	
(*Función tl*)
let tl = function
	[] -> raise (Failure "tl")
	|(_ :: t) -> t;;
	
(*Función length*)
let rec length = function
		[] -> 0
		| _ :: t -> 1 + length t;;
		
(*Función nth// nos dá el elemento en la nth posición de la lista*)
let rec nth l n = 
		if (n>length l) then 
			raise(Failure "nth")
			else if (n < 0) then 
				raise (Failure "List.nth")
					else match (l,n) with
					[], _ -> raise (Failure "List.nth")
					|h :: _,0 -> h
					| _ :: t,n -> nth t (n-1);;
					
(*Función append*)
let rec append = function
	[] -> (function l -> l)  (*Los paréntesis indican que la función ya acabó*)
	|h :: t -> (function l -> h:: append t l);;
	
(*Función rev_append*)
let rec rev_append l1 l2 = match l1 with
	[] -> l2
	|h::t -> rev_append t (h::l2);; 
	
(* Otra forma*)
let rec append l1 l2 =
	match l1 with
		[] -> l2
		|h :: t -> h :: append t l2;;
		
(*Función reverse*)
let rec rev = function
	[] -> []
	|h :: t -> append (rev t) [h];;   (*Los corchetes indican que el elemento es una lista que solo contiene a h*)
	
(*Función concat*)
let rec concat = function
		[] -> []
		|h :: t -> append h (concat t);;
		
(*Función flatten*)
let rec flatten = function
		[] -> []
		|h :: t -> append h (flatten t);;
		
(*Función map*)
let rec map f = function
		[] -> []
		|h :: t -> (f h) :: (map f t);;
		
(*Función map2*)
let rec map2 f l l1 = match (f,l,l1) with
		f,[],[]->[]
		|f,h::t,[]->raise (Failure "Invalid_Argument")
		|f,[],h::t->raise (Failure "Invalid_Argument")
		|f,h::t,h1::t1->(f h h1) :: (map2 f t t1);;
		
(*Función fold_left*)
let rec fold_left f a = function
		[] -> a
		|h :: t -> fold_left f (f a h) t;;
		
(*Función fold_right*)
let rec fold_right f l b = match l with
		[] -> b
		|h :: t -> f h (fold_right f t b);; 
		
(*Función find*)
let rec find f l = match (f,l) with
				f,[] -> raise (Failure "Not_found")
				|f,h::t ->if (f h = true) then h else find f t;; 
				
(*Function for_all*)
let rec for_all p l = match (p,l) with
	p,[] -> true
	|p,h::t -> if p h = false then false else for_all p t;;
	
(*Function exists*)
let rec exists e l = match (e,l) with
	e,[] -> false
	|e,h::t -> if e h = true then true else exists e t;;
	
(*Función mem*)
let rec mem a l = match (a,l) with
	a,[]->false
	|a,h::t->if a=h then true else mem a t;;
	
(*Function filter*)
let filter f l =
	let rec aux acc = function
		[] -> acc
		|h::t -> if f h = true then aux(h::acc) t else aux(acc) t
	in
		aux [] (rev l);;
		
(*Función find_all*)
let rec find_all p l = match (p,l) with
	p,[]->[]
	|p,h::t -> if p h = true then h::find_all p t else find_all p t;;
	
(*Function partition*)
let rec partition p = function
	[] -> ([],[])
	|h::t -> let (si,no) = partition p t in
				if p h then (h::si,no)
				else (si, h::no);;	


		
(*Function Compare_lengths*)
let rec compare_lengths lista1 lista2 = match (lista1,lista2) with
([],[]) -> 0
|([],_) -> -1
|(_,[]) -> 1
|(_::t1,_::t2) -> compare_lengths t1 t2;;

(*Function Init*)
let rec init l fu =
 if l = 0 then[]
else  (init (l-1) fu) @ [fu(l-1)];;

(*Function Split*)
let split lista = let rec split lista lista1 lista2 = match lista with
[] -> (rev lista1, rev lista2)
|(x,y)::t -> split t (x::lista1) (y::lista2) in split lista [] [];;

(*Function Combine*)
let rec combine lista1 lista2 = match (lista1, lista2) with
([],[]) -> []
|(h1::t1,h2::t2)->(h1,h2)::combine t1 t2
|(_,_) -> raise(Invalid_argument "combine");;	

				



