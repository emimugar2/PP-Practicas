(* Función Char.uppercase::> función que hace mayúscula una letra minúscula *)
let uppercase = function uppercase -> if ((char_of_int(uppercase:char) > 97) && (char_of_int(uppercase:char) < 122)) then char_of_int(int_of_char(uppercase:char)-32);;

(* Función Char.lowercase::> función que hace minúscula una letra mayúscula *)
let lowercase = function lowercase -> if ((char_of_int(x) > 65) && (char_of_int(x) < 90)) then char_of_int(int_of_char(x)+32);;
