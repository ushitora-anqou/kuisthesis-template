% newkuisthesis.cls
%
% 工学部情報学科の特別研究報告書用LaTeXスタイルファイルを
% jlreq.clsを用いてモダンLaTeXに対応させたもの。
%
% Author: Ushitora Anqou (https://anqou.net/)
% License: CC0 (https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt)
% Date: 2021-1-14
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{newkuisthesis}[2021/1/14 newkuisthesis]

\LoadClass[
	paper=a4,% 仕様：A4の用紙
	fontsize=12pt,% 仕様：英文の場合は12 ptのフォント
	jafontsize=12pt,% 仕様：日本文の場合は12 ptのフォント
	line_length=35zw,% 仕様：1行当り35文字（英文の場合は1行の幅を14.2cmとする）
	number_of_lines=32,% 仕様：1ページあたり32行
]{jlreq}[2020/02/07]
\jlreqsetup{
	itemization_beforeafter_space=0pt,% 仕様：箇条書の前後に余分な空白は挿入しない
	itemization_itemsep=0pt,% 仕様：項目間に余分な空白は挿入しない
	quote_beforeafter_space=0pt,% 運用：引用についても箇条書きの規則を準用
}

\RequirePackage{
	bxpapersize,% PDFの用紙サイズを正しいものにする
	titletoc,
	xparse,
}

\newcommand{\newkuis@error}[2]{\GenericError{[newkuisthesis] }{#1}{#2}{#2}}

%% 見出し
% 仕様：章の見出しは2行分
% 運用：ここでいう「章」とはsectionのこと。
\RenewBlockHeading{section}{1}{font={\jlreq@keepbaselineskip{\Large\bfseries}},lines=2}
% 仕様：節の見出しは2行分
% 運用：ここでいう「節」とはsubsectionのこと。事前に空行を1行入れ2行分にする。
\RenewBlockHeading{subsection}{2}{font=\jlreq@keepbaselineskip{\large\bfseries},before_lines=1}
% 仕様：それ以下の小節の見出しは1行分
\RenewBlockHeading{subsubsection}{3}{font=\jlreq@keepbaselineskip{\normalsize\bfseries},lines=1}
% 運用：見出しが連続する場合は無駄に間が開かないように調整する。
\SetBlockHeadingSpaces{
% [lines=3]が無いと、sectionの直後で改ページされてしまう。
[lines=3]{_section{lines=2},_subsection{lines=1}}
}
% \section*{}を使用した場合も目次に登場させるため\section{}を再定義する。
% Thanks to: https://tex.stackexchange.com/a/292419
\let\newkuis@oldsection=\section
\newcounter{newkuis@secnumdepth}
\RenewDocumentCommand{\section}{s o m}{%
	\IfBooleanTF{#1}
	{\setcounter{newkuis@secnumdepth}{\value{secnumdepth}}% Store secnumdepth
		\setcounter{secnumdepth}{0}% Print only up to \chapter numbers
		\newkuis@oldsection{#3}% \section*
		\setcounter{secnumdepth}{\value{newkuis@secnumdepth}}}% Restore secnumdepth
	{\IfValueTF{#2}% \section
		{\newkuis@oldsection[#2]{#3}}% \section[.]{..}
		{\newkuis@oldsection{#3}}}% \section{..}
}

%% 謝辞
\newcommand{\acknowledgments}{\section*{謝辞}}

%% 付録
\let\newkuis@oldappendix=\appendix
\NewDocumentCommand{\Appendix}{o}{%
	\clearpage\pagenumbering{arabic}\renewcommand*{\thepage}{A-\arabic{page}}
	\newkuis@oldappendix
	\IfValueTF{#1}{\newkuis@oldappendix\section*{#1}}{\newkuis@oldappendix\section*{付録}}}
\jlreqsetup{appendix_counter = {section = {value = 0, the = {A.\arabic{section}}}}}

%% 目次
\renewcommand{\tableofcontents}{\newpage\pagestyle{empty}
	\begin{center}\large\bfseries\leavevmode\newkuis@jtitleforabst\end{center}
	\newkuis@oldsection*{目次\@mkboth{目次}{目次}}
	\@starttoc{toc}\newpage\pagestyle{newkuis@body}\setcounter{page}{1}
}
\titlecontents{section}[0\zw]{\bfseries}{\thecontentslabel\hspace{1\zw}}{}{\hfill\contentspage}
\titlecontents{subsection}[2\zw]{}{\thecontentslabel\hspace{1\zw}}{}{\dotfill\contentspage}
\titlecontents{subsubsection}[4\zw]{}{\thecontentslabel\hspace{1\zw}}{}{\dotfill\contentspage}

%% ページスタイル
% 内容梗概用
\NewPageStyle{newkuis@abstract}{
	nombre={\roman{page}},% 運用：ノンブルはローマ数字で表示
	nombre_position=top-right,% 運用：ノンブルは右上に表示
}
%% 本文用
\NewPageStyle{newkuis@body}{
	nombre=\thepage,% 運用：ノンブルはアラビア数字で表示
	nombre_position=bottom-center,% 運用：ノンブルは中央下に表示
}

%% FIXME: jlreqのdescription環境のバグを修正するためのモンキーパッチ。
%% jlreqの2020-12-29が普及したら消す。
%% Thanks to: https://github.com/abenori/jlreq/issues/68
%% BEGIN
\renewenvironment{description}{\list{}{%
		\setlength{\labelsep}{1\jlreq@zw}%
		\setlength{\labelwidth}{\dimexpr\leftmargin - \labelsep\relax}%
		\let\makelabel=\descriptionlabel
	}}{\endlist}
%% END

%% 表紙
\renewcommand{\maketitle}{\newpage\thispagestyle{empty}
	\begin{center}\large
		{\Large\bfseries
			特別研究報告書}
		\par
		\bigskip\bigskip\bigskip\bigskip\bigskip\bigskip
		{\LARGE\bfseries\leavevmode\newkuis@jtitle\par}
		\bigskip\bigskip\bigskip\bigskip\bigskip\bigskip
		{指導教員：\newkuis@supervisor}
		\vfill
		京都大学工学部情報学科
		\par
		\bigskip\bigskip
		{\Large \newkuis@jauthor}\par
		\bigskip\bigskip\bigskip\bigskip
		\newkuis@date
	\end{center}\newpage\pagestyle{newkuis@abstract}\setcounter{page}{1}}
% 表紙その他を作るための変数
\newcommand{\newkuis@jtitle}{
	\newkuis@error{Not found \jtitle}{\jtitle を使って日本語タイトルを指定してください。}}
\newcommand{\newkuis@etitle}{
	\newkuis@error{Not found \etitle}{\etitle を使って英語タイトルを指定してください。}}
\newcommand{\newkuis@jtitleforabst}{\newkuis@jtitle}
\newcommand{\newkuis@etitleforabst}{\newkuis@etitle}
\newcommand{\newkuis@jauthor}{
	\newkuis@error{Not found \jauthor}{\jauthor を使って著者の日本語名を指定してください。}}
\newcommand{\newkuis@eauthor}{
	\newkuis@error{Not found \eauthor}{\eauthor を使って著者の英語名を指定してください。}}
\newcommand{\newkuis@supervisor}{
	\newkuis@error{Not found \supervisor}{\supervisor を使って指導教員名を指定してください。}}
\newcommand{\newkuis@date}{\today}
% 表紙その他を作る変数に値を設定するマクロ
\NewDocumentCommand{\jtitle}{o m}{
	\renewcommand{\newkuis@jtitle}{#2}
	\IfValueTF{#1}
	{\renewcommand{\newkuis@jtitleforabst}{#1}}
	{\renewcommand{\newkuis@jtitleforabst}{#2}}
}
\NewDocumentCommand{\etitle}{o m}{
	\renewcommand{\newkuis@etitle}{#2}
	\IfValueTF{#1}
	{\renewcommand{\newkuis@etitleforabst}{#1}}
	{\renewcommand{\newkuis@etitleforabst}{#2}}
}
\newcommand{\jauthor}[1]{\renewcommand{\newkuis@jauthor}{#1}}
\newcommand{\eauthor}[1]{\renewcommand{\newkuis@eauthor}{#1}}
\newcommand{\supervisor}[1]{\renewcommand{\newkuis@supervisor}{#1}}
\renewcommand{\date}[1]{\renewcommand{\newkuis@date}{#1}}
\newenvironment{jabstract}{%
	\begin{center}\large\bfseries\leavevmode\newkuis@jtitleforabst\end{center}%
	\rightline{\newkuis@jauthor}%
	\noindent{\bfseries 内容梗概}\par\indent\ignorespaces%
}{\newpage}
\newenvironment{eabstract}{%
	\begin{center}\large\bfseries\leavevmode\newkuis@etitleforabst\end{center}%
	\rightline{\newkuis@eauthor}%
	\noindent{\bfseries Abstract}\par\parindent1.5em\noindent\ignorespaces%
}{\newpage}

%% 便利マクロ
%% kuisthesis.styにもあったので、互換性のために残す。
\def\cap@beforeskip{\nointerlineskip\vskip10pt}
\let\cap@@beforeskip\cap@beforeskip
\def\cap@afterskip{\nointerlineskip\vskip10pt}
\let\cap@@afterskip\cap@afterskip
\def\subfigure{\let\cap@beforeskip\cap@@beforeskip
	\let\cap@afterskip\relax \def\@captype{figure}\minipage}
\def\endsubfigure{\endminipage\global\@ignoretrue}
\def\subtable{\let\cap@afterskip\cap@@afterskip
	\let\cap@beforeskip\relax \def\@captype{table}\minipage}
\def\endsubtable{\endminipage\global\@ignoretrue}
