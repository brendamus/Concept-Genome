# 🔢 JAC Sequence Guessing Game (The Next Number is X + 1)

This project contains a simple number guessing game implemented using **Jaseci Access Control (JAC)**. The objective is to guess the next number in a sequence where the rule is straightforward addition: **Current Number + 1**.

The code is organized into two separate files (`.jac` and `_impl.jac`) to adhere to best practices for defining specifications and implementations.

-----

## 🚀 How to Run the Game

### Prerequisites

1.  **JAC/Jaclang Installed:** Ensure the Jaseci package is installed in your Python environment (`pip install jaclang`).
2.  **Files in Directory:** Your terminal should be in the directory containing both `guess_next_number.jac` and `guess_next_number_impl.jac`.

### Execution Steps (Using the Jaseci Shell)

Since this game is interactive and stateful, the most reliable way to play is by using the Jaseci command-line tool.

1.  **Enter the Jaseci Shell:**
    Start the shell using Python's module execution command:

    ```bash
    python -m jaclang
    # You should now see the jsctl> prompt.
    ```

2.  **Load and Start the Game:**
    Build the implementation file. This executes the `with entry:__main__` block, spawns the game walker, and prints the initial number.

    ```jshell
    jac build guess_next_number_impl.jac
    ```

    You will see the initial game prompt and likely some harmless compiler warnings (`Ability has no body`).

3.  **Get the Walker ID:**
    List the active walkers and copy the ID (e.g., `urn:uuid:xxxxx...`) for the `SequenceGuessGame` walker.

    ```jshell
    walker list
    ```

4.  **Submit a Guess and Play:**
    Use the copied Walker ID (`W_ID_X`) to call the `process_guess` ability, supplying your guess.

      * **Example (If the current number is 7, the correct guess is 8):**

        ```jshell
        walker_run W_ID_X::process_guess guess=8
        ```

      * If correct, the game state advances, and you get the next number. Repeat this step with the same `W_ID_X` to continue the sequence.

-----

## 🧩 Project Structure

| File | Purpose | Notes |
| :--- | :--- | :--- |
| `guess_next_number.jac` | **Specification (Spec):** Defines the `SequenceGuessGame` walker, the `turn` node structure, and the `get_next_in_sequence` function signature. | |
| `guess_next_number_impl.jac` | **Implementation (Impl):** Contains the actual logic (`impl` blocks) for the walker's abilities (`start` and `process_guess`) and the game's starting block (`with entry:__main__`). | Uses `include guess_next_number;` to link the spec file. |
