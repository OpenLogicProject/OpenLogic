Custom LaTeX commands cheatsheet
=====================

Here is a list of the custom LaTeX commands used in the Open Logic Project. The configuration file `open-logic-config.sty` sets how they are rendered.

Special environments
-----

- `explain`: Any long and/or informal explanation that's useful for novice readers but could be left out
- `intro`: for comments and comparisions to other introductory texts, e.g., regarding terminology, conventions, or proof methods.
- `pedantic`: for pedantic comments which users may want to exclude.
- `digress`: for digressions
- `history`: for historical notes and remarks
- `reading`: for further reading
- `editorial`: for editorial remarks, warnings about missing parts, etc.
- `defish`: for definition-like material, e.g., rules
- `derivation`: for derivations, a tabular environment with three columns for line number, formula, and justification.

Added:
- `overview`: for an overview at the beginning of chapters

Cross referencing
----

- `olfileid`: associates three labels (part, chap and sec) to a file. Usage:
    - `\olfileid{ncl}{trv}{trb}`.
- `ollabel`: labelling a proposition, definition, therorem. Usage:
    - `\begin{prop}[Display name ] \ollabel{prop:label-name}`
- `olref`: referencing a proposition, def, theorem. Usage:
    - `\olref[pl][syn][smp]{prop:substitutionrules}`. Where `[pl][syn][smp]` are the parts, chapter and section identifiers that identify the file.

Tag system
-----

- `tagtrue`, `tagfalse`: declare or several tags and set their value. Usage:
    - `\tagtrue{prfTab}`
    - `\tagfalse{prfSC,prfND,prfAX}`
- `iftag`: if... else ... structure to generate alternative text depending on the value of a tag. Usage:
    - `\iftag{tagName}{text if true}{text if false}`: writes "text if true" if the tag is set to true, "text if false" otherwise.
    - `\iftag{tagNAme}{text if true}{}`.
    - `\iftag{tagName}{}{text if false}`.
- `tagitem`: if... else ... structure to display tags depending on the value of a tag. Replaces the ordinary `\item` command. Usage like `iftag`:
    - `\tagitem{tagName}{item text if true}{item if false}`



Logic names
------------

* Name of a logic `\Log`. Usage: 
    -`\Log S5` typesets S5 as the name of a system of logic. 
    -`\Entails[S5]`, `\Proves[S5]` will typeset S5 as in `\Log S5`.  

Truth-values
------

* Truth values. `\True`, `\False`.

Formulas
------

* Object language formulas `\Obj`. Formats letters as object-language variables. Usage `\Obj p_0` or `\Obj{p \land q}`.
* Atomic formulas in predicate logic `\Atom`. Typeset predicate-term combinations. Usage: 
    - `\Atom{P}{t_1}`. `\Atom{P}{a, b}`. `\Atom{P}{a,b,c}`.
    - redefine with `\makeatletter \DeclareDocumentCommand \Apply { m m }{ \mathord{#1}\@for\i:=#2\do{\i}} \makeatother` to get `Pabc`. Beware that doing so will also remove commas in function terms: `Paf(bc)c`.
* Propositional axioms. `\PAx` the set of propositional axioms.
* Propositional constants verum and falsum. `\ltrue`, `\lfalse`.
* Propositional connectives: `\lnot`, `\land`, `\lor`, `\lif`, `\liff`.
* Conditional: `\cif`. Strict conditional: `\strictif`.
* Quantifiers: `\lexists`, `\lforall`. Usage:
    - `\lexists` typesets the bare quantifier.
    - `\lexists[x]` typesets the quantifier with a variable.
    - `\lexists[x][Fx \lor Gx]` typesets the quantifier with a variable and a formula in its scope.
* Identity: `\eq`, negated `\eq/`. Usage:
    - `\eq` typesets the bare identity sign.
    - `\eq[x][y]` typesets the formula stating that `x` is identical to `y`.

Metavariables and substitutions
------------

* Formula metavariables. Upper case latin followed by an exclamation mark: `A!`, `B!`.
* Substitution. `\subst{t}{x}` 
* Term substitution within a formula or term. `Subst`. Usage:
    - `\Subst{!A}{t}{x}` typesets the substitution of term `t` for (free occurrences of) variable `x` in formula `!A`.
* Pre-substitution. `\pSubst`. Usage like `\Subst`.
* Simultaneous substitution. `\SSubst{A}{s}` (expects $s$ to be a list of `\subst{t}{x}` expressions, say).

Semantics
---------

* `\pAssign` a valuation of the atoms. Usage:
    - `\pAssign{v}`. valuation itself.
    - `\pAssign{v}{!A}`. valuation of a formula.
* `\pValue{v}` a valuation of all formulas. Usage: 
    - `\pValue{v}`. valuation itself.
    - `\pValue{v}(!A)`. valuation of a formula.
* Satisfaction or truth. `\Sat`, negated `\Sat/`. Usage:
    - `\Sat{M}{!A}` states that formula `!A` is satisfied in structure `M`.
    - `\Sat{M}{!A}[s]` states the same relative to assignment `s`.
