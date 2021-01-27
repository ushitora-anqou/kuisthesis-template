# kuisthesis-template

## newkuisthesis.cls

京都大学工学部情報学科の卒論フォーマットを[jlreq.cls](https://github.com/abenori/jlreq)を用いて書き直したもの。
京都大学・工学部・情報学科・所属研究室いずれに関しても非公式。
指示された卒論フォーマットは満たしているが、
元々のスタイルファイル（`kuisthesis.sty`）と完全に同じ版面になるわけではない。
特に異なる部分を以下に挙げる。

- `\tt`・`\bf`・`\rm`・`\sc`などは定義されない。代わりに`\ttfamily`・`\bfseries`・`\rmfamily`・`\scstyle`を使う。
- 修論や、英文の卒論・修論には対応していない。
- `withinsec`オプションは対応していない。例えば chngcntr パッケージ等が使えるかも知れないが未確認。
- `\appendix`には対応してない。`\Appendix`には対応した。
- 最近の組版に対応する。具体的には`\verb|...|`が右に突き抜けなくなったりする。

## 使い方

必要最低限のパッケージしか読み込んでいないので、
元と同じものを読み込みたい場合は、次をプリアンブルに書く。

```latex
\RequirePackage{plautopatch}% pLaTeX/upLaTeXでコンパイルする場合のみ読み込む
\documentclass{newkuisthesis}

\usepackage[T1]{fontenc}% pLaTeX/upLaTeXでコンパイルする場合のみ読み込む
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsxtra}
\usepackage{amsthm}
% newpxtextはamsmathより後、bmより先に読み込む必要がある。
% footnotemarkが壊れるのを防ぐためdefaultsupsオプションを使用する。
% Thanks to: https://mstdn.wtsnjp.com/@wtsnjp/105621659654299621
\usepackage[defaultsups]{newpxtext}
\usepackage{newpxmath}
\usepackage{bm}
\usepackage{cite}
\usepackage{url}

\def\LATEX{{\rmfamily (L\kern-.36em\raise.3ex\hbox{\scshape a})\TeX}}
\def\LATex{\iLATEX\small}
\def\iLATEX#1{L\kern-.36em\raise.3ex\hbox{#1\bfseries A}\kern-.15em
	T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}
\def\LATEXe{\ifx\LaTeXe\undefined \LaTeX 2e\else\LaTeXe\fi}
\def\LATExe{\ifx\LaTeXe\undefined \iLATEX\scriptsize 2e\else\LaTeXe\fi}
\let\EM\bfseries
\def\|{\verb|}
\def\<{\(\langle\)}
\def\>{\(\rangle\)}
\def\CS#1{{\ttfamily\string#1}}
```

詳細は`guide.tex`を参考のこと。