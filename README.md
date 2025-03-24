# ElvenAutomata
# Evidence 1 - Implementation of lexical analysis

**DISCLAIMER** 
I used IA to translate this text, also for consulting.

For this project, I chose Elven, also referred to as the "Elven tongue," as the language to focus on. This fictional language, created by J.R.R. Tolkien, is one of the most iconic elements of his Middle-earth universe. According to the Forgotten Realms Wiki, Elven is known for its fluidity, elegance, and vast vocabulary, making it ideal for artistic expression through poetry and song. Its grammar and phonetic structure make it an intriguing language to work with, especially in linguistic and technical contexts.
I decided to model the following words:

- Aaye or Aiya - Quenya word for the verb 'Hail'.
- Ada - 'Father', spoken by Arwen to Lord Elrond
- Adan - 'Father of Man' (Sindarin, from the Quenya Atan, Atani) The Elves' name for those Men who first crossed the Blue Mountains (Ered Luin) during the First Age. Plural is Edain
- Aelin - 'lake, pool' as in Aelin-uial.
- Adanedhel - 'elf-man'.

To model these words, I relied on finite automata, a crucial tool in formal language theory that recognizes specific patterns. In his book Introduction to the Theory of Computation (2012), Michael Sipser describes deterministic finite automata (DFA) as a mathematical model where each input leads to exactly one state. This makes DFAs clear, direct, and easier to implement compared to their nondeterministic counterparts (NFAs), which can have multiple potential states for a single input and even allow for transitions without input.
For this project, I opted for a DFA because I wanted to ensure that only these six words are accepted as valid, excluding all others. Each word follows its own unique path through the automaton, eliminating any possibility of ambiguity. A DFA's straightforward design perfectly suits my analysis of this language and these specific words, making it the ideal choice for my project.

# Model
For this scenario I created an automaton that works witch 6 different words, it's important to mention that the automaton will work only with the next alphabet:
∑ = a,y,e,i,d,n,l.

![Editor _ Mermaid Chart-2025-03-24-201637](https://github.com/user-attachments/assets/8dce0db2-81ba-4323-b4c2-8ce9d03b63f1)

The regular expression would be: 
(^A)((iya)|(aye)|(elin)(ada(n|nedhel)))

### Brief explanation of the code and its main functions:

1. **`move/3`:** Defines the transitions between states in the automaton. For example, `move(a, b, a)` means that from state `a`, it transitions to state `b` when receiving the input `a`.

2. **`accepting_state/1`:** Specifies the final states accepted by the automaton. In this case, the only accepted state is `z`.

3. **`go_over_automaton/1`:** This is the main function, which starts checking a list of symbols, beginning at the initial state (`a`).

4. **`automatonCheck/2`:**  
   - **Base case:** When the list of symbols is empty, it checks whether the current state is an accepted state.  
   - **Recursive case:** While there are symbols left to process, it verifies if the current state transitions to the next state using the corresponding symbol and continues processing the list.

5. **Specific test cases:** Predicates like `aaye`, `aiya`, etc., test predefined words. Each one checks if a specific word (e.g., `[a, a, y, e]`) is accepted or rejected by the automaton.

---

### How to test a word not defined in the code:

To test a word not included in the predefined test cases, you can directly call the `go_over_automaton/1` function with the list of symbols that make up the word. For example:

```prolog
?- go_over_automaton([h, e, l, l, o]).
```

This will verify if the word "hello" is accepted by the automaton. If the word does not match any of the routes defined in `move/3`, the result will be `false`, indicating that the word is not valid according to the automaton's rules.
