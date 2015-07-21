# tikz optics

The aim of this tikz library is to easily draw optical setups with tikz. It provides shapes for lens, mirror, etc. The geometrically (in)correct computation of light rays through the setup is left to the user.

# Quick start
## Setup

The tikz library is contained in the file `tikzlibraryoptics.code.tex`. This file should be copied wherever TeX can find it, for example in your `TEXMF` folder. 
The library can then be loaded through the command `\usetikzlibrary{optics}` in any tex file.

Alternatively, you can directly `\input` it in your tex file.

## Usage

Use the option `use optics` on a `tikzpicture` to enable the library. Here is a very simple example of code
```
\begin{tikzpicture}[use optics]
	\node[lens] at (0,0) {};
	\node[mirror] at (1cm,0) {};
\end{tikzpicture}
```
For more details, please see the documentation.
