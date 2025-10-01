"""A Sequence Guessing Game Specification"""

import random;
# NOTE: LLM imports commented out for stability
# import from byllm.llm { Model }
# glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide a fun hint if guess is incorrect"""
def give_hint(guess: int, correct_next_number: int) -> str {
    if guess < correct_next_number {
        return "That's too low! Aim higher for the next number in the sequence.";
    } else {
        return "That's too high! Try aiming a little lower.";
    }
}

# Define the simple sequence logic
def get_next_in_sequence(current_number: int) -> int {
    return current_number + 1;
}

# Walker declaration (SequenceGuessGame is defined here)
walker SequenceGuessGame {
    has guess: int;

    can start with `root entry;
    can process_guess with turn entry;
}

# Node declaration
node turn {
    has current_number: int; 
    has correct_next_number: int;
}