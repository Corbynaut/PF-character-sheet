\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{rpgcharsheet}[2013/02/23]

\LoadClass{article}

\RequirePackage[margin=1cm,footskip=0.25in,a4paper]{geometry}
\RequirePackage{mathptmx}
\RequirePackage{anyfontsize}
\RequirePackage{tabularx}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{dashrule}
\RequirePackage{etex}
\RequirePackage{cancel}
\RequirePackage{xcolor}
\RequirePackage{xstring}
\RequirePackage{color}
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{amssymb}
\RequirePackage{pifont}
\RequirePackage{etoolbox}
\RequirePackage{xifthen}
\RequirePackage{longtable}
\RequirePackage{colortbl}
\RequirePackage{calculator}
\ProcessOptions\relax
%\DeclareOption* {\PassOptionsToClass{\CurrentOption}{article}}
\RequirePackage{graphicx}

%\graphicspath{ {images/} }
\newcommand{\emptylist}{}

\def\attributes#1#2#3{%
\count@#1
\newcount\xcount\xcount=#1
\@for\tmp:=#3\do{%
\put(\xcount,#2){\framebox(15,9){\tmp}}%
\advance\xcount18
}}

\def\plusattributes#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
  \put(\tmpcount,#2){\framebox(15,9){\tmp}}
  \advance\xcount by #4
}}

\def\equalattributes#1#2#3#4{%
  \newcount\xcount
  \xcount=#1
  \newcount\pluscount
  \newcount\tmpcount
  \newcount\mytotalcount
  \mytotalcount=0
  \newcount\firstcount
  \firstcount=0

  % Just to skip the first box
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  % \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
  % \put(\tmpcount,#2){\framebox(15,9){\tmp}}
  \advance\xcount by #4

  \@for\tmp:=#3\do{%
    \pluscount=0
    \advance\pluscount by #4
    \advance\pluscount by -15
    \tmpcount=\xcount
    \advance\tmpcount by \number\pluscount
    \ifnum\number\firstcount=0 
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny =}}
    \else
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
    \fi
    \put(\tmpcount,#2){\framebox(15,9){$\tmp$}}
    \advance\xcount by #4
    \advance\mytotalcount by \tmp
    \advance\firstcount by 1
  }

  %% reset to give the first box
  \xcount=#1
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\tmpcount,#2){\framebox(15,9){$\number\mytotalcount$}}
  \advance\xcount by #4
}

\def\specialequalattributes#1#2#3#4#5{%
  \newcount\xcount
  \xcount=#1
  \newcount\pluscount
  \newcount\tmpcount
  \global\newcount#5
  #5=0
  \newcount\firstcount
  \firstcount=0

  % Just to skip the first box
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  % \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
  % \put(\tmpcount,#2){\framebox(15,9){\tmp}}
  \advance\xcount by #4

  \@for\tmp:=#3\do{%
    \pluscount=0
    \advance\pluscount by #4
    \advance\pluscount by -15
    \tmpcount=\xcount
    \advance\tmpcount by \number\pluscount
    \ifnum\number\firstcount=0 
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny =}}
    \else
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
    \fi
    \put(\tmpcount,#2){\framebox(15,9){\tmp}}
    \advance\xcount by #4
    \advance#5 by \tmp
    \advance\firstcount by 1
  }

  %% reset to give the first box
  \xcount=#1
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\tmpcount,#2){\framebox(15,9){\the#5}}
  \advance\xcount by #4
}

\newcounter{charstrcount}
\newcounter{chardexcount}
\newcounter{charconcount}
\newcounter{charintcount}
\newcounter{charwiscount}
\newcounter{charchacount}
\newcounter{charstrmodcount}
\newcounter{chardexmodcount}
\newcounter{charconmodcount}
\newcounter{charintmodcount}
\newcounter{charwismodcount}
\newcounter{charchamodcount}
\newcounter{charstrtmpadjcount}
\newcounter{chardextmpadjcount}
\newcounter{charcontmpadjcount}
\newcounter{charinttmpadjcount}
\newcounter{charwistmpadjcount}
\newcounter{charchatmpadjcount}
\newcounter{charstrtmpmodcount}
\newcounter{chardextmpmodcount}
\newcounter{charcontmpmodcount}
\newcounter{charinttmpmodcount}
\newcounter{charwistmpmodcount}
\newcounter{charchatmpmodcount}

