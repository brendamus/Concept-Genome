"A Sequence Guessing Game Specification"

import random;

def give_hint(guess: int, correct_next_number: int) -> str {
    if guess < correct_next_number {
        return "That's too low! Aim higher for the next number in the sequence.";
    } else {
        return "That's too high! Try aiming a little lower.";
    }
}

def get_next_in_sequence(current_number: int) -> int {
    return current_number + 1;
}

walker SequenceGuessGame {
    has guess: int;

    can start with `root entry;
    can process_guess with turn entry;
}

node turn {
    has current_number: int; 
    has correct_next_number: int;
}
