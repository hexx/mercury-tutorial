:- module rot13.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module char, list, string.

main(!IO) :-
    io.read_char(Result, !IO),
    (
      Result = ok(Char),
      io.write_char(rot13(Char), !IO),
      main(!IO)
    ;
      Result = eof
    ;
      Result = error(ErrorCode),
      io.format("%s\n", [s(io.error_message(ErrorCode))], !IO)
    ).

:- func rot13(char) = char.

rot13(CharIn) = ( if rot13_2(CharIn, CharOut) then CharOut else CharIn ).

:- pred rot13_2(char::in, char::out) is semidet.

rot13_2(V1, V2) :- ( V1 = 'a' , V2 = 'n'
                   ; V1 = 'b' , V2 = 'o'
                   ; V1 = 'c' , V2 = 'p'
                   ; V1 = 'd' , V2 = 'q'
                   ; V1 = 'e' , V2 = 'r'
                   ; V1 = 'f' , V2 = 's'
                   ; V1 = 'g' , V2 = 't'
                   ; V1 = 'h' , V2 = 'u'
                   ; V1 = 'i' , V2 = 'v'
                   ; V1 = 'j' , V2 = 'w'
                   ; V1 = 'k' , V2 = 'x'
                   ; V1 = 'l' , V2 = 'y'
                   ; V1 = 'm' , V2 = 'z'
                   ; V1 = 'n' , V2 = 'a'
                   ; V1 = 'o' , V2 = 'b'
                   ; V1 = 'p' , V2 = 'c'
                   ; V1 = 'q' , V2 = 'd'
                   ; V1 = 'r' , V2 = 'e'
                   ; V1 = 's' , V2 = 'f'
                   ; V1 = 't' , V2 = 'g'
                   ; V1 = 'u' , V2 = 'h'
                   ; V1 = 'v' , V2 = 'i'
                   ; V1 = 'w' , V2 = 'j'
                   ; V1 = 'x' , V2 = 'k'
                   ; V1 = 'y' , V2 = 'l'
                   ; V1 = 'z' , V2 = 'm'
                   ; V1 = 'A' , V2 = 'N'
                   ; V1 = 'B' , V2 = 'O'
                   ; V1 = 'C' , V2 = 'P'
                   ; V1 = 'D' , V2 = 'Q'
                   ; V1 = 'E' , V2 = 'R'
                   ; V1 = 'F' , V2 = 'S'
                   ; V1 = 'G' , V2 = 'T'
                   ; V1 = 'H' , V2 = 'U'
                   ; V1 = 'I' , V2 = 'V'
                   ; V1 = 'J' , V2 = 'W'
                   ; V1 = 'K' , V2 = 'X'
                   ; V1 = 'L' , V2 = 'Y'
                   ; V1 = 'M' , V2 = 'Z'
                   ; V1 = 'N' , V2 = 'A'
                   ; V1 = 'O' , V2 = 'B'
                   ; V1 = 'P' , V2 = 'C'
                   ; V1 = 'Q' , V2 = 'D'
                   ; V1 = 'R' , V2 = 'E'
                   ; V1 = 'S' , V2 = 'F'
                   ; V1 = 'T' , V2 = 'G'
                   ; V1 = 'U' , V2 = 'H'
                   ; V1 = 'V' , V2 = 'I'
                   ; V1 = 'W' , V2 = 'J'
                   ; V1 = 'X' , V2 = 'K'
                   ; V1 = 'Y' , V2 = 'L'
                   ; V1 = 'Z' , V2 = 'M' ).