* modal satisfaction. `\mSat`
* Semantic consequence.`\Entails`, negated `\Entails/`. Usage:
    - `\Entails` typesets the derivability sign.
    - `\Entails[L]` typesets derivability in logic `L`.


Proof systems
-------------

### Sequent proofs and natural deduction

* Sequent symbol. `\Sequent`
* Left and right rules. `\LeftR`, `RightR`. Usage:
    - `\LeftR{\land}` typesets a name or abbreviation of the left rule for conjunction.
* Introduction and elimination rules. `\Intro`, `\Elim`. Usage:
    - `\Intro{\land}` typesets a name or abbreviation of the introduction rule for conjunction.
* Common derivation rules: `\Weakening`, `\Contraction`, `\Exchange`, `\Cut`. 
* Absurdity rule, classical and intuitionnistic. `\FalseInt`, `\FalseCl`.
* Discharged assumption. `\Discharge`. Usage:
    - `\Discharge{!A}{n}` typesets the formula with a discharged assumption with label `n`.
* Inference discharging an assumption. `\DischargeRule`. Used in `prooftree` environments:
    - `\DischargeRule{Rule}{n}` typesets inference with name Rule and label `n`

### Proof terms in intuitionistic logic

* `\typeof`, `\andi`, `\ande`, `ori`, `\ore`, `falsee`

### Axiomatic derivations

* Modus ponens. `\MP`
* Quantifier rule. `\QR`
* Hypothesis. `\Hyp`

### Tableaux

* Signed (prefixed) formulas. `\sFmla`, `\pFmla`. Usage:
    - In running text, `\sFmla{\True}{!A}`.
    - In tableaux, `\pFmla{\False}{!A}`.
* Tableau rules. `\TRule`. Usage:
    - `\TRule{\True}{\land}` typesets the name of the rule for a true conjunction.
    - `\TRule{\True}{\land}[2]` adds the line number to which the rule is applied.
* Tableau assumption. `\TAss`.

Metalogic
---------

* Derivability. `\Proves`, negated `\Proves/`. Usage:
    - `\Proves` typesets the derivability sign.
    - `\Proves[L]` typesets derivability in logic `L`.
* Semantic consequence. `\Entails`, negated `\Entails/`. Usage: like `\Proves`.
* Theorems.`\Thms{X}`: theorems a set of formulas. ???
* Propositional axioms. `\PAx` the set of propositional axioms

Model-theoretic notions
------------

Choice of terminology
---------------

Terms like `sentence` can be customized (i.e., typeset as "sentence", "proposition", "closed formula" throughout). These are called *tokenized* in the Open Logic Project. Usage:

* `!!{formula}` typesets the term in singular.
* `!!{formula}s` typesets the term in plural.
* `!!^{formula}`, `!!^{formula}s` typeset the term in a sentence-initial position. 
* `!!a{formula}`, `!!^a{formula}` typesets with a suitable indefinite article ("a" or "an"). `\article{formula}` typesets the article on its own.

List of tokenized terms

* `language` (redefine for "signature", ...)
* `formula` (redefine for "wff", ...)
* `subformula`
* `sentence` (redefine for "closed formula", ...)
* `propositional variable` (redefine for sentence letter, ...)
* `variable` (redefine for "individual variable", "object variable", ...)
* `constant` (redefine for "individual constant",  ...)
* `predicate`  (defaults to "predicate symbol", redefine for "predicate")
* `function` (defaults to "function symbol", redefine for "function")
* `operator` (defaults to "logical operator")
* `main operator` (defaults to "main operator", redefine for "outermost operator")
* `free for` (redefine for "substitutable for" as in Enderton)
* `identity` (defaults to "identity predicate")
* `conditional`, `biconditional` (redefine for "implication" and "equivalence")
* `falsity` (names the falsity symbol, redefine for "absurdity", "falsum", ...)
* `truth` (names the truth symbol, redefine for "verum", "top", ...)
* `structure` name for first-order structures, redefine for "interpretation", "model"
* `valuation`: valuation of atoms (propositional logic)
* `domain`
* `value`: value (denotation) of a term
* `relational model`: for modal structures, redefine for "Kripke model"
* `derive`, `derivation`, `derivable`, `derivability`, `nonderivability`: derive in a calculus, proof
* `tableau`: tableau, redefine for "truth tree"
* `signed formula`: signed formula in a tableau
* `complete`: negation complete, syntactically complete (of theories) and syntactic completeness of a set of sentences
* `axiomatizable`, `axiomatized`, `axiomatizability`: effectively/recursively axiomatizable
* `represents`, `representable`
* `discharge`, `discharged`, `undischarged`: discharge in a natural deduction proof, redefine for "cancel", "close"
* `enumerable`, `nonenumerable`: redefine for "countable".
* `denumerable`: term for countably infinite. 
* `element`: of a set, redefine for "member".
* `injective`, `injection`: redefine for "one-one" and "one-one function"
* `surjective`, `surjection`: redefine for "onto" and "onto function"
* `bijective`, `bijection`: redefine for "one-one onto" and "one-one onto function" or "correspondence"*
* `decidable`
* `computably enumerable`, `c.e.`
* `argument` of a function???
* `parameter`
* `lambda define`, `lambda defined`, `lambda definable`



