# Deakin LaTeX Assessment Task Template (SIT Subjects)

>A prebuilt LaTeX template for writing assessment tasks in Deakin School of IT (SIT) units. Designed for clarity, consistency, and ease of use.

## Features

- **Prebuilt for Deakin SIT**: Ready to use for assignments, reports, and assessment tasks in Deakin's School of IT.
- **Theorem & Proof Environments**: Custom environments for theorems, proofs, lemmas, corollaries, and more perfect for mathematical writing.
- **Clean Structure**: Modular file organisation for easy editing and expansion.
- **VS Code Integration**: `.vscode` folder includes recommended extensions and build tasks for smooth LaTeX compilation and formatting.
- **Bibliography Support**: Set up for BibTeX referencing.
- **Custom Class File**: `style.cls` for Deakin-specific formatting and styling.
- **GNU Licence**: Open-source under the GNU General Public Licence (see `LICENSE`).

## Getting Started

1. **Clone the repository:**

   ```zsh
   git clone https://github.com/breezy-codes/deakin-latex-task-template-sit.git
   ```

2. **Open in VS Code:**
   - Recommended: Install [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) and [LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities).

3. **Build the PDF:**
   - Use the provided VS Code tasks or run `latexmk` in the terminal:

     ```zsh
     latexmk -pdf 00_main.tex
     ```

4. **Start writing:**
   - Main file: `00_main.tex`
   - Add sections in `01-file.tex` or create new files as needed.

## Theorem & Proof Environments

This template includes custom environments for:

- `theorem`, `lemma`, `corollary`, `definition`, `remark`, `proof`

Example:

```latex
\begin{theorem}
Let $x$ be a real number. Then $x^2 \geq 0$.
\end{theorem}

\begin{proof}
By definition, $x^2 = x \times x$. For any real $x$, this is non-negative.
\end{proof}
```

## File Structure

```txt
├── 00_main.tex          # Main LaTeX file
├── 01-file.tex          # Example section file
├── style.cls            # Custom Deakin SIT class
├── reportreferences.bib # BibTeX references
├── .vscode/             # VS Code settings & tasks
├── latex-bin/           # Build artefacts
├── LICENSE              # GNU General Public Licence
└── README.md            # This file
```

## Customisation

- Edit `style.cls` to change formatting or add new environments.
- Add new `.tex` files for sections/chapters and include them in `00_main.tex`.
- Update `reportreferences.bib` for your bibliography.

## Licence

This project is licensed under the GNU General Public Licence. See `LICENSE` for details.

## Contributing

Pull requests and suggestions are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

**Created by breezy-codes for Deakin SIT students.**
