type 'a bin_tree = 
  Empty
  | Node of 'a * 'a bin_tree * 'a bin_tree;;

let rec breadth_first = function
    Empty -> []
  | Node (x, Empty, Empty) -> [x]
  | Node (x, Empty, d) -> x::(breadth_first d)
  | Node (x,i, Empty) -> x::(breadth_first i)
  | Node (x,Node(y,i1,d1),Node(z,i2,d2)) -> [x;y;z]@ breadth_first i1
     @ breadth_first d1 @ breadth_first i2 @ breadth_first d2;;

