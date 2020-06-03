let rec cod_as_bin gt = function
    Gt (x,[]) -> Node(x,Empty,Empty)
  | Gt (x,Gt(y,l)::t) -> Node(x,Node());;