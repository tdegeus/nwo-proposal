# nwo-proposal

Proposal to NWO (Dutch Science Foundation)

## Overview

The NWO-layout for LaTeX is specified in `nwo.cls`. It depends on the logo `nwo.pdf` to be placed in the same folder. It is basically a customized article, and can be used in that way.

Specify the name of the proposal by specifying `\topic{...}` in the preamble.

```latex
%!TEX program = xelatex
\documentclass[verdana]{nwo}

\topic{...}

\begin{document}

...

\end{document}
```


