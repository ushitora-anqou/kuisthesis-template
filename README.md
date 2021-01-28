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
- `\appendix`には対応していない。`\Appendix`には対応した。
- 最近の（JLreq の）組版に対応する。具体的には`\verb|...|`が右に突き抜けなくなったりする。
- よくある問題に対応済み。例えば
  - 用紙サイズが US Letter になるとか
  - `\usepackage{graphicx}`すると壊れるとか

## 使い方

kuisthesis.cls で読み込まれていたいくつかのパッケージは、
newkuisthesis.cls ではデフォルトでは読み込まれないので、自前で読み込む必要がある。
upLaTeX を使って組版を行う場合は、おおよそ次のようなものを書いて始めるとうまくいく。
LuaLaTeX の場合は手直しが必要なはず。（[参考](https://qiita.com/zr_tex8r/items/ac9176e4611bf233a3e0)）

```latex
\RequirePackage{plautopatch}
\documentclass{newkuisthesis}

\usepackage[T1]{fontenc}
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
\usepackage[nobreak]{cite}
\usepackage{hyperref}
\usepackage{pxjahyper}
\usepackage{graphicx,xcolor}
```

詳細は`guide.tex`を参考のこと。