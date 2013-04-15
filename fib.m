:- module fib.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module int.
:- func fib(int) = int.
:- import_module list, string.

fib(N) =
    ( if
        N =< 2
      then
        1
      else
        fib(N - 1) + fib(N - 2)
    ).

main(!IO) :-
    io.read_line_as_string(Result, !IO),
    (
       Result = eof,
       io.format("bye bye...\n", [], !IO)
    ;
       Result = ok(String),
       ( if string.to_int(string.strip(String), N)
         then io.format("fib(%d) = %d\n", [i(N), i(fib(N))], !IO)
         else io.format("that isn’t a number\n", [], !IO)
       ),
       main(!IO)
    ;
       Result = error(ErrorCode),
       io.format("%s\n", [s(io.error_message(ErrorCode))], !IO)
    ).
