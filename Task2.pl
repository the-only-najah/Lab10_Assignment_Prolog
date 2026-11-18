% Najah - 9FS3

user(admin, 'admin123').
user(najah, 'secret456').
user(nasser, 'password789').

login :-
    write('=== System Login ==='), nl,
    login_loop(3).

login_loop(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.

login_loop(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (   user(Username, Password)
    ->  write('Login Successful'), nl
    ;   write('Login Unsuccessful'), nl,
        Remaining is Attempts - 1,
        ( Remaining > 0 ->
            format('Attempts remaining: ~w~n~n', [Remaining])
        ;   true
        ),
        login_loop(Remaining)
    ).
