"Implementation for the Sequence Guessing Game"

include guess_next_number;

impl SequenceGuessGame.start {
    if not [root --> (`?turn)] {
        initial_number = random.randint(1, 10);
        next_number = get_next_in_sequence(initial_number);
        
        print(f"The current number in the sequence is: {initial_number}. What is the next number?");
        
        next = root ++> turn(
            current_number=initial_number, 
            correct_next_number=next_number
        );
    } else {
        next = [root --> (`?turn)];
        print(f"The current number in the sequence is: {next.current_number}. What is the next number?");
    }
    visit next;
}

impl SequenceGuessGame.process_guess {
    if self.guess == here.correct_next_number {
        print("🎉 Congratulations! You guessed the next number correctly.");
        
        new_current = here.correct_next_number;
        new_next = get_next_in_sequence(new_current);
        
        # Advance the game state by updating the existing node's properties
        here.current_number = new_current;
        here.correct_next_number = new_next;
        
        print(f"\nMoving to the next number. The current number is now: {new_current}. Guess the next number!");
        visit here;
        
    } else {
        print(give_hint(self.guess, here.correct_next_number));
        print(f"Try again! The number to follow is {here.current_number}.");
        visit here;
    }
}

with entry:__main__ {
    root spawn SequenceGuessGame(3);
    root spawn SequenceGuessGame(4);
    root spawn SequenceGuessGame(5);
    root spawn SequenceGuessGame(6);
}
