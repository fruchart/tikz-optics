# tikz optics

The tikz library optics is designed to easily draw optical setups with tikz. It provides shapes for lens, mirror, etc. The geometrically (in)correct computation of light rays through the setup is left to the user.

# Quick start
## Setup

The tikz library is contained in the file `tikzlibraryoptics.code.tex`. This file should be copied wherever TeX can find it, for example in your `TEXMF` folder. To do so, it is convenient to use the TDS-structured zip file `tikz-optics.tds.zip` found [on the releases page](https://github.com/fruchart/tikz-optics/releases).
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
which produces

![lens and mirror](http://fruchart.github.io/tikz-optics/media/example-lens-mirror.png)

It is easy to draw slightly more complicated setups, e.g.

![QI, AC, hole, lens, screen](http://fruchart.github.io/tikz-optics/media/example-QI-hole-lens-screen.png)

For more details, please see the [documentation](https://github.com/fruchart/tikz-optics/raw/master/doc/tikz-optics.pdf).
