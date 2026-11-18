# Cheatsheets

Examination cheatsheets that I used for some undergraduate courses at the University of Melbourne. The cheatsheets are written in [Typst](https://typst.app) and are double sided. Note that the content may differ across different years.

## Contents

| Course | Cheatsheet | Typst source | PDF |
| --- | --- | --- | --- |
| Calculus 2 | Midsemester | [`calculus_2/midterm_cheatsheet.typ`](calculus_2/midterm_cheatsheet.typ) | [`calculus_2/midterm_cheatsheet.pdf`](calculus_2/midterm_cheatsheet.pdf) |
| Calculus 2 | Exam | [`calculus_2/exam_cheatsheet.typ`](calculus_2/exam_cheatsheet.typ) | [`calculus_2/exam_cheatsheet.pdf`](calculus_2/exam_cheatsheet.pdf) |
| Linear Algebra | Exam | [`linear_algebra/exam_cheatsheet.typ`](linear_algebra/exam_cheatsheet.typ) | [`linear_algebra/exam_cheatsheet.pdf`](linear_algebra/exam_cheatsheet.pdf) |
| Data Analysis | Exam | [`data_analysis/exam_cheatsheet.typ`](data_analysis/exam_cheatsheet.typ) | [`data_analysis/exam_cheatsheet.pdf`](data_analysis/exam_cheatsheet.pdf) |

## Requirements

- [Typst](https://typst.app) 0.15 or newer (tested with 0.15.1).
- `make` (optional; using `typst compile` works too).
- The fonts referenced in `template.typ` (`CMU Serif`, `JetBrains Mono`/`Courier New`). Adjust the `fonts` in `template.typ`.

## Building

Using the Makefile from the repository root:

```sh
make                 # compile every .typ in the configured directories
make data_analysis   # compile only the Data Analysis cheatsheet(s)
make clean           # remove the generated PDFs
```

Or compile a single file directly:

```sh
typst compile --root . data_analysis/exam_cheatsheet.typ
```

`make` compiles every `.typ` directly inside the directories listed in `INPUT_DIRS` (`calculus_2`, `linear_algebra`, `data_analysis`).

## Citations and acknowledgements

- The Data Analysis cheatsheet is based on [Shervine Amidi's CME 106 Statistics cheatsheet](https://stanford.edu/~shervine/teaching/cme-106/cheatsheet-statistics/).
- [Evan Chen](https://web.evanchen.cc/)'s Typst template.
- Built with the Typst packages [`theorion`](https://typst.app/universe/package/theorion), [`physica`](https://typst.app/universe/package/physica), and [`tdtr`](https://typst.app/universe/package/tdtr).