%change the attribute to calculate AC
\newcommand{\characmod}{chardexmodcount}
%change the attribute to calculate Initiative
\newcommand{\charinitmod}{chardexmodcount}
%change the attribute to calculate Reflex save
\newcommand{\charrefmod}{charwismodcount}
%Text for Conditional Modifiers
\newcommand{\textconditionalmodifiers}{}
%Total HP
\newcounter{favouredclasshpbonus}
\newcommand{\chartotalhp}{\addtocounter{charhpcount}{\value{favouredclasshpbonus}+\value{charconmodcount}*\value{charlevelcount}}\arabic{charhpcount}}
%Text for Wounds/currentHP
\newcommand{\textwoundscurrenthp}{} %0/\arabic{charhpcount}
%Base speed
\newcounter{charbasespeedcount}
\newcounter{racebasespeedcount}
\newcommand\racebasespeed[1]{
	\setcounter{racebasespeedcount}{#1}
	\setcounter{charbasespeedcount}{#1}}
\newcounter{charbasespeedsquarecount}
\newcommand{\charbasespeedsquares}{
	\setcounter{charbasespeedsquarecount}{\value{charbasespeedcount}/5}\arabic{charbasespeedsquarecount}}
%Speed with armor
\newcounter{chararmorspeedpenaltycount}
\newcounter{chararmorspeedcount}
\newcommand{\chararmorspeed}{
	\setcounter{chararmorspeedcount}{\value{charbasespeedcount}-\value{chararmorspeedpenaltycount}} \arabic{chararmorspeedcount}}
\newcounter{chararmorspeedsquarecount}
\newcommand{\chararmorspeedsquares}{
	\setcounter{chararmorspeedsquarecount}{\value{chararmorspeedcount}/5} \arabic{chararmorspeedsquarecount}}
%Swim Speed

\newcommand\charstr[1]{
  \setcounter{charstrcount}{0}
  \setcounter{charstrcount}{#1}
  \setcounter{charstrmodcount}{0}
  \setcounter{charstrmodcount}{(\value{charstrcount}-10)/\real{2}}
}
\newcommand\chardex[1]{
  \setcounter{chardexcount}{0}
  \setcounter{chardexcount}{#1}
  \setcounter{chardexmodcount}{0}
  \setcounter{chardexmodcount}{(\value{chardexcount}-10)/\real{2}}
}
\newcommand\charcon[1]{
  \setcounter{charconcount}{0}
  \setcounter{charconcount}{#1}
  \setcounter{charconmodcount}{0}
  \setcounter{charconmodcount}{(\value{charconcount}-10)/\real{2}}
}
\newcommand\charint[1]{
  \setcounter{charintcount}{0}
  \setcounter{charintcount}{#1}
  \setcounter{charintmodcount}{0}
  \setcounter{charintmodcount}{(\value{charintcount}-10)/\real{2}}
}
\newcommand\charwis[1]{
  \setcounter{charwiscount}{0}
  \setcounter{charwiscount}{#1}
  \setcounter{charwismodcount}{0}
  \setcounter{charwismodcount}{(\value{charwiscount}-10)/\real{2}}
}
\newcommand\charcha[1]{
  \setcounter{charchacount}{0}
  \setcounter{charchacount}{#1}
  \setcounter{charchamodcount}{0}
  \setcounter{charchamodcount}{(\value{charchacount}-10)/\real{2}}
}

\newcommand\plusminus[1]{
  \ifthenelse{\value{#1}>0}{$+\arabic{#1}$}{$\arabic{#1}$}
}


%% Health counter
\newcounter{charhpcount}

% \def\abilitymodifier#1{
%   \newcount\tmpcount
%   \tmpcount#1
%   \advance\tmpcount by -10
%   \divide \tmpcount by 2
%  \hspace{-5\unitlength}
%   \ifnum\number\tmpcount<0
%   $\the\tmpcount$
%   \else
%   $+\the\tmpcount$
%   \fi
% }

% \def\numberabilitymodifier#1{
%   \newcount\tmpcount
%   \tmpcount#1
%   \advance\tmpcount by -10
%   \divide \tmpcount by 2
%   \number\tmpcount
% }



\def\scaleattributes#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\tmpcount,#2){\framebox(15,9){\tmp}}
  \advance\xcount by #4
}}

%% Attribute box dimensions
\newcount\boxwidth\boxwidth=15
\newcount\boxheight\boxheight=9
\newcount\Moneyboxwidth\Moneyboxwidth=75
\newcount\Moneyboxheight\Moneyboxheight=9

\def\stretchattributes#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\stretchcount
\stretchcount=#3
\advance\stretchcount by -#1
\newcount\noofentriescount
\noofentriescount=0
\@for\tmp:=#4\do{%
  \advance\noofentriescount1
}
\advance\noofentriescount-1
\advance\stretchcount-\boxwidth
\divide\stretchcount by \number\noofentriescount
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#4\do{%
  \ifnum\number\xcount=#1
  \pluscount=0
  \else
  \pluscount=0
  \advance\pluscount by \stretchcount
  \advance\pluscount by -15
  \fi
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\tmpcount,#2){\framebox(\boxwidth,\boxheight){\tmp}}
  \ifnum\number\pluscount=0
  \advance\xcount by \boxwidth
  \else
  \advance\xcount by \stretchcount
  \fi
}}

\def\stretchMoney#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\stretchcount
\stretchcount=#3
\advance\stretchcount by -#1
\newcount\noofentriescount
\noofentriescount=0
\@for\tmp:=#4\do{%
  \advance\noofentriescount1
}
\advance\noofentriescount-1
\advance\stretchcount-\Moneyboxwidth
\divide\stretchcount by \number\noofentriescount
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#4\do{%
  \ifnum\number\xcount=#1
  \pluscount=0
  \else
  \pluscount=0
  \advance\pluscount by \stretchcount
  \advance\pluscount by -15
  \fi
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\tmpcount,#2){\framebox(\Moneyboxwidth,\Moneyboxheight){\tmp}}
  \ifnum\number\pluscount=0
  \advance\xcount by \Moneyboxwidth
  \else
  \advance\xcount by \stretchcount
  \fi
}}



\newcount\labelheight
\labelheight=3
\newcount\labelwidth
\labelwidth=\number\boxwidth
\advance\labelwidth4

\def\stretchlabels#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\stretchcount
\stretchcount=#3
\advance\stretchcount by -#1
\newcount\noofentriescount
\noofentriescount=0
\@for\tmp:=#4\do{%
  \advance\noofentriescount1
}
\advance\noofentriescount-1
\advance\stretchcount-\boxwidth
\divide\stretchcount by \number\noofentriescount
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#4\do{%
  \ifnum\number\xcount=#1
  \pluscount=0
  \else
  \pluscount=0
  \advance\pluscount by \stretchcount
  \advance\pluscount by -15
  \fi
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \newcount\leftabitcount
  \leftabitcount=\tmpcount
  \advance\leftabitcount by -2  \put(\leftabitcount,#2){\parbox[b][\number\labelheight\unitlength][c]{\number\labelwidth\unitlength}{\centering\lfont \tmp}}
  \ifnum\number\pluscount=0
  \advance\xcount by \boxwidth
  \else
  \advance\xcount by \stretchcount
  \fi
}}



