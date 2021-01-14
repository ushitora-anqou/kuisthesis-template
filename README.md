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

実用例は[`guide.tex`への修正](https://github.com/ushitora-anqou/kuisthesis-template/commit/ebb13e2f108393d4b972abdd5967288d671a3891#diff-4cbaca92b8ae177a86f3180fd3b718ac06757c25cbf99f145dd176a811edf13d)を参考のこと。