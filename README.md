# StationaryDistributions
Section 3 of a tentative book on theory and examples of Markov Chains
1.      The states of a Markov chain partition into equivalence classes
        according to their type:  communicating, periodic versus
        aperiodic, recurrent versus transient, or positive versus null
        recurrent.
1.      Every irreducible, aperiodic Markov chain has a unique        
        non-negative solution of
        \begin{align*}
            \sum\limits_{i} \pi_{i} P_{ij} &= \pi_{j} \\
            \sum\limits_{i} \pi_{i} &= 1 \\
        \end{align*}
        called a stationary distribution.
1.      For an irreducible and aperiodic Markov chain,
  1.            \[
                   \lim_{n \to \infty} (P^{n})_{ii} = \frac{1}{m_i} =
                    \pi_{ii}
                \] and
  
  1.             \[
                    \lim_{n \to \infty} (P^{n})_{ij} = \lim_{n \to
                    \infty} (P^ {n})_{ii} =\pi_{ij}.
                \]