\def\attributelabels#1#2#3{%
\count@#1
\newcount\xcount\xcount=#1
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \tmpcount=\xcount
  \advance\tmpcount-4
\put(\tmpcount,#2){\parbox[b][9\unitlength][b]{24\unitlength}{\lfont\centering\tmp}}%
\advance\xcount18
}}



\def\stretchequalattributes#1#2#3#4{%
  \newcount\xcount
  \xcount=#1
  \newcount\stretchcount
  \stretchcount=#3
  \advance\stretchcount by -#1
  \newcount\firstcount
  \firstcount=0
  \newcount\noofentriescount
  \noofentriescount=0
  \@for\tmp:=#4\do{%
    \advance\noofentriescount1
  }
  % \advance\noofentriescount-1
  \advance\stretchcount-\boxwidth
  \divide\stretchcount by \number\noofentriescount %stretchcount completed
  \newcount\pluscount
  \newcount\tmpcount
  \newcount\totalcount\totalcount=0

  \ifnum\number\xcount=#1
  \pluscount=0
  \else
  \pluscount=0
  \advance\pluscount by \stretchcount
  \advance\pluscount by -15
  \fi
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \ifnum\number\pluscount=0
  \advance\xcount by \boxwidth
  \else
  \advance\xcount by \stretchcount
  \fi
  \advance\firstcount1
  % \advance\totalcount by \numberfoo

  \@for\tmp:=#4\do{%
    \ifnum\number\xcount=#1
    \pluscount=0
    \else
    \pluscount=0
    \advance\pluscount by \stretchcount
    \advance\pluscount by -15
    \fi
    \tmpcount=\xcount
    \advance\tmpcount by \number\pluscount
    \ifnum\number\firstcount=0
    \else
    \put(\tmpcount,#2){\framebox(\boxwidth,\boxheight){\tmp}}
    \fi
    \ifnum\number\firstcount=1 
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny =}}
    \else
    \ifnum\number\firstcount=0
    \else
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
    \fi
    \fi
    \ifnum\number\pluscount=0
    \advance\xcount by \boxwidth
    \else
    \advance\xcount by \stretchcount
    \fi
    \advance\firstcount1
    \advance\totalcount by \number\tmp
  }
  \put(#1,#2){\framebox(\boxwidth,\boxheight){\number\totalcount}}
}

\def\attributelabels#1#2#3{%
\count@#1
\newcount\xcount\xcount=#1
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \tmpcount=\xcount
  \advance\tmpcount-4
\put(\tmpcount,#2){\parbox[b][9\unitlength][b]{24\unitlength}{\lfont\centering\tmp}}%
\advance\xcount18
}}


\def\scaleattributelabels#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \advance\tmpcount by -1
\put(\tmpcount,#2){\parbox[b][9\unitlength][c]{17\unitlength}{\lfont\centering\tmp}}
  \advance\xcount by #4
}}

\def\titlebox#1#2#3#4#5{
  \newcount\ycount\ycount#2
  \newcount\hcount\hcount=10
  \newcount\wcount\wcount=#3
  \newcount\downabitcount
  \downabitcount=#2
  \advance\downabitcount-1
  \put(#1,\downabitcount){\setlength\fboxsep{0pt}\colorbox{black}{\makebox(#3,11){}}}%
  \advance\ycount1
  \put(#1,\ycount){\makebox(#3,\hcount){\color{white}{\uppercase{#4}}}}
  \advance\hcount-7
  \advance\ycount-1
  \put(#1,\ycount){\makebox(#3,\hcount){\color{white}{\tiny\scshape #5}}}
}

\newcommand\singletitlebox[5]{
  % \put(#1,#2){\framebox(#3,#4){\uppercase{#5}}}
  \put(#1,#2){%
    \setlength\fboxsep{0pt}\colorbox{black}{%
      \makebox(#3,#4){%
        \color{white}{\centering\uppercase{#5}}%
      }%
    }%
  }%
}

%%Gear
\newcounter{totalitemweightcount}
\newcommand{\gearlist}{}
\newcommand\printgearitems{ \lfont item& \lfont Qty&\lfont wt.\tabularnewline\hline \gearlist \totalitem}

%Name, Quantity, Weight
\newcommand\addgear[3]{
  \newcounter{#1itemtotalweight}
  \addtocounter{#1itemtotalweight}{#2* #3}
  \addtocounter{totalitemweightcount}{#2* #3}
  \apptocmd{\gearlist}{\tfont{#1} &\tfont #2&\tfont \arabic{#1itemtotalweight}~lbs.\tabularnewline}{}{}
}

\newcommand\totalitem{
  \relax & & \relax \tabularnewline
  \textsc{Total} & & \arabic{totalitemweightcount}~lbs. \tabularnewline\hline
}

%%Magic items
\newcommand\magicitembelt{}
\newcommand\magicitembody{}
\newcommand\magicitemchest{}
\newcommand\magicitemeyes{}
\newcommand\magicitemfeet{}
\newcommand\magicitemhands{}
\newcommand\magicitemhead{}
\newcommand\magicitemheadband{}
\newcommand\magicitemneck{}
\newcommand\magicitemringone{}
\newcommand\magicitemringtwo{}
\newcommand\magicitemshoulders{}
\newcommand\magicitemwrist{}
%Name, Type (belt, body, chest, eyes, feet, hands, head, headband, neck, ring, shoulders, wrist), additional commands
\newcommand\addmagicitem[3]{
	\ifthenelse{\equal{#2}{belt}}{
	\ifx \magicitembelt\emptylist
		#3
	\apptocmd{\magicitembelt}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{body}}{
	\ifx \magicitembody\emptylist
		#3
	\apptocmd{\magicitembody}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{chest}}{
	\ifx \magicitemchest\emptylist
		#3
	\apptocmd{\magicitemchest}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{eyes}}{
	\ifx \magicitemeyes\emptylist
		#3
	\apptocmd{\magicitemeyes}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{feet}}{
	\ifx \magicitemfeet\emptylist
		#3
	\apptocmd{\magicitemfeet}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{hands}}{
	\ifx \magicitemhands\emptylist
		#3
	\apptocmd{\magicitemhands}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{head}}{
	\ifx \magicitemhead\emptylist
		#3
	\apptocmd{\magicitemhead}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{headband}}{
	\ifx \magicitemheadband\emptylist
		#3
	\apptocmd{\magicitemheadband}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{neck}}{
	\ifx \magicitemneck\emptylist
		#3
	\apptocmd{\magicitemneck}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{ring}}{
		\ifx \magicitemringone\emptylist
		#3
		\apptocmd{\magicitemringone}{\tfont #1}{}{}
		\else	
		#3
		\ifx \magicitemringtwo\emptylist
		\apptocmd{\magicitemringtwo}{\tfont #1}{}{}
		\fi
		\fi
	}{}
	\ifthenelse{\equal{#2}{shoulders}}{
	\ifx \magicitemshoulders\emptylist
		#3
	\apptocmd{\magicitemshoulders}{\tfont #1}{}{}
		\fi
	}{}
	\ifthenelse{\equal{#2}{wrist}}{
	\ifx \magicitemwrist\emptylist
		#3
	\apptocmd{\magicitemwrist}{\tfont #1}{}{}
		\fi
	}{}
}
%%Feats
\newcounter{boolfeats}
\newcommand\charfeats{None}
\newcommand{\featlist}{}
%Name, Text, additional commands
\newcommand\addfeat[3]{
	#3
	\apptocmd{\featlist}{\selectfont\scshape#1 &\tfont  #2\tabularnewline\hline}{}{}
	\setcounter{boolfeats}{1}
}

%%Features, class features, racial traits etc
\newcounter{boolfeatures}
\newcommand{\featurelist}{\null}
\newcommand{\featureclasslist}{}
\newcommand{\featureracelist}{}
\newcommand{\featuretraitlist}{}
\newcommand{\featureflawlist}{}
\newcommand{\featuremisclist}{}
%Name,Type, Text, Uses, additional commands
\newcommand\addfeature[5]{
	#5
	\ifthenelse {\equal{#2}{class}}{
	\apptocmd{\featureclasslist}{\selectfont\scshape#1 &\tfont  #3&\selectfont\scshape#4\tabularnewline\hline}{}{}
	}{
		\ifthenelse {\equal{#2}{flaw}}{
		\apptocmd{\featureflawlist}{\selectfont\scshape#1 &\tfont  #3&\selectfont\scshape#4\tabularnewline\hline}{}{}
		}{
			\ifthenelse {\equal{#2}{trait}}{
			\apptocmd{\featuretraitlist}{\selectfont\scshape#1 &\tfont  #3&\selectfont\scshape#4\tabularnewline\hline}{}{}
			}{
				\ifthenelse {\equal{#2}{race}}{
				\apptocmd{\featureracelist}{\selectfont\scshape#1 &\tfont  #3&\selectfont\scshape#4\tabularnewline\hline}{}{}
				}{
				\apptocmd{\featuremisclist}{\selectfont\scshape#1 &\tfont  #3&\selectfont\scshape#4\tabularnewline\hline}{}{}
				} 
	}}}
	\setcounter{boolfeatures}{1}
}

%%Spells
\newcounter{tmpcasterlevelbonus}
%Range (close, medium, long) , Caster, Caster level adjustment
\newcommand\range[3]{
	\IsInteger{#3}{\setcounter{tmpcasterlevelbonus}{#3}}{\setcounter{tmpcasterlevelbonus}{0}}
	
	\ifthenelse{\equal{#1}{close}}{
		\setcounter{#2rangeclosecount}{25+(\value{#2casterlevelcount}+\value{tmpcasterlevelbonus})/2*5}
		\arabic{#2rangeclosecount} ft.
	}{
	\ifthenelse{\equal{#1}{medium}}{
		\setcounter{#2rangemediumcount}{100+(\value{#2casterlevelcount}+\value{tmpcasterlevelbonus})*10}
		\arabic{#2rangemediumcount} ft.
	}{
	\ifthenelse{\equal{#1}{long}}{
		\setcounter{#2rangelongcount}{400+(\value{#2casterlevelcount}+\value{tmpcasterlevelbonus})*40}
		\arabic{#2rangelongcount} ft.
	}{#1}}}
}

\newcounter{boolspells}
\newcommand{\zerospelllist}{}
\newcommand{\firstspelllist}{}
\newcommand{\secondspelllist}{}
\newcommand{\thirdspelllist}{}
\newcommand{\fourthspelllist}{}
\newcommand{\fifthspelllist}{}
\newcommand{\sixthspelllist}{}
\newcommand{\seventhspelllist}{}
\newcommand{\eighthspelllist}{}
\newcommand{\ninthspelllist}{}
%Level, Name, Text, School, Duration, Range, Save, SR
\DeclareRobustCommand\addspell[8]{

%\expandafter\newcommand\csname #2spellrange \endcsname{#6}{}{}

	\ifthenelse{\equal{#1}{0}}{\apptocmd{\zerospelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
 & &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\ifthenelse{\equal{#1}{1}}{\apptocmd{\firstspelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
 & &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\ifthenelse{\equal{#1}{2}}{\apptocmd{\secondspelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
& &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\ifthenelse{\equal{#1}{3}}{\apptocmd{\thirdspelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
 & &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\ifthenelse{\equal{#1}{4}}{\apptocmd{\fourthspelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
 & &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\ifthenelse{\equal{#1}{5}}{\apptocmd{\fifthspelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
 & &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\ifthenelse{\equal{#1}{6}}{\apptocmd{\sixthspelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
 & &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\ifthenelse{\equal{#1}{7}}{\apptocmd{\seventhspelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
 & &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\ifthenelse{\equal{#1}{8}}{\apptocmd{\eighthspelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
 & &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\ifthenelse{\equal{#1}{9}}{\apptocmd{\ninthspelllist}{\multicolumn{8}{|c|}{\selectfont\scshape#2}\\\hline
 & &\tfont#3&\tfont#4&\tfont#5&\tfont #6 &\tfont#7&\tfont#8\tabularnewline\hline}{}{}}{}
	\setcounter{boolspells}{1}

}

%%AC
\newcounter{totalacitemsbonus}
\newcounter{totalacitemscheckpenalty}
\newcounter{totalacitemsspellfailure}
\newcounter{totalacitemsweight}
\newcounter{totalflatfootedaccount}
\newcounter{totaltouchaccount}
\newcounter{totaldodgecount}

\newcommand\adddodgebonus[1]{
	\addtocounter{totaldodgecount}{#1}
	\addtocounter{totalmiscbonuscount}{#1}
}

\newcounter{totaldexbonuscount}
\newcounter {totalarmorbonuscount}
\newcounter {totalshieldbonuscount}
\newcounter {totalnaturalbonuscount}
\newcounter {totalmiscbonuscount}
\newcounter {maxdexbonuscount} \setcounter{maxdexbonuscount}{99}
\newcommand{\tmparmorcounter}{totalarmorbonuscount}

\makeatletter
\newcommand{\removeabs}[1]{%
  \ifcat\relax\noexpand#1%
    \expandafter\expandafter\expandafter\@gobble\expandafter\string
  \fi
  #1%
}
\makeatother

\newcommand*{\IsInteger}[3]{%
    \IfStrEq{#1}{ }{%
        #3% is a blank string
    }{%
        \IfInteger{#1}{#2}{#3}%
    }%
}%

\newcommand{\acitemlist}{}

\newcommand\printacitems{\rowcolor{black} \leavevmode\color{white} \uppercase{AC Items} & \leavevmode\color{white} \lfont ac bonus & \leavevmode\color{white} \lfont max dex & \leavevmode\color{white} \lfont penalty &\leavevmode\color{white}  \lfont spell failure & \leavevmode\color{white} \lfont type & \leavevmode\color{white} \lfont weight \tabularnewline\hline \acitemlist}

\newcommand{\addacitem}[9]{
\ifthenelse{\equal{\detokenize{#6}}{\detokenize{light}}\OR\equal{\detokenize{#6}}{\detokenize{medium}}\OR\equal{\detokenize{#6}}{\detokenize{heavy}}}
	{\addtocounter{totalarmorbonuscount}{#2}}
	{\ifthenelse{\equal{\detokenize{#6}}{\detokenize{shield}}}
		{\addtocounter{totalshieldbonuscount}{#2}}
		{\ifthenelse{\equal{\detokenize{#6}}{\detokenize{natural}}}
			{\addtocounter{totalnaturalbonuscount}{#2}}
			{\addtocounter{totalmiscbonuscount}{#2}}}}
 \IsInteger{#3}{\ifthenelse{\value{maxdexbonuscount}>#3}{\setcounter{maxdexbonuscount}{#3}}{ }} {}
  \ifthenelse {\value{\characmod}>\value{maxdexbonuscount}}{\setcounter{totaldexbonuscount}{\value{maxdexbonuscount}}}{\setcounter{totaldexbonuscount}{\value{\characmod}}}
  \addtocounter{totalacitemsbonus}{#2}
  \addtocounter{totalacitemscheckpenalty}{#4}
  \addtocounter{totalacitemsspellfailure}{#5}
  \addtocounter{totalacitemsweight}{#7}
  \ifthenelse{\value{racebasespeedcount} = 30}{ \IsInteger{#8}{\addtocounter{chararmorspeedpenaltycount}{\value{racebasespeedcount}-#8}}{}}{\IsInteger{#9}{\addtocounter{chararmorspeedpenaltycount}{\value{racebasespeedcount}-#9}}{}}
  %\ifthenelse{\value{racebasespeedcount} = 30}{\addtocounter{chararmorspeedpenaltycount}{\value{racebasespeedcount}-#8}}{\addtocounter{chararmorspeedpenaltycount}{\value{racebasespeedcount}-#9}}
  \apptocmd{\acitemlist}{\tfont#1 & \tfont#2 & \tfont#3 &\tfont #4 &\tfont #5\% & \tfont#6 & \tfont#7~lbs.\tabularnewline\hline}{}{}
}

\newcommand{\calculateflatfootedac}{
  \addtocounter{totalflatfootedaccount}{10+\value{totalarmorbonuscount}+\value{totalshieldbonuscount}+\value{totalnaturalbonuscount}+\value{totalmiscbonuscount}+\value{charsizemodcount}-\value{totaldodgecount}}
  \arabic{totalflatfootedaccount}
}
\newcommand{\calculatetouchac}{
  \addtocounter{totaltouchaccount}{10+\value{charsizemodcount}+\value{totalmiscbonuscount}+\value{totaldexbonuscount}}
  \arabic{totaltouchaccount}
}

%%Weapons

\newcommand{\weaponlist}{}
\newcounter{totalweaponweightcount}
\newcommand\addweapon[8]{
	\addtocounter{totalweaponweightcount}{#7}
	 \apptocmd{\weaponlist}{\tfont#1 & \tfont#2 & \tfont#3 &\tfont #4 &\tfont #5 & \tfont#6 & \tfont#7~lbs. & \tfont#8 \tabularnewline\hline}{}{}
}

\newcolumntype{A}[1]{@{}>{\centering\footnotesize}m{#1\unitlength}@{}}
\newcolumntype{B}[1]{@{}>{\footnotesize\scshape}m{#1\unitlength}@{}}
\newcolumntype{D}[1]{>{\itshape}p{#1\unitlength}}
\newcolumntype{E}[1]{@{}>{\lfont\raggedleft}b{#1\unitlength}@{}}
\newcolumntype{F}[1]{@{\hspace{-0.5ex}}>{\small\raggedleft}m{#1\unitlength}@{\hspace{0.5ex}}}

\newcommand\weapontable[9]{
  \put(#1,#2){\begin{tabular}[b]{A{20}A{30}A{75}A{45}A{25}@{}l@{}}\toprule
      \multicolumn{3}{A{125}}{\tiny\scshape WEAPON} &\tiny\scshape  attack bonus &\tiny\scshape  critical & \tabularnewline\hline
      \multicolumn{3}{A{125}}{\itshape #3} & $#4$ &  $#5$ &\tabularnewline[6\unitlength]
      \tiny\scshape type & \tiny\scshape range & \tiny\scshape ammunition & \multicolumn{2}{A{76}}{\tiny\scshape damage} & \tabularnewline\hline
      \itshape #6 &  $#7$ & \itshape #8 & \multicolumn{2}{A{76}}{$#9$} & \tabularnewline\bottomrule
    \end{tabular}}
}

%% Skill commands
\newcounter{tmpClassRanks}
\newcounter{tmpArmorPenalty}

\newcommand{\skilllist}{}

%Name, trained only, class, Abillity mod, ranks, misc
 \newcommand\addskill[6]{
 \newcounter{#1skilltotalcount}
 \newcounter{#1skillrankcount}
 \newcounter{#1skillmisccount}
 \newcounter{#1skillclasscount}
 \newcounter{#1skilltrainedonly}
 \addtocounter{#1skilltrainedonly}{1}
 \addtocounter{#1skillrankcount}{#5}
 \addtocounter{#1skillmisccount}{#6}
\ifthenelse{\equal{#4}{str}\OR\equal{#4}{dex}}{\setcounter{tmpArmorPenalty}{\value{totalacitemscheckpenalty}}}{\setcounter{tmpArmorPenalty}{0}}
 \ifthenelse{\equal{#3}{}\OR\equal{#3}{0}}{\setcounter{tmpClassRanks}{0}}{\ifthenelse{\value{#1skillrankcount}>0}{\setcounter{tmpClassRanks}{3}}{\setcounter{tmpClassRanks}{0}}}
 \setcounter{#1skilltotalcount}{\value{#1skillrankcount}+\value{#1skillmisccount}+\value{char#4modcount}+\value{tmpClassRanks}+\value{tmpArmorPenalty}}
 \apptocmd{\skilllist}{\ifthenelse{\equal{#2}{}\OR\equal{#2}{0}}{}{*}&\classskillbox{#3}&\tfont{#1}&\plusminus{#1skilltotalcount} & $=$ &\color{lightgray}\uppercase{#4}\color{black}\indent\llap{\arabic{char#4modcount}} & $+$ & $\arabic{#1skillrankcount}$ &  $+$ & $\arabic{#1skillmisccount}$ \tabularnewline\cline{4-4}\cline{6-6}\cline{8-8}\cline{10-10}}{}{}
}

\newcommand\addskillmisc[2]{\addtocounter{#1skillmisccount}{#2}\addtocounter{#1skilltotalcount}{#2}}

\newcommand\classskillbox[1]{
  \ifthenelse{\equal{#1}{}\OR\equal{#1}{0}}{$\square$}{\mbox{\ooalign{$\checkmark$\cr\hidewidth$\square$\hidewidth\cr}}}
}

%%Conditional Modifiers
\newcommand{\conditionalmodlist}{}
%Text, additional commands
\newcommand\addcondition[2]{
#2
\apptocmd{\conditionalmodlist}{\tfont#1}{}{}
}

%%Class stuff
\newcommand{\classlist}{}
\newcounter{charbabcount}
\newcounter{charfortcount}
\newcounter{charrefcount}
\newcounter{charwillcount}
\newcounter{sizemodcount}
\newcounter{totalcasterlevelcount}
%Name, level, BAB, Fort, Ref, Will
\newcommand\addclass[6]{
	\ifthenelse{\equal{\classlist}{}}{\apptocmd{\classlist}{\fontsize{7}{7}\selectfont}{}{}}{\apptocmd{\classlist}{, }{}{}}
	\apptocmd{\classlist}{Lvl #2 #1}{}{}
	\newcounter{#1casterlevelcount}
	\addtocounter{#1casterlevelcount}{#2}
	\addtocounter{totalcasterlevelcount}{#2}
	\newcounter{#1rangeclosecount}
	\newcounter{#1rangemediumcount}
	\newcounter{#1rangelongcount}
	\newcounter{#1levelcount}
	\addtocounter{#1levelcount}{#2}
	\addtocounter{charbabcount}{#3}
	\addtocounter{charfortcount}{#4}	
	\addtocounter{charrefcount}{#5}
	\addtocounter{charwillcount}{#6}
	\addtocounter{charlevelcount}{#2}
}

\newcommand\lfont{\fontsize{5}{6}\selectfont\scshape}
\newcommand\tfont{\fontsize{7}{8.4}\selectfont}
\newcommand\charname{}
\newcommand\charplayername{}
\newcommand\charalignment{}
\newcommand\chardiety{}
\newcommand\charrace{}
\newcommand\charhomeland{}
\newcommand\charsize{}
\newcommand\chargender{}
\newcommand\charage{}
\newcommand\charheight{}
\newcommand\charweight{}
\newcommand\charhair{}
\newcommand\chareyes{}
\newcommand\charfavouredclass{}

\newcommand\name[1]{\renewcommand\charname{#1}}
\newcommand\playername[1]{\renewcommand\charplayername{#1}}
\newcommand\alignment[1]{\renewcommand\charalignment{#1}}
\newcommand\diety[1]{\renewcommand\chardiety{#1}}
\newcommand\race[1]{\renewcommand\charrace{#1}}
\newcommand\homeland[1]{\renewcommand\charhomeland{#1}}
%%Size
\newcounter{charsizemodcount}
\newcounter{charspecialsizemodcount}
\newcounter{charstealthsizemodcount}
\newcounter{charflysizemodcount}
\newcounter{charcarrysizemod}
\newcommand\size[1]{
	\renewcommand\charsize{#1}
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Fine}}}{
		\setcounter{charsizemodcount}{8}
	\setcounter{charspecialsizemodcount}{-8}
	\setcounter{charflysizemodcount}{8}
	\setcounter{charstealthsizemodcount}{16}
	%carry mod for smaller creatures	
}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Diminutive}}}{
		\setcounter{charsizemodcount}{4}
	\setcounter{charspecialsizemodcount}{-4}
	\setcounter{charflysizemodcount}{6}
	\setcounter{charstealthsizemodcount}{12}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Tiny}}}{
		\setcounter{charsizemodcount}{2}
	\setcounter{charspecialsizemodcount}{-2}
	\setcounter{charflysizemodcount}{4}
	\setcounter{charstealthsizemodcount}{8}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Small}}}{
		\setcounter{charsizemodcount}{1}
	\setcounter{charspecialsizemodcount}{-1}
	\setcounter{charflysizemodcount}{2}
	\setcounter{charstealthsizemodcount}{4}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Medium}}}{
		\setcounter{charsizemodcount}{0}
	\setcounter{charspecialsizemodcount}{0}
	\setcounter{charflysizemodcount}{0}
	\setcounter{charstealthsizemodcount}{0}
	\setcounter{charcarrysizemod}{1}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Large}}}{
		\setcounter{charsizemodcount}{-1}
	\setcounter{charspecialsizemodcount}{1}
	\setcounter{charflysizemodcount}{-2}
	\setcounter{charstealthsizemodcount}{-4}
	\setcounter{charcarrysizemod}{2}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Huge}}}{
		\setcounter{charsizemodcount}{-2}
	\setcounter{charspecialsizemodcount}{2}
	\setcounter{charflysizemodcount}{-4}
	\setcounter{charstealthsizemodcount}{-8}
	\setcounter{charcarrysizemod}{4}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Gargantuan}}}{
		\setcounter{charsizemodcount}{-4}
	\setcounter{charspecialsizemodcount}{4}
	\setcounter{charflysizemodcount}{-6}
	\setcounter{charstealthsizemodcount}{-12}
	\setcounter{charcarrysizemod}{8}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Colossal}}}{
		\setcounter{charsizemodcount}{-8}
	\setcounter{charspecialsizemodcount}{8}
	\setcounter{charflysizemodcount}{-8}
	\setcounter{charstealthsizemodcount}{16}
	\setcounter{charcarrysizemod}{16}}{} 
}

\newcommand\gender[1]{\renewcommand\chargender{#1}}
\newcommand\age[1]{\renewcommand\charage{#1}}
\newcommand\height[1]{\renewcommand\charheight{#1}}
\newcommand\weight[1]{\renewcommand\charweight{#1}}
\newcommand\hair[1]{\renewcommand\charhair{\fontsize{8}{8}\selectfont #1}}
\newcommand\eyes[1]{\renewcommand\chareyes{\fontsize{8}{8}\selectfont #1}}

%Languages
\newcommand{\languagelist}{}
\newcommand\addlanguages[1]{
	\ifthenelse{\equal{\languagelist}{}}{}{\apptocmd{\languagelist}{, }{}{}}
	\apptocmd{\languagelist}{#1}{}{}
	}
\newcommand\charlanguagesspoken[1]{#1}
\newcommand\favouredclass[1]{
	\renewcommand{\charfavouredclass}{#1}
}

\newcounter{charlevelcount}

%Currency
\newcommand{\currencylist}{}
\newcounter{totalcurrencyweightcount}
\newcommand\addcurrency[4]{
\newcounter{#1currencycarriedcount}
\newcounter{#1currencyweightcount}
\newcounter{#1currencystoredcount}
\setcounter{#1currencycarriedcount}{#2}
\setcounter{#1currencyweightcount}{#2*\real{#3}}
\setcounter{#1currencystoredcount}{#4}
\addtocounter{totalcurrencyweightcount}{\value{#1currencyweightcount}}
 \apptocmd{\currencylist}{\tfont#1 &\tfont \arabic{#1currencycarriedcount}&\tfont \arabic{#1currencyweightcount} &\tfont \arabic{#1currencystoredcount}\tabularnewline}{}{}
}

%Weight
\newcounter{totalweightcount}
\newcounter{totalmiscweightcount}
\newcommand{\printweight}{
	\setcounter{totalweightcount}{\value{totalacitemsweight}+\value{totalweaponweightcount}+\value{totalcurrencyweightcount}+\value{totalitemweightcount}+\value{totalmiscweightcount}}
	\arabic{totalacitemsweight} + \arabic{totalweaponweightcount} & \arabic{totalcurrencyweightcount} & \arabic{totalitemweightcount}& \arabic{totalmiscweightcount}& \arabic{totalweightcount}
}

%Loads and Lift
\newcounter{lightloadcount}
\newcounter{mediumloadcount}
\newcounter{heavyloadcount}
\newcounter{liftaboveheadcount}
\newcounter{liftofgroundcount}
\newcounter{dragandpushcount}

\newcommand{\currentload}{\tfont OVER ENCUMBERED}
\newcommand{\tmpseries}{}

\newcounter{basecapacitycount}
\newcounter{tmpbasecapacitycount}
\newcounter{seriescapacitycount}

\newcommand{\printloadsandlift}{		

	\ifthenelse{\value{charstrcount} < 10}{\setcounter{heavyloadcount}{10*\value{charstrcount}}}
	{
		\setcounter{tmpbasecapacitycount}{\value{charstrcount}/10}
		\setcounter{basecapacitycount}{1+\value{charstrcount}-10*\value{tmpbasecapacitycount}}
		\POWER{4}{\arabic{tmpbasecapacitycount}}{\tmpseries}
		\setcounter{seriescapacitycount}{\tmpseries}
		\ifnum\value{basecapacitycount} = 1
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{25}*\value{charcarrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 2
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{28.75}*\value{charcarrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 3
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{32.5}*\value{charcarrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 4
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{37.5}*\value{charcarrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 5
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{43.75}*\value{charcarrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 6
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{50}*\value{charcarrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 7
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{57.5}*\value{charcarrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 8
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{65}*\value{charcarrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 9
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{75}*\value{charcarrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 10
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{87.5}*\value{charcarrysizemod}}
		\fi
	}
	
	\setcounter{lightloadcount}{\value{heavyloadcount}/\real{3}}
	\setcounter{mediumloadcount}{2*\value{heavyloadcount}/\real{3}}
	\setcounter{liftaboveheadcount}{\value{heavyloadcount}}
	\setcounter{liftofgroundcount}{\value{heavyloadcount}*2}
	\setcounter{dragandpushcount}{\value{heavyloadcount}*5}

	\ifnum \value{totalweightcount} < \value{heavyloadcount}
			\renewcommand{\currentload}{\tfont HEAVY}
	\fi

	\ifnum \value{totalweightcount} < \value{mediumloadcount}
			\renewcommand{\currentload}{\tfont MEDIUM}
	\fi

	\ifnum\value{totalweightcount} < \value{lightloadcount}
			\renewcommand{\currentload}{\tfont LIGHT}
	\fi

	\tfont \arabic{lightloadcount} lbs.& \tfont \arabic{mediumloadcount} lbs. & \tfont \arabic{heavyloadcount} lbs.& & \tfont \arabic{liftaboveheadcount} lbs. & \tfont  \arabic{liftofgroundcount} lbs.& \tfont \arabic{dragandpushcount} lbs.\tabularnewline\hline
	\multicolumn{3}{c}{\uppercase{Current load}}& & \multicolumn{3}{c}{
	\ifnum\value{totalweightcount} < \value{lightloadcount}
		\tfont LIGHT
	\else

	\ifnum \value{totalweightcount} < \value{mediumloadcount}
		\tfont MEDIUM
	\else

	\ifnum \value{totalweightcount} < \value{heavyloadcount}
		\tfont HEAVY
		\else
		\tfont OVER ENCUMBERED
	\fi\fi\fi}\tabularnewline\hline
}

\newcommand{\notelist}{}
\newcommand\addnote[2]{
	 \apptocmd{\notelist}{\uppercase{#1}&\tfont#2\tabularnewline \hline}{}{}
}