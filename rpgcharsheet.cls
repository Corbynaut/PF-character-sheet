\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{rpgcharsheet}[2013/02/23]

\LoadClass{article}

\RequirePackage[margin=1cm,footskip=0.25in,a4paper]{geometry}
\RequirePackage[utf8]{inputenc}
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
\RequirePackage{tabto}
\RequirePackage{forloop}
\RequirePackage{fmtcount}
\RequirePackage{keyval}
\RequirePackage{currfile}
\ProcessOptions\relax
\RequirePackage{graphicx}

\RequirePackage{transparent}

%Settings
%========== BOX KEYS===========
\define@key{box}{family}{\def\box@family{#1}}
\define@key{box}{special family}{\def\box@specialfamily{#1}}

\newcommand\resetboxkeys{
	\setkeys{box}{family =, special family=}
}
\resetboxkeys
%========== SETTING KEYS===========
\define@key{setting}{font}{\def\setting@font{#1}}
\define@key{setting}{default box color}{\def\setting@defaultboxcolor{#1}}
\define@key{setting}{default font color}{\def\setting@defaultfontcolor{#1}}
\define@key{setting}{companion box color}{\def\setting@companionboxcolor{#1}}
\define@key{setting}{companion titlebox x}{\def\setting@ctbx{#1}}
\define@key{setting}{companion titlebox y}{\def\setting@ctby{#1}}
\define@key{setting}{companion titlebox height}{\def\setting@ctbheight{#1}}
\define@key{setting}{companion titlebox width}{\def\setting@ctbwidth{#1}}




%%Variables
%loop
\newcounter{loopcount}
\newcounter{innerloopcount}
\newcounter{tmpcount}
\newcommand\tmpcmd{}
\newcommand\tmptwocmd{}
%% Attribute box dimensions
\newcount\boxwidth\boxwidth=15
\newcount\boxheight\boxheight=9
\newcount\Moneyboxwidth\Moneyboxwidth=75
\newcount\Moneyboxheight\Moneyboxheight=9

\newcommand\initvariables[1][]
{
	\newcounter{#1favouredclasshpbonus}
	\newcounter{#1nonemodcount}
	\newcounter{#1strcount}
	\newcounter{#1dexcount}
	\newcounter{#1concount}
	\newcounter{#1intcount}
	\newcounter{#1wiscount}
	\newcounter{#1chacount}
	\newcounter{#1strmodcount}
	\newcounter{#1dexmodcount}
	\newcounter{#1conmodcount}
	\newcounter{#1intmodcount}
	\newcounter{#1wismodcount}
	\newcounter{#1chamodcount}
	\newcounter{#1strtmpcount}
	\newcounter{#1dextmpcount}
	\newcounter{#1contmpcount}
	\newcounter{#1inttmpcount}
	\newcounter{#1wistmpcount}
	\newcounter{#1chatmpcount}
	\newcounter{#1strtmpmodcount}
	\newcounter{#1dextmpmodcount}	
	\newcounter{#1contmpmodcount}
	\newcounter{#1inttmpmodcount}
	\newcounter{#1wistmpmodcount}
	\newcounter{#1chatmpmodcount}
	\newcounter{#1swim speedcount}
	\newcounter{#1climb speedcount}
	\newcounter{#1fly speedcount}
	\newcounter{#1burrow speedcount}
	\newcounter{#1armorspeedsquarecount}
	\newcounter{#1armorspeedpenaltycount}
	\newcounter{#1basespeedsquarecount}
	\newcounter{#1armorspeedcount}
	\newcounter{#1base speedcount}
	\newcounter{#1racebasespeedcount}
	\newcounter{#1hpcount}
	\newcounter{#1itemweightcount}
	\newcounter{#1tmpcasterlevelbonus}
	\newcounter{#1tmpClassRanks}
	\newcounter{#1tmpArmorPenalty}
	\newcounter{#1tmpspellmisc}
	\newcounter{#1containerweightcount}
	%AC
	\newcounter{#1acitemsbonus}
	\newcounter{#1acitemscheckpenalty}
	\newcounter{#1acitemsspellfailure}
	\newcounter{#1acitemsweight}
	\newcounter{#1flatfootedaccount}
	\newcounter{#1touchaccount}
	\newcounter{#1dodgebonuscount}
	\newcounter{#1deflectionbonuscount}
	\newcounter{#1dexbonuscount}
	\newcounter{#1armorbonuscount}
	\newcounter{#1shieldbonuscount}
	\newcounter{#1naturalbonuscount}
	\newcounter{#1miscbonuscount}	
	\newcounter{#1fortbonuscount}
	\newcounter{#1refbonuscount}
	\newcounter{#1willbonuscount}
	\newcounter{#1maxdexbonuscount} \setcounter{maxdexbonuscount}{9999}
	%Weapons
	\newcounter{#1weaponweightcount}
	\newcounter{#1tmpattackmodcount}
	\newcounter{#1tmpweapondamagecount}
	%Skills
	\newcounter{#1tmpmiscbonus}	
	\newcounter{#1skillranks}
	%Class
	\newcounter{#1levelcount}
	\newcounter{#1babcount}
	\newcounter{#1fortcount}
	\newcounter{#1refcount}
	\newcounter{#1forttmpcount}
	\newcounter{#1reftmpcount}
	\newcounter{#1willtmpcount}
	\newcounter{#1willcount}
	\newcounter{#1casterlevelcount}
	%Size
	\newcounter{#1sizemodcount}
	\newcounter{#1specialsizemodcount}
	\newcounter{#1stealthsizemodcount}
	\newcounter{#1flysizemodcount}
	\newcounter{#1carrysizemod}
	\setcounter{#1carrysizemod}{1}
	\newboolean{#1smallersizebool}

	\newcounter{#1sizeindex}	
	\newcounter{#1specialsizeindex}
	\newcounter{#1stealthsizeindex}
	\newcounter{#1flysizeindex}
	\newcounter{#1carrysizeindex}

	%Currency
	\newcounter{#1currencyweightcount}
	%Weight
	\newcounter{#1weightcount}	
	\newcounter{#1miscweightcount}
	%Loads and Lift
	\newcounter{#1lightloadcount}
	\newcounter{#1mediumloadcount}
	\newcounter{#1heavyloadcount}
	\newcounter{#1liftaboveheadcount}
	\newcounter{#1liftofgroundcount}
	\newcounter{#1dragandpushcount}
	\newcounter{#1basecapacitycount}
	\newcounter{#1tmpbasecapacitycount}
	\newcounter{#1seriescapacitycount}

	\newcounter{#1boolspells}
	\newcounter{#1boolfeats}
	\newcounter{#1boolfeatures}

	\forloop{loopcount}{0}{\value{loopcount}<10}
	{
		\expandafter\newcommand\csname #1default\arabic{loopcount}spelllist\endcsname{}
		\newboolean{#1default\arabic{loopcount}spelllistbool}
	}
	%%Lists
	\expandafter\newcommand\csname #1emptylist\endcsname{}
	\expandafter\newcommand\csname #1containerlist\endcsname{}
	\expandafter\newcommand\csname #1itemlist\endcsname{}
	\expandafter\newcommand\csname #1conditionalmodlist\endcsname{}
	\expandafter\newcommand\csname #1featlist\endcsname{}
	\expandafter\newcommand\csname #1featurelist\endcsname{}
	\expandafter\newcommand\csname #1acitemlist\endcsname{}
	\expandafter\newcommand\csname #1weaponlist\endcsname{}
	\expandafter\newcommand\csname #1skilllist\endcsname{}
	\expandafter\newcommand\csname #1classlist\endcsname{}
	\expandafter\newcommand\csname #1languagelist\endcsname{}
	\expandafter\newcommand\csname #1currencylist\endcsname{}
	\expandafter\newcommand\csname #1notelist\endcsname{}
	\expandafter\newcommand\csname #1printcasters\endcsname{}

	\expandafter\newcommand\csname #1magicitembelt\endcsname{}
	\expandafter\newcommand\csname #1magicitembody\endcsname{}
	\expandafter\newcommand\csname #1magicitemchest\endcsname{}
	\expandafter\newcommand\csname #1magicitemeyes\endcsname{}
	\expandafter\newcommand\csname #1magicitemfeet\endcsname{}
	\expandafter\newcommand\csname #1magicitemhands\endcsname{}
	\expandafter\newcommand\csname #1magicitemhead\endcsname{}
	\expandafter\newcommand\csname #1magicitemheadband\endcsname{}
	\expandafter\newcommand\csname #1magicitemneck\endcsname{}
	\expandafter\newcommand\csname #1magicitemringone\endcsname{}
	\expandafter\newcommand\csname #1magicitemringtwo\endcsname{}
	\expandafter\newcommand\csname #1magicitemshoulders\endcsname{}
	\expandafter\newcommand\csname #1magicitemwrist\endcsname{}

	\expandafter\newcommand\csname #1charname\endcsname{}
	\expandafter\newcommand\csname #1charplayername\endcsname{}
	\expandafter\newcommand\csname #1charalignment\endcsname{}
	\expandafter\newcommand\csname #1chardiety\endcsname{}
	\expandafter\newcommand\csname #1charrace\endcsname{}
	\expandafter\newcommand\csname #1charhomeland\endcsname{}
	\expandafter\newcommand\csname #1charsize\endcsname{}
	\expandafter\newcommand\csname #1chargender\endcsname{}
	\expandafter\newcommand\csname #1charage\endcsname{}
	\expandafter\newcommand\csname #1charheight\endcsname{}
	\expandafter\newcommand\csname #1charweight\endcsname{}
	\expandafter\newcommand\csname #1charhair\endcsname{}
	\expandafter\newcommand\csname #1chareyes\endcsname{}
	\expandafter\newcommand\csname #1charfavouredclass\endcsname{}	

}
\newcommand\currcompanion{}
\initvariables
% ========= KEY DEFINITIONS =========
\define@key{addcaster}{companion}{\def\caster@companion{#1}}
\define@key{addcaster}{offset}{\def\caster@offset{#1}}
\define@key{addcaster}{zeroth}{\def\caster@zeroth{#1}}
\define@key{addcaster}{first}{\def\caster@first{#1}}
\define@key{addcaster}{second}{\def\caster@second{#1}}
\define@key{addcaster}{third}{\def\caster@third{#1}}
\define@key{addcaster}{fourth}{\def\caster@fourth{#1}}
\define@key{addcaster}{fifth}{\def\caster@fifth{#1}}
\define@key{addcaster}{sixth}{\def\caster@sixth{#1}}
\define@key{addcaster}{seventh}{\def\caster@seventh{#1}}
\define@key{addcaster}{eighth}{\def\caster@eighth{#1}}
\define@key{addcaster}{ninth}{\def\caster@ninth{#1}}

\define@key{addweapon}{enhancement}{\def\weapon@enhancement{#1}}
\define@key{addweapon}{attack attribute}{\def\weapon@attackattribute{#1modcount}}
\define@key{addweapon}{attack bonus}{\def\weapon@attackbonus{#1}}
\define@key{addweapon}{damage attribute}{\def\weapon@damageattribute{#1modcount}}
\define@key{addweapon}{damage bonus}{\def\weapon@damagebonus{#1}}
\define@key{addweapon}{companion}{\def\weapon@companion{#1}}

\define@key{addspell}{companion}{\def\spell@companion{#1}}
\define@key{addspell}{caster level bonus}{\def\spell@clbonus{#1}}
\define@key{addspell}{caster}{\def\spell@caster{#1}}
\define@key{addspell}{prepared}{\def\spell@prepared{#1}}

\define@key{addgear}{type}{\def\gear@type{#1}}
\define@key{addgear}{companion}{\def\gear@companion{#1}}

\define@key{addacitem}{companion}{\def\acitem@companion{#1}}
\define@key{addacitem}{basespeed-30}{\def\acitem@basespeedthirty{#1}}
\define@key{addacitem}{basespeed-20}{\def\acitem@basespeedtwenty{#1}}

\define@key{addpower}{companion}{\def\power@companion{#1}}
\define@key{addpower}{parent}{\def\power@parent{#1}}
\define@key{addpower}{additional commands}{\def\power@commands{#1}}

\define@key{addclass}{calculate bab}{\def\class@calculatebab{#1}}
\define@key{addclass}{calculate fort}{\def\class@calculatefort{#1}}
\define@key{addclass}{calculate ref}{\def\class@calculateref{#1}}
\define@key{addclass}{calculate will}{\def\class@calculatewill{#1}}
\define@key{addclass}{companion}{\def\class@companion{#1}}

\define@key{addcompanion}{type}{\def\companion@type{#1}}
\define@key{addcompanion}{load file}{\def\companion@loadfile{#1}}

\define@key{printsheet}{type}{\def\printsheet@type{#1}}
\define@key{printsheet}{companion}{\def\printsheet@companion{#1}}

\define@key{addspellsavebonus}{companion}{\def\spellsavebonus@companion{#1}}

\define@key{addspellmisc}{companion}{\def\spellmisc@companion{#1}}

\define@key{addcondition}{companion}{\def\condition@companion{#1}}
\define@key{addcondition}{comma}{\def\condition@comma{#1}}
\define@key{addcondition}{line break}{\def\condition@linebreak{#1}}
% ========= KEY DEFAULTS =========
\newcommand\resetkeys{
	\setkeys{addcaster}{companion =, offset=0,zeroth=0,first=0,second=0,third=0,fourth=0,fifth=0,sixth=0,seventh=0,eighth=0,ninth=0}%
	\setkeys{addweapon}{enhancement = 0, attack attribute = str, attack bonus = 0, damage attribute = str, damage bonus = 0, companion =}%
	\setkeys{addspell}{companion =, caster level bonus = 0, caster =, prepared =}%
	\setkeys{addgear}{type = item, companion =}%
	\setkeys{addacitem}{basespeed-30 =-, basespeed-20 =-, companion =}%
	\setkeys{addpower}{companion =, parent =, additional commands =}%
	\setkeys{addclass}{calculate bab =,calculate fort =,calculate ref =,calculate will =, companion =}%
	\setkeys{addcompanion}{type =,load file=}%
	\setkeys{printsheet}{type =,companion=}%
	\setkeys{addspellsavebonus}{companion=}%
	\setkeys{addspellmisc}{companion=}%
	\setkeys{addcondition}{companion=, comma =, line break=}%
}
\resetkeys

%%Commands

\newcommand*{\IsInteger}[3]{%
    \IfStrEq{#1}{ }{%
        #3% is a blank string
    }{%
        \IfInteger{#1}{#2}{#3}%
    }%
}%

\def\nobreakhline{%
  \noalign{\ifnum0=`}\fi
    \penalty\@M
    \futurelet\@let@token\LT@@nobreakhline}
\def\LT@@nobreakhline{%
  \ifx\@let@token\hline
    \global\let\@gtempa\@gobble
    \gdef\LT@sep{\penalty\@M\vskip\doublerulesep}% <-- change here
  \else
    \global\let\@gtempa\@empty
    \gdef\LT@sep{\penalty\@M\vskip-\arrayrulewidth}% <-- change here
  \fi
  \ifnum0=`{\fi}%
  \multispan\LT@cols
     \unskip\leaders\hrule\@height\arrayrulewidth\hfill\cr
  \noalign{\LT@sep}%
  \multispan\LT@cols
     \unskip\leaders\hrule\@height\arrayrulewidth\hfill\cr
  \noalign{\penalty\@M}%
  \@gtempa}

\newcommand\plusminus[1]{
  \ifthenelse{\value{#1}>0}{$+\arabic{#1}$}{$\arabic{#1}$}
}

\newif\ifgraphicexist

\catcode`\*=11
\newcommand\imagetest[1]{%
 \begingroup
 \global\graphicexisttrue
   \let\input@path\Ginput@path
  \filename@parse{#1}%
  \ifx\filename@ext\relax
    \@for\Gin@temp:=\Gin@extensions\do{%
      \ifx\Gin@ext\relax
        \Gin@getbase\Gin@temp
      \fi}%
  \else
    \Gin@getbase{\Gin@sepdefault\filename@ext}%
    \ifx\Gin@ext\relax
       \global\graphicexistfalse
       \def\Gin@base{\filename@area\filename@base}%
       \edef\Gin@ext{\Gin@sepdefault\filename@ext}%
    \fi
  \fi
  \ifx\Gin@ext\relax
         \global\graphicexistfalse
    \else
       \@ifundefined{Gin@rule@\Gin@ext}%
         {\global\graphicexistfalse}%
         {}%
    \fi
  \ifx\Gin@ext\relax
   \gdef\imageextension{unknown}%
  \else
   \xdef\imageextension{\Gin@ext}%
  \fi
 \endgroup
 \ifgraphicexist
  \expandafter \@firstoftwo
 \else
  \expandafter \@secondoftwo
 \fi
 }
\catcode`\*=12

\newcommand\myincludegraphics[2][]{%
 \imagetest{#2}{\includegraphics[#1]{#2}}{}}


\def\attributes#1#2#3{%
\count@#1
\newcount\xcount\xcount=#1
\@for\tmp:=#3\do{%
\put(\xcount,#2){\framebox(15,9){\tmp}}%
\advance\xcount18
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

%change the attribute to calculate AC
\newcommand{\characmod}{dexmodcount}
%change the attribute to calculate Initiative
\newcommand{\charinitmod}{dexmodcount}
%change the attribute to calculate Reflex save
\newcommand{\charrefmod}{wismodcount}

%Text for Conditional Modifiers
\newcommand{\textconditionalmodifiers}{}
%Total HP
\newcommand{\chartotalhp}{\addtocounter{hpcount}{\maxof{\value{favouredclasshpbonus}+\value{conmodcount}*\value{levelcount}}{0}}\arabic{hpcount}}
%Text for Wounds/currentHP
\newcommand{\textwoundscurrenthp}{} %0/\arabic{charhpcount}
%Base speed
\newcommand\basespeedsquares[1][]{
	\setcounter{#1basespeedsquarecount}{\value{#1base speedcount}/5}\arabic{#1basespeedsquarecount}}
%Speed with armor
\newcommand\armorspeed[1][]{
	\setcounter{#1armorspeedcount}{\value{#1base speedcount}-\value{#1armorspeedpenaltycount}} \arabic{#1armorspeedcount}}
\newcommand{\armorspeedsquares}[1][]{
	\setcounter{#1armorspeedsquarecount}{\value{#1armorspeedcount}/5} \arabic{#1armorspeedsquarecount}}

%Name (swim, climb, fly, burrow), Value
\newcommand\setspeed[3][]{
	\setcounter{#1#2 speedcount}{#3}
}

%[Companion], attribute, value
\newcommand\setattribute[3][]{
	\setcounter{#1#2count}{#3}
	\calculateattributemod{#1#2modcount}{#1#2count}
}
\newcommand\calculateattributemod[2]{
	\ifthenelse{\value{#2} < 10}
	{
		\setcounter{#1}{(\value{#2} -11)/\real{2}}
	}
	{
		\setcounter{#1}{(\value{#2} -10)/\real{2}}
	}
}


%%Draw Box
\newcommand\selectedboxfamily{default}
% [family, special family, ], x, y size x, size y, text
\newcommand\drawbox[6][]{
	\setkeys{box}{#1}%
	\ifthenelse{\equal{\box@family}{}}{}{
		\ifcsname setting@\box@family \endcsname
			\renewcommand\selectedboxfamily{\csname setting@\box@family\endcsname}
		%\else	
			%\expandafter\expandafter\expandafter\define@key\expandafter{setting}\expandafter\expandafter{\csname \box@family box color\endcsname}{\edef\csname setting@\box@family boxcolor\endcsname{#1}}
			%\renewcommand\selectedboxfamily{\csname setting@\box@family\endcsname}
		\fi
	}

	\ifthenelse{\equal{\box@specialfamily}{}}{}{
		\ifcsname setting@\box@family \endcsname
			\renewcommand\selectedboxfamily{\csname setting@\box@specialfamily\endcsname}
		%\else	
			%\expandafter\expandafter\expandafter\define@key\expandafter{setting}\expandafter\expandafter{\csname \box@specialfamily box color\endcsname}{\edef\csname setting@\box@specialfamily boxcolor\endcsname{#1}}
		\fi
	}
	
	\put(#2,#3){%
    	\setlength\fboxsep{0pt}\colorbox{\csname setting@\selectedboxfamily boxcolor\endcsname}{%
      	\makebox(#4,#5){%
        	\color{\csname setting@\selectedboxfamily fontcolor\endcsname}{\centering\uppercase{#6}}%
      }%
    }%
  }%
	\resetboxkeys
}

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
  \put(\tmpcount,#2){\setlength\fboxsep{0pt}\colorbox{white}{\framebox(\boxwidth,\boxheight){\tmp}}}
  \ifnum\number\pluscount=0
  \advance\xcount by \boxwidth
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
  \put(#1,\downabitcount){\setlength\fboxsep{0pt}\colorbox{\setting@defaultboxcolor}{\makebox(#3,11){}}}%
  \advance\ycount1
  \put(#1,\ycount){\makebox(#3,\hcount){\color{\setting@defaultfontcolor}{\uppercase{#4}}}}
  \advance\hcount-7
  \advance\ycount-1
  \put(#1,\ycount){\makebox(#3,\hcount){\color{\setting@defaultfontcolor}{\tiny\scshape #5}}}
}

%%typed bonus
% [] Target, type, value
\newcommand\addtypedbonus[4][]{
	\ifcsname c@#1#2#3bonuscount\endcsname
		\setcounter{tmpmiscbonus}{\value{#1#2#3bonuscount}}
		\ifthenelse{\equal{#3}{untyped}\OR\equal{#2}{dodge}}
		{
			\addtocounter{#1#2#3bonuscount}{#4}
		}
		{
			\setcounter{#1#2#3bonuscount}{\maxof{\value{#1#2#3bonuscount}}{#4}}
		}
	\else
		\newcounter{#1#2#3bonuscount}
		\setcounter{tmpmiscbonus}{0}
		\setcounter{#1#2#3bonuscount}{#4}
	\fi
	\ifthenelse{\equal{#2}{str} \OR\equal{#2}{dex} \OR\equal{#2}{con} \OR\equal{#2}{int} \OR\equal{#2}{wis} \OR\equal{#2}{cha}}
	{
		\addtocounter{#1#2count}{\value{#1#2#3bonuscount}-\value{tmpmiscbonus}}
		\calculateattributemod{#1#2modcount}{#1#2count}
	}
	{	
		\addtocounter{#1#2bonuscount}{\value{#1#2#3bonuscount}-\value{tmpmiscbonus}}
	}
	\ifthenelse{\equal{#2}{dodge}}
	{
		\addtocounter{#1miscbonuscount}{\value{#1#2#3bonuscount}-\value{tmpmiscbonus}}
	}{}
	\ifcsname c@#1#2skillcount\endcsname
		\addtocounter{#1#2skillcount}{\value{#1#2#3bonuscount}-\value{tmpmiscbonus}}
	\fi
}
%[Companion] Target, value
\newcommand\addtmpbonus[3][]{
	\addtocounter{#1#2tmpcount}{#3}
	\ifthenelse{\equal{#2}{str} \OR\equal{#2}{dex} \OR\equal{#2}{con} \OR\equal{#2}{int} \OR\equal{#2}{wis} \OR\equal{#2}{cha}}
	{
		\setcounter{#1#2tmpmodcount}{(\value{#1#2tmpcount})/\real{2}}
		\addtocounter{#1#2count}{#3}
		\calculateattributemod{#1#2modcount}{#1#2count}
	}{}
}

%%Gear
\newcommand\printgearitems[1][]{ \lfont item& \lfont Qty&\lfont wt.\tabularnewline\hline \csname #1itemlist\endcsname \relax & & \relax \tabularnewline \textsc{Total} & & \arabic{#1itemweightcount}~lbs. \tabularnewline\hline}
\newcommand\printcontainers[1][]{ \lfont Container& \lfont Volume&\lfont wt.\tabularnewline\hline \csname #1containerlist\endcsname  \relax & & \relax \tabularnewline \textsc{Total} & & \arabic{#1containerweightcount}~lbs. \tabularnewline\hline}

%[] Name, Quantity/Volume, Weight
\newcommand\addgear[4][]{
 \setkeys{addgear}{#1}
 \newcounter{\gear@companion #2\gear@type weight}
 \ifthenelse{\equal{\gear@type}{item}}{
  	\addtocounter{\gear@companion #2\gear@type weight}{#3*#4}
  	\addtocounter{\gear@companion \gear@type weightcount}{#3* #4}
  }
 {
	\addtocounter{\gear@companion #2\gear@type weight}{#4}
  	\addtocounter{\gear@companion \gear@type weightcount}{#4}
  }
  \expandafter\apptocmd\expandafter{\csname \gear@companion\gear@type list\endcsname}{\tfont{#2} &\tfont #3&\setkeys{addgear}{#1} \tfont \arabic{\gear@companion #2\gear@type weight}~lbs.\tabularnewline \resetkeys}{}{}
  \resetkeys
}

%%Magic items
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
		\ifx \magicitemringtwo\emptylist
		#3
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
%Name, Text, additional commands
\newcommand\addfeat[4][]{
	#4
	\expandafter\apptocmd\expandafter{\csname #1featlist\endcsname}{\selectfont\scshape#2 &\tfont  #3\\\hline}{}{}
	\setcounter{#1boolfeats}{1}
}

%%Features, class features, racial traits etc
%[Companion] Name,Type, Text, Uses, additional commands
\newcommand\addfeature[6][]{
	#6
	\ifcsname #1feature#3list\endcsname%		
	\else
		\expandafter\newcommand\csname #1feature#3list\endcsname{\hline\rowcolor{black! 10}\multicolumn{3}{|c|}{\centering\uppercase{#3}}\\*\nobreakhline}
		\expandafter\apptocmd\expandafter{\csname #1featurelist\endcsname}{\csname #1feature#3list\endcsname}{}{}
		
	\fi
	\expandafter\apptocmd\expandafter{\csname #1feature#3list\endcsname}{\selectfont\scshape#2 &\tfont  #4&\selectfont\scshape#5\\\hline}{}{}
	\setcounter{#1boolfeatures}{1}
}

%%Spells
%Range (close, medium, long) , Caster, Caster level adjustment
\newcommand\spellrange[3]{
	\IsInteger{#3}{\setcounter{tmpcasterlevelbonus}{#3}}{\setcounter{tmpcasterlevelbonus}{0}}
	\ifthenelse{\equal{#1}{close}}{
		\ifcsname c@#2rangeclosecount\endcsname%
		\setcounter{#2rangeclosecount}{25+(\value{#2casterlevelcount}+\value{tmpcasterlevelbonus})/2*5}%
		\arabic{#2rangeclosecount} ft.%
		\else 25 ft.\fi%
	}{
	\ifthenelse{\equal{#1}{medium}}{
		\ifcsname c@#2rangemediumcount\endcsname%
		\setcounter{#2rangemediumcount}{100+(\value{#2casterlevelcount}+\value{tmpcasterlevelbonus})*10}%
		\arabic{#2rangemediumcount} ft.%
		\else 100 ft.\fi%
	}{
	\ifthenelse{\equal{#1}{long}}{\ifcsname c@#2rangelongcount\endcsname%
		\setcounter{#2rangelongcount}{400+(\value{#2casterlevelcount}+\value{tmpcasterlevelbonus})*40}%
		\arabic{#2rangelongcount} ft.%
		\else 400 ft.\fi%
	}{#1}}}
}

%Caster, Level, Name, Text, School, Duration, Range, Save, SR
\DeclareRobustCommand\addspell[9][]{	
	\setkeys{addspell}{#1}
	\ifcsdef{\spell@companion \spell@caster #2spelllist}
	{
		\ifthenelse{\boolean{\spell@companion \spell@caster#2spelllistbool}}{}{\setboolean{\spell@companion \spell@caster#2spelllistbool}{true}\expandafter\apptocmd\expandafter{\csname\spell@companion  \spell@caster#2spelllist\endcsname}{\rowcolor{\setting@defaultboxcolor! 10}\multicolumn{7}{|c|}{\centering\ORDINALstringnum{#2} \uppercase{TIER}}\\*\nobreakhline}{}{}}
		\expandafter\apptocmd\expandafter{\csname \spell@companion \spell@caster #2spelllist\endcsname}{
		\multicolumn{7}{|c|}{\selectfont\scshape#3}\\*\nobreakhline \setkeys{addspell}{#1}\ifthenelse{\equal{\spell@prepared}{}\OR\equal{\spell@prepared}{0}\OR\equal{\spell@prepared}{false}}{}{X}& \tfont#4&\tfont#5&\tfont#6&\setkeys{addspell}{#1}\tfont\setkeys{addspell}{#1}\spellrange{#7}{\spell@companion\spell@caster}{\spell@clbonus} &\tfont#8&\tfont#9\tabularnewline\hline}{}{}
		\addtocounter{\spell@companion\spell@caster#2knownspells}{1}
	}{		
		\ifthenelse{\boolean{\spell@companion default#2spelllistbool}}{}{\setboolean{\spell@companion default#2spelllistbool}{true}\expandafter\apptocmd\expandafter{\csname\spell@companion default#2spelllist\endcsname}{\rowcolor{\setting@defaultboxcolor! 10}\multicolumn{7}{|c|}{\centering\ORDINALstringnum{#2} \uppercase{TIER}}\\*\nobreakhline}{}{}}
		\expandafter\apptocmd\expandafter{\csname \spell@companion default#2spelllist\endcsname}{\multicolumn{7}{|c|}{\selectfont\scshape#3}\\*\nobreakhline \setkeys{addspell}{#1}\ifthenelse{\equal{\spell@prepared}{}\OR\equal{\spell@prepared}{0}\OR\equal{\spell@prepared}{false}}{}{X}& \tfont#4&\tfont#5&\tfont#6&\setkeys{addspell}{#1}\tfont\setkeys{addspell}{#1}\spellrange{#7}{\spell@companion\spell@caster}{\spell@clbonus} &\tfont#8&\tfont#9\tabularnewline\hline}{}{}		
		\setcounter{\spell@companion boolspells}{1}		
	}
	\resetkeys
}

%%AC
\newcommand{\tmparmorcounter}{armorbonuscount}

\newcommand{\printacitems}[1][]{\tabularnewline\rowcolor{\setting@defaultboxcolor}\leavevmode\color{\setting@defaultfontcolor} \uppercase{AC Items} & \leavevmode\color{\setting@defaultfontcolor} \lfont ac bonus & \leavevmode\color{\setting@defaultfontcolor} \lfont max dex & \leavevmode\color{\setting@defaultfontcolor} \lfont penalty &\leavevmode\color{\setting@defaultfontcolor}  \lfont spell failure & \leavevmode\color{\setting@defaultfontcolor} \lfont type & \leavevmode\color{\setting@defaultfontcolor} \lfont weight \tabularnewline\hline\csname #1acitemlist\endcsname
}

\newcommand{\addacitem}[8][]{
\setkeys{addacitem}{#1}
\ifthenelse{\equal{\detokenize{#7}}{\detokenize{light}}\OR\equal{\detokenize{#7}}{\detokenize{medium}}\OR\equal{\detokenize{#7}}{\detokenize{heavy}}\OR\equal{\detokenize{#7}}{\detokenize{armor}}}
	{\addtocounter{\acitem@companion armorbonuscount}{#3}}
	{\ifthenelse{\equal{\detokenize{#7}}{\detokenize{shield}}}
		{\setcounter{\acitem@companion shieldbonuscount}{\maxof{\value{\acitem@companion shieldbonuscount}}{#3}}}
		{\ifthenelse{\equal{\detokenize{#7}}{\detokenize{natural}}}
			{\addtocounter{\acitem@companion naturalbonuscount}{#3}}
			{\addtocounter{\acitem@companion miscbonuscount}{#3}}}}
 \IsInteger{#4}{\setcounter{\acitem@companion maxdexbonuscount}{\minof{\value{\acitem@companion maxdexbonuscount}}{#4}}}{}
  \ifthenelse {\value{\characmod}>\value{\acitem@companion maxdexbonuscount}}{\setcounter{\acitem@companion dexbonuscount}{\value{\acitem@companion maxdexbonuscount}}}{\setcounter{\acitem@companion dexbonuscount}{\value{\characmod}}}
  \addtocounter{\acitem@companion acitemsbonus}{#3}
  \addtocounter{\acitem@companion acitemscheckpenalty}{#5}
  \addtocounter{\acitem@companion acitemsspellfailure}{#6}
  \addtocounter{\acitem@companion acitemsweight}{#8}
  \ifthenelse{\value{\acitem@companion racebasespeedcount} = 30}{ \IsInteger{\acitem@basespeedthirty}{\addtocounter{\acitem@companion armorspeedpenaltycount}{\value{\acitem@companion racebasespeedcount}- \acitem@basespeedthirty}}{}}{\IsInteger{\acitem@basespeedtwenty}{\addtocounter{\acitem@companion armorspeedpenaltycount}{\value{\acitem@companion racebasespeedcount}-\acitem@basespeedtwenty}}{}}
 \expandafter\apptocmd\expandafter{\csname\acitem@companion acitemlist\endcsname}{\tfont#2 & \tfont#3 & \tfont#4 &\tfont #5 &\tfont #6\% & \tfont#7 & \tfont#8~lbs.\tabularnewline\hline}{}{}
 \resetkeys
}

\newcommand\calculateflatfootedac[1][]{
	\addtocounter{#1flatfootedaccount}{10+\value{#1armorbonuscount}+\value{#1deflectionbonuscount}+\value{#1shieldbonuscount}+\value{#1naturalbonuscount}+\value{#1miscbonuscount}+\value{#1sizemodcount}-\value{#1dodgebonuscount}}
	\arabic{#1flatfootedaccount}
}
\newcommand\calculatetouchac[1][]{
	\addtocounter{#1touchaccount}{10+\value{#1sizemodcount}+\value{#1deflectionbonuscount}+\value{#1miscbonuscount}+\value{#1dexbonuscount}}
	\arabic{#1touchaccount}
}

%%Weapons

\newcommand\printweapons[1][]{
	\begin{tabular}[t]{>{\centering}p{85\unitlength} >{\centering}p{55\unitlength} >{\centering}p{40\unitlength} >{\centering}p{40\unitlength} >{\centering}p{40\unitlength} >{\centering}p{20\unitlength} >{\centering}p{40\unitlength}>{\centering}p{25\unitlength} } 
	\rowcolor{\setting@defaultboxcolor}\leavevmode\color{\setting@defaultfontcolor} \uppercase{Weapons} & \leavevmode\color{\setting@defaultfontcolor}\lfont Attack modifiers & \leavevmode\color{\setting@defaultfontcolor}\lfont damage & \leavevmode\color{\setting@defaultfontcolor}\lfont critical &\leavevmode\color{\setting@defaultfontcolor} \lfont range & \leavevmode\color{\setting@defaultfontcolor}\lfont type &\leavevmode\color{\setting@defaultfontcolor} \lfont weight &\leavevmode\color{\setting@defaultfontcolor} \lfont ammo \tabularnewline\hline
	\csname #1weaponlist\endcsname
	\end{tabular}
}

\newcommand\addweapon[8][]{
	\setkeys{addweapon}{#1}
	\addtocounter{\weapon@companion weaponweightcount}{#7}
	\expandafter\apptocmd\expandafter{\csname\weapon@companion weaponlist\endcsname}{
		\setkeys{addweapon}{#1}
		\setcounter{tmpattackmodcount}{\value{\weapon@companion babcount}+\value{\weapon@companion \weapon@attackattribute}+\value{\weapon@companion sizemodcount}+\weapon@attackbonus+\weapon@enhancement}
		\setcounter{tmpweapondamagecount}{\value{\weapon@companion \weapon@damageattribute}+\weapon@damagebonus+\weapon@enhancement}
		\tfont#2 \ifthenelse{\weapon@enhancement = 0}{}{+\weapon@enhancement} & \setkeys{addweapon}{#1}\tfont \plusminus{tmpattackmodcount}\ifthenelse{\value{\weapon@companion babcount}>5}{/\addtocounter{tmpattackmodcount}{-5}\plusminus{tmpattackmodcount}}{}\ifthenelse{\value{\weapon@companion babcount}>10}{/\addtocounter{tmpattackmodcount}{-5}\plusminus{tmpattackmodcount}}{}\ifthenelse{\value{\weapon@companion babcount}>15}{/\addtocounter{tmpattackmodcount}{-5}\plusminus{tmpattackmodcount}}{}  & \tfont#3\ifthenelse{\value{tmpweapondamagecount} = 0}{}{\plusminus{tmpweapondamagecount}} &\tfont #4 &\tfont #5 & \tfont#6 & \tfont#7~lbs. & \tfont#8 \tabularnewline\hline \resetkeys}{}{}
}

\newcolumntype{A}[1]{@{}>{\centering\footnotesize}m{#1\unitlength}@{}}
\newcolumntype{B}[1]{@{}>{\footnotesize\scshape}m{#1\unitlength}@{}}
\newcolumntype{D}[1]{>{\itshape}p{#1\unitlength}}
\newcolumntype{E}[1]{@{}>{\lfont\raggedleft}b{#1\unitlength}@{}}
\newcolumntype{F}[1]{@{\hspace{-0.5ex}}>{\small\raggedleft}m{#1\unitlength}@{\hspace{0.5ex}}}

\newcommand\printskills[1][]{
	
	 \begin{tabular}[t]{A{2}A{10}B{80}A{21}B{7}A{21}A{7}A{21}A{7}A{21}}
    	\rowcolor{\setting@defaultboxcolor}& &\leavevmode\color{\setting@defaultfontcolor}\footnotesize \scshape Skill Names&\leavevmode\color{\setting@defaultfontcolor}\lfont Total\\ Bonus&&\leavevmode\color{\setting@defaultfontcolor}\lfont Ability\\ Mod.&&\leavevmode\color{\setting@defaultfontcolor}\lfont Ranks\\&&\leavevmode\color{\setting@defaultfontcolor}\lfont Misc.\\ Mod.\ \tabularnewline 
 	\csname #1skilllist\endcsname 
	&\lfont\mbox{\ooalign{$\checkmark$\cr\hidewidth$\square$\hidewidth\cr}}&\lfont Class Skill\hspace{2ex}  * trained only & & &\lfont Total & & \arabic{#1skillranks}&&
	\end{tabular}
}

%% Skill commands
%[Companion],Name, trained only, class, Abillity mod, ranks, misc
 \newcommand\addskill[7][]{
 \newcounter{#1#2skillcount}
 \newcounter{#1#2skillrankcount}
 \newcounter{#1#2bonuscount}
 \newcounter{#1#2skillclasscount}
 \newcounter{#1#2skilltrainedonly}
 \addtocounter{#1skillranks}{#6}
 \addtocounter{#1#2skilltrainedonly}{1}
 \addtocounter{#1#2skillrankcount}{#6}
 \addtocounter{#1#2bonuscount}{#7}
 \ifthenelse{\equal{#5}{str}\OR\equal{#5}{dex}}{\setcounter{#1tmpArmorPenalty}{\value{#1acitemscheckpenalty}}}{\setcounter{#1tmpArmorPenalty}{0}}
 \ifthenelse{\equal{#4}{}\OR\equal{#4}{0}}{\setcounter{#1tmpClassRanks}{0}}{\ifthenelse{\value{#1#2skillrankcount}>0}{\setcounter{#1tmpClassRanks}{3}}{\setcounter{#1tmpClassRanks}{0}}}
 \setcounter{#1#2skillcount}{\value{#1#2skillrankcount}+\value{#1#2bonuscount}+\value{#1#5modcount}+\value{#1tmpClassRanks}+\value{#1tmpArmorPenalty}}
 \expandafter\apptocmd\expandafter{\csname #1skilllist\endcsname}{\ifthenelse{\equal{#3}{}\OR\equal{#3}{0}}{}{*}&\classskillbox{#4}&\tfont{#2}&\ifthenelse{\equal{#3}{}\OR\equal{#3}{0} \OR \value{#1#2skillrankcount}>0}{\plusminus{#1#2skillcount}}{-}  & $=$ &\tabto*{1mm}\color{black! 35}\uppercase{#5}\tabto*{0mm}\color{black}\noindent\llap{\arabic{#1#5modcount}} & $+$ & $\arabic{#1#2skillrankcount}$ &  $+$ & $\arabic{#1#2bonuscount}$ \tabularnewline\cline{4-4}\cline{6-6}\cline{8-8}\cline{10-10}}{}{}
}

\newcommand\classskillbox[1]{
  \ifthenelse{\equal{#1}{}\OR\equal{#1}{0}}{$\square$}{\mbox{\ooalign{$\checkmark$\cr\hidewidth$\square$\hidewidth\cr}}}
}

%%Conditional Modifiers
%Text, additional commands
\newcommand\addcondition[2][]{
	\setkeys{addcondition}{#1}%
	\expandafter\apptocmd\expandafter{\csname \condition@companion conditionalmodlist\endcsname}{\tfont#2}{}{}
	\ifthenelse{\equal{\condition@comma}{}\OR\equal{\condition@comma}{no}\OR\equal{\condition@comma}{false}\OR\equal{\condition@comma}{0}}{}
	{
		\expandafter\apptocmd\expandafter{\csname \condition@companion conditionalmodlist\endcsname}{, }{}{}
	}
	\ifthenelse{\equal{\condition@linebreak}{}\OR\equal{\condition@linebreak}{no}\OR\equal{\condition@linebreak}{false}\OR\equal{\condition@linebreak}{0}}{}
	{
		\expandafter\apptocmd\expandafter{\csname \condition@companion conditionalmodlist\endcsname}{\\}{}{}
	}
	\resetkeys
}

\newcommand\writevalue[1]{
	\setcounter{tmpcount}{#1}%
	\arabic{tmpcount}%
}

\newcommand\writesignedvalue[1]{
	\setcounter{tmpcount}{#1}%
	\plusminus{tmpcount}%
}

%%Class stuff
%[], Name, level, BAB, Fort, Ref, Will
\newcommand\addclass[7][]{
	\setkeys{addclass}{#1}
	\ifthenelse{\equal{\csname \class@companion classlist\endcsname}{}}{\expandafter\apptocmd\expandafter{\csname \class@companion classlist\endcsname}{\fontsize{7}{7}\selectfont}{}{}}{\expandafter\apptocmd\expandafter{\csname \class@companion classlist\endcsname}{, }{}{}}
	\expandafter\apptocmd\expandafter{\csname \class@companion classlist\endcsname}{Lvl #3 #2}{}{}
	\newcounter{\class@companion #2casterlevelcount}
	\addtocounter{\class@companion #2casterlevelcount}{#3}
	\addtocounter{\class@companion casterlevelcount}{#3}
	\newcounter{\class@companion #2rangeclosecount}
	\newcounter{\class@companion #2rangemediumcount}
	\newcounter{\class@companion #2rangelongcount}
	\newcounter{\class@companion #2levelcount}
	\addtocounter{\class@companion #2levelcount}{#3}
	\addtocounter{\class@companion levelcount}{#3}
	\ifthenelse{\equal{\class@calculatebab}{}\OR\equal{\class@calculatebab}{no}\OR\equal{\class@calculatebab}{false}\OR\equal{\class@calculatebab}{0}}{
		\addtocounter{\class@companion babcount}{#4}
	}{
		\addtocounter{\class@companion babcount}{#3*#4}
	}
	\ifthenelse{\equal{\class@calculatefort}{}\OR\equal{\class@calculatefort}{no}\OR\equal{\class@calculatefort}{false}\OR\equal{\class@calculatefort}{0}}{
		\addtocounter{\class@companion fortcount}{#5}	
	}{
		\addtocounter{\class@companion fortcount}{#3*#5}
	}
	\ifthenelse{\equal{\class@calculateref}{}\OR\equal{\class@calculateref}{no}\OR\equal{\class@calculateref}{false}\OR\equal{\class@calculateref}{0}}{
		\addtocounter{\class@companion refcount}{#6}
	}{
		\addtocounter{\class@companion refcount}{#3*#6}
	}
	\ifthenelse{\equal{\class@calculateref}{}\OR\equal{\class@calculateref}{no}\OR\equal{\class@calculateref}{false}\OR\equal{\class@calculateref}{0}}{
		\addtocounter{\class@companion willcount}{#7}
	}{	
		\addtocounter{\class@companion willcount}{#3*#7}
	}
	\addtocounter{\class@companion levelcount}{#3}
	\resetkeys
}

\newcommand\lfont{\fontsize{5}{6}\selectfont\scshape}
\newcommand\tfont{\fontsize{7}{8.4}\selectfont}

\newcommand\name[2][]{\expandafter\renewcommand\csname #1charname\endcsname{#2}}
\newcommand\playername[2][]{\expandafter\renewcommand\csname #1charplayername\endcsname{#2}}
\newcommand\alignment[2][]{\expandafter\renewcommand\csname #1charalignment\endcsname{#2}}
\newcommand\diety[2][]{\expandafter\renewcommand\csname #1chardiety\endcsname{#2}}
\newcommand\race[3][]{
	\expandafter\renewcommand\csname #1charrace\endcsname{#2}
	\setcounter{#1racebasespeedcount}{#3}
	\setcounter{#1base speedcount}{#3}
}
\newcommand\homeland[2][]{\expandafter\renewcommand\csname #1charhomeland\endcsname{#2}}
%%Size
\setcounter{carrysizemod}{1}
\newcommand\size[2][]{
	\setboolean{#1smallersizebool}{false}
	\expandafter\renewcommand\csname #1charsize\endcsname{#2}
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Fine}}}{
		\setcounter{tmpcount}{-4}	
		\setboolean{#1smallersizebool}{true}
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Diminutive}}}{
		\setcounter{tmpcount}{-3}
		\setboolean{#1smallersizebool}{true}
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Tiny}}}{
		\setcounter{tmpcount}{-2}
		\setboolean{#1smallersizebool}{true}	
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Small}}}{
		\setcounter{tmpcount}{-1}
		\setboolean{#1smallersizebool}{true}	
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Medium}}}{
		\setcounter{tmpcount}{0}	
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Large}}}{
		\setcounter{tmpcount}{1}	
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Huge}}}{
		\setcounter{tmpcount}{2}	
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Gargantuan}}}{
		\setcounter{tmpcount}{3}	
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Colossal}}}{
		\setcounter{tmpcount}{4}	
	}{} 

	\addtocounter{#1sizeindex}{\value{tmpcount}}
	\addtocounter{#1specialsizeindex}{\value{tmpcount}}
	\addtocounter{#1stealthsizeindex}{\value{tmpcount}}
	\addtocounter{#1flysizeindex}{\value{tmpcount}}
	\addtocounter{#1carrysizeindex}{\value{tmpcount}}

	\calculatesizemod[#1]{\value{#1sizeindex}}
	\calculatespecialsizemod[#1]{\value{#1specialsizeindex}}
	\calculatestealthsizemod[#1]{\value{#1stealthsizeindex}}
	\calculateflysizemod[#1]{\value{#1flysizeindex}}
	\calculatecarrysizemod[#1]{\value{#1carrysizeindex}}
}

\newcommand\calculatesizemod[2][]{
	\ABSVALUE{#2}{\tmpcmd}
	\setcounter{#1sizemodcount}{-1*(#2*\tmpcmd/2+(2*#2)/(#2*#2+1))}
}

\newcommand\calculatespecialsizemod[2][]{
	\ABSVALUE{#2}{\tmpcmd}
	\setcounter{#1specialsizemodcount}{#2*\tmpcmd/2+(2*#2)/(#2*#2+1)}
}

\newcommand\calculatestealthsizemod[2][]{
	\setcounter{#1stealthsizemodcount}{-#2*4}
}
\newcommand\calculateflysizemod[2][]{
	\setcounter{#1flysizemodcount}{-#2*2}
}

\newcommand\calculatecarrysizemod[2][]{
	\ABSVALUE{#2}{\tmpcmd}
	\setcounter{tmpcount}{\tmpcmd}
	\POWER{2}{\arabic{tmpcount}}{\tmptwocmd}
	\setcounter{#1carrysizemod}{\tmptwocmd}
}

\newcommand\gender[2][]{\expandafter\renewcommand\csname #1chargender\endcsname{#2}}
\newcommand\age[2][]{\expandafter\renewcommand\csname #1charage\endcsname{#2}}
\newcommand\height[2][]{\expandafter\renewcommand\csname #1charheight\endcsname{#2}}
\newcommand\weight[2][]{\expandafter\renewcommand\csname #1charweight\endcsname{#2}}
\newcommand\hair[2][]{\expandafter\renewcommand\csname #1charhair\endcsname{\fontsize{8}{8}\selectfont #2}}
\newcommand\eyes[2][]{\expandafter\renewcommand\csname #1chareyes\endcsname{\fontsize{8}{8}\selectfont #2}}

%Languages
\newcommand\addlanguages[1]{
	\ifthenelse{\equal{\languagelist}{}}{}{\apptocmd{\languagelist}{, }{}{}}
	\apptocmd{\languagelist}{#1}{}{}
	}
\newcommand\charlanguagesspoken[1]{#1}
\newcommand\favouredclass[1]{
	\renewcommand{\charfavouredclass}{#1}
}

%Currency
\newcommand\printcurrency[1][]{
  	\begin{tabular}[t]{>{\centering}p{42\unitlength}>{\centering}p{42\unitlength}>{\centering}p{42\unitlength}>{\centering}p{42\unitlength}}
	\rowcolor{\setting@defaultboxcolor} \leavevmode\color{\setting@defaultfontcolor} \uppercase{Currency}& \leavevmode\lfont\color{\setting@defaultfontcolor}Carried& \leavevmode\lfont\color{\setting@defaultfontcolor}Carried weight&\leavevmode\lfont\color{\setting@defaultfontcolor}Stored\tabularnewline
	\csname #1currencylist\endcsname
	\end{tabular}
}

\newcommand\addcurrency[4]{
\newcounter{#1currencycarriedcount}
\newcounter{#1currencyweightcount}
\newcounter{#1currencystoredcount}
\setcounter{#1currencycarriedcount}{#2}
\setcounter{#1currencyweightcount}{#2*\real{#3}}
\setcounter{#1currencystoredcount}{#4}
\addtocounter{currencyweightcount}{\value{#1currencyweightcount}}
 \apptocmd{\currencylist}{\tfont#1 &\tfont \arabic{#1currencycarriedcount}&\tfont \arabic{#1currencyweightcount} &\tfont \arabic{#1currencystoredcount}\tabularnewline}{}{}
}

%Weight
\newcommand{\printweight}[1][]{
	\addtocounter{#1itemweightcount}{\value{#1containerweightcount}}
	\setcounter{#1weightcount}{\value{#1acitemsweight}+\value{#1weaponweightcount}+\value{#1currencyweightcount}+\value{#1itemweightcount}+\value{#1miscweightcount}}
	\arabic{#1acitemsweight} + \arabic{#1weaponweightcount} & \arabic{#1currencyweightcount} & \arabic{#1itemweightcount}& \arabic{#1miscweightcount}& \arabic{#1weightcount}
}

%Loads and Lift
\newcommand{\currentload}{\tfont OVER ENCUMBERED}
\newcommand{\tmpseries}{}

\newcommand{\printloadsandlift}[1][]{		

	\ifthenelse{\value{#1strcount} < 10}{\setcounter{#1heavyloadcount}{10*\value{#1strcount}}}
	{
		\setcounter{tmpbasecapacitycount}{\value{#1strcount}/10}
		\setcounter{basecapacitycount}{1+\value{#1strcount}-10*\value{tmpbasecapacitycount}}
		\POWER{4}{\arabic{tmpbasecapacitycount}}{\tmpseries}
		\setcounter{seriescapacitycount}{\tmpseries}
		\ifnum\value{basecapacitycount} = 1
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{25}}
		\fi
		\ifnum\value{basecapacitycount} = 2
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{28.75}}
		\fi
		\ifnum\value{basecapacitycount} = 3
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{32.5}}
		\fi
		\ifnum\value{basecapacitycount} = 4
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{37.5}}
		\fi
		\ifnum\value{basecapacitycount} = 5
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{43.75}}
		\fi
		\ifnum\value{basecapacitycount} = 6
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{50}}
		\fi
		\ifnum\value{basecapacitycount} = 7
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{57.5}}
		\fi
		\ifnum\value{basecapacitycount} = 8
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{65}}
		\fi
		\ifnum\value{basecapacitycount} = 9
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{75}}
		\fi
		\ifnum\value{basecapacitycount} = 10
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{87.5}}
		\fi
	}
	
	\ifthenelse{\boolean{#1smallersizebool}}{
		\setcounter{#1heavyloadcount}{\value{#1heavyloadcount}/\value{#1carrysizemod}}	
	}{
		\setcounter{#1heavyloadcount}{\value{#1heavyloadcount}*\value{#1carrysizemod}}	
	}
	\setcounter{#1lightloadcount}{\value{#1heavyloadcount}/3}
	\setcounter{#1mediumloadcount}{2*\value{#1heavyloadcount}/3}
	\setcounter{#1liftaboveheadcount}{\value{#1heavyloadcount}}
	\setcounter{#1liftofgroundcount}{\value{#1heavyloadcount}*2}
	\setcounter{#1dragandpushcount}{\value{#1heavyloadcount}*5}

	\ifnum \value{#1weightcount} < \value{#1heavyloadcount}
			\renewcommand{\currentload}{\tfont HEAVY}
	\fi

	\ifnum \value{#1weightcount} < \value{#1mediumloadcount}
			\renewcommand{\currentload}{\tfont MEDIUM}
	\fi

	\ifnum\value{#1weightcount} < \value{#1lightloadcount}
			\renewcommand{\currentload}{\tfont LIGHT}
	\fi

	\tfont \arabic{#1lightloadcount} lbs.& \tfont \arabic{#1mediumloadcount} lbs. & \tfont \arabic{#1heavyloadcount} lbs.& & \tfont \arabic{#1liftaboveheadcount} lbs. & \tfont  \arabic{#1liftofgroundcount} lbs.& \tfont \arabic{#1dragandpushcount} lbs.\tabularnewline\hline
	\multicolumn{3}{c}{\uppercase{Current load}}& & \multicolumn{3}{c}{
	\ifnum\value{#1weightcount} < \value{#1lightloadcount}
		\tfont LIGHT
	\else

	\ifnum \value{#1weightcount} < \value{#1mediumloadcount}
		\tfont MEDIUM
	\else

	\ifnum \value{#1weightcount} < \value{#1heavyloadcount}
		\tfont HEAVY
		\else
		\tfont OVER ENCUMBERED
	\fi\fi\fi}\tabularnewline\hline
}

\newcommand\addnote[2]{
	 \apptocmd{\notelist}{\uppercase{#1}&\tfont#2\tabularnewline \hline}{}{}
}

%%Lists
%\expandafter\newcommand\csname #2spellrange \endcsname{#6}{}{}
\newcommand{\printcustomlists}{}
%Name,Column ,Column definition
\newcommand\addcustomlist[3]{	
	\newboolean{bool#1list}
	\expandafter\newcommand\csname #1list\endcsname{}
	\expandafter\newcommand\csname #1listhead\endcsname{}
	\apptocmd{\printcustomlists}{
	\ifthenelse{\boolean{bool#1list}}
	{
		\newpage
		\begin{longtable}{#3} 
			\multicolumn{#2}{c}{\drawbox[family = list, special family = custom]{-210}{0}{420}{10}{#1}}
			\csname #1listhead\endcsname \endhead
			\hline
			\csname #1list\endcsname
		\end{longtable}
	}{}
}{}{}
}
%List name, row content
\newcommand\addtocustomlist[2]{
	\setboolean{bool#1list}{true}
	\expandafter\apptocmd\expandafter{\csname #1list\endcsname}{#2\\*\nobreakhline}{}{}
}
\newcommand\addheadtocustomlist[2]{
	\expandafter\apptocmd\expandafter{\csname #1listhead\endcsname}{#2\tabularnewline\hline}{}{}
}

%%Caster
%Name (must be a class name that was added via \addclass), Attribute
\newcommand\addcaster[3][]{
	\setkeys{addcaster}{#1}
	%Spell- lists
	\forloop{loopcount}{0}{\value{loopcount}<10}
	{
		\expandafter\newcommand\csname \caster@companion #2\arabic{loopcount}spelllist\endcsname{}
		\newboolean{\caster@companion #2\arabic{loopcount}spelllistbool}
		\newcounter{\caster@companion #2known\arabic{loopcount}spells}
		\newcounter{\caster@companion #2\arabic{loopcount}classspellslots}	
		\newcounter{\caster@companion #2\arabic{loopcount}miscspellslots}
		\newcounter{\caster@companion #2\arabic{loopcount}savebonus}
		\newcounter{\caster@companion #2\arabic{loopcount}knownspells}
		\ifthenelse{\value{loopcount}>0}{\newcounter{\caster@companion #2\arabic{loopcount}abillityspellslots}}{}
	}
	
	\setcounter{\caster@companion #20classspellslots}{\csname caster@zeroth\endcsname}
	\setcounter{\caster@companion #21classspellslots}{\csname caster@first\endcsname}
	\setcounter{\caster@companion #22classspellslots}{\csname caster@second\endcsname}
	\setcounter{\caster@companion #23classspellslots}{\csname caster@third\endcsname}
	\setcounter{\caster@companion #24classspellslots}{\csname caster@fourth\endcsname}
	\setcounter{\caster@companion #25classspellslots}{\csname caster@fifth\endcsname}
	\setcounter{\caster@companion #26classspellslots}{\csname caster@sixth\endcsname}
	\setcounter{\caster@companion #27classspellslots}{\csname caster@seventh\endcsname}
	\setcounter{\caster@companion #28classspellslots}{\csname caster@eighth\endcsname}
	\setcounter{\caster@companion#29classspellslots}{\csname caster@ninth\endcsname}

	%Domains, School, Bloodlines
	\expandafter\newcommand\csname \caster@companion #2powerlist\endcsname{}	

	\addtocounter{\caster@companion #2casterlevelcount}{\caster@offset}
	\newcounter{\caster@companion #2spelldc}
	
	\expandafter\apptocmd\expandafter{\csname \caster@companion printcasters\endcsname}{
		\setkeys{addcaster}{#1}
		 \newpagetitlebox[\caster@companion]					
		\forloop{loopcount}{0}{\value{loopcount}<10}
		{
			\addtocounter{\caster@companion #2\arabic{loopcount}savebonus}{10+\value{loopcount}+\value{\caster@companion #3modcount}}	
		}
		
		\forloop{loopcount}{1}{\value{loopcount}<10}
		{
			\setcounter{tmpcount}{\value{loopcount}-1}
			\forloop[-4]{innerloopcount}{\value{\caster@companion #3modcount}}{\value{innerloopcount}>\value{tmpcount}}{			
				\ifthenelse{\value{\caster@companion #2\arabic{loopcount}classspellslots}>0}{
					\addtocounter{\caster@companion #2\arabic{loopcount}abillityspellslots}{1}
				}{}
			}
		}

		\begin{picture}(420,200)
		\drawbox[family = caster, special family = caster name]{-11.5}{200}{420}{10}{#2}
		%\titlebox{0}{150}{28}{DEX}{dexterity}
		%\stretchattributes{33}{150}{102}{\arabic{chardexcount},\plusminus{chardexmodcount},\plusminus{chardextmpadjcount},\plusminus{chardextmpmodcount}}
		\drawbox[family = caster, special family = spells per day]{-11.5}{180}{205}{10}{spells per day}
		%Spells per day
		\stretchlabels{85}{170}{180}{TOTAL, class, abillity mod., misc}
		\stretchequalattributes{85}{155}{180}{\arabic{\caster@companion #20classspellslots},0,\arabic{\caster@companion #20miscspellslots}}
		\stretchequalattributes{85}{140}{180}{\arabic{\caster@companion #21classspellslots},\arabic{\caster@companion #21abillityspellslots},\arabic{\caster@companion #21miscspellslots}}
		\stretchequalattributes{85}{125}{180}{\arabic{\caster@companion #22classspellslots},\arabic{\caster@companion #22abillityspellslots},\arabic{\caster@companion #22miscspellslots}}
		\stretchequalattributes{85}{110}{180}{\arabic{\caster@companion #23classspellslots},\arabic{\caster@companion #23abillityspellslots},\arabic{\caster@companion #23miscspellslots}}
		\stretchequalattributes{85}{95}{180}{\arabic{\caster@companion #24classspellslots},\arabic{\caster@companion #24abillityspellslots},\arabic{\caster@companion #24miscspellslots}}
		\stretchequalattributes{85}{80}{180}{\arabic{\caster@companion #25classspellslots},\arabic{\caster@companion #25abillityspellslots},\arabic{\caster@companion #25miscspellslots}}
		\stretchequalattributes{85}{65}{180}{\arabic{\caster@companion #26classspellslots},\arabic{\caster@companion #26abillityspellslots},\arabic{\caster@companion #26miscspellslots}}
		\stretchequalattributes{85}{50}{180}{\arabic{\caster@companion #27classspellslots},\arabic{\caster@companion #27abillityspellslots},\arabic{\caster@companion #27miscspellslots}}
		\stretchequalattributes{85}{35}{180}{\arabic{\caster@companion #28classspellslots},\arabic{\caster@companion #28abillityspellslots},\arabic{\caster@companion #28miscspellslots}}
		\stretchequalattributes{85}{20}{180}{\arabic{\caster@companion #29classspellslots},\arabic{\caster@companion #29abillityspellslots},\arabic{\caster@companion #29miscspellslots}}
		%Spell level
		\put(54,137){\parbox[b][38\unitlength][t]{10\unitlength}{\centering \uppercase{Level}}}
		\put(60,125){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 0}}
		\put(60,109){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 1st}}
		\put(60,94){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 2nd}}
		\put(60,79){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 3rd}}
		\put(60,64){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 4th}}
		\put(60,49){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 5th}}
		\put(60,34){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 6th}}
		\put(60,19){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 7th}}
		\put(60,4){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 8th}}
		\put(60,-11){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 9th}}
		%Spell DC
		\put(32,137){\parbox[b][38\unitlength][t]{10\unitlength}{\centering \lfont\uppercase{Save DC}}}
		\put(30,155){\framebox(15,\boxheight){}}
		\put(27.5,157){\parbox[b][3\unitlength][b]{20\unitlength}{\centering  \arabic{\caster@companion #20savebonus}}}
		\put(30,140){\framebox(15,\boxheight){}}
		\put(27.5,142){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #21savebonus}}}
		\put(30,125){\framebox(15,\boxheight){}}
		\put(27.5,127){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #22savebonus}}}
		\put(30,110){\framebox(15,\boxheight){}}		
		\put(27.5,112){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #23savebonus}}}
		\put(30,95){\framebox(15,\boxheight){}}
		\put(27.5,97){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #24savebonus}}}
		\put(30,80){\framebox(15,\boxheight){}}
		\put(27.5,82){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #25savebonus}}}
		\put(30,65){\framebox(15,\boxheight){}}
		\put(27.5,67){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #26savebonus}}}
		\put(30,50){\framebox(15,\boxheight){}}
		\put(27.5,52){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #27savebonus}}}
		\put(30,35){\framebox(15,\boxheight){}}
		\put(27.5,37){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #28savebonus}}}
		\put(30,20){\framebox(15,\boxheight){}}		
		\put(27.5,22){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #29savebonus}}}
		%Spells known
		\put(3,137){\parbox[b][38\unitlength][t]{10\unitlength}{\centering \lfont\uppercase{Spells known}}}	
		\put(3,155){\framebox(15,\boxheight){}}
		\put(0.5,157){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #20knownspells}}}
		\put(3,140){\framebox(15,\boxheight){}}
		\put(0.5,142){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #21knownspells}}}
		\put(3,125){\framebox(15,\boxheight){}}
		\put(0.5,127){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #22knownspells}}}
		\put(3,110){\framebox(15,\boxheight){}}
		\put(0.5,112){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #23knownspells}}}
		\put(3,95){\framebox(15,\boxheight){}}
		\put(0.5,97){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #24knownspells}}}
		\put(3,80){\framebox(15,\boxheight){}}
		\put(0.5,82){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #25knownspells}}}
		\put(3,65){\framebox(15,\boxheight){}}
		\put(0.5,67){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #26knownspells}}}
		\put(3,50){\framebox(15,\boxheight){}}
		\put(0.5,52){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #27knownspells}}}
		\put(3,35){\framebox(15,\boxheight){}}
		\put(0.5,37){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #28knownspells}}}
		\put(3,20){\framebox(15,\boxheight){}}
		\put(0.5,22){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #29knownspells}}}
		%Domains, Bloodlines, Schools

		\drawbox[family = caster, special family = caste level]{203}{180}{65}{10}{Caster Level}
		\put(273,180.5){\framebox(15,\boxheight){}}
		\put(270,182.5){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #2casterlevelcount}}}
	
		\put(203,178){\begin{tabular}[t]{p{195\unitlength}}
		\csname \caster@companion #2powerlist\endcsname	
		%\csname #2powerlist\endcsname
		\end{tabular}
		}

		\end{picture}
		\begin{longtable}{| p{.015\textwidth}| p{.483\textwidth+.038\textwidth}| p{.1\textwidth} | p{.07\textwidth} | p{.07\textwidth} | p{.0427\textwidth}| p{.02\textwidth} |} 
			\multicolumn{7}{c}{\drawbox[family = caster, special family = caster spells]{-210}{-2.8}{420}{10}{#2 spells}}\tabularnewline
			\rowcolor{black}\centering\color{white}\lfont\uppercase{Prep.}&\centering \color{white}\lfont\uppercase{Text}&\centering\color{white}\lfont\uppercase{School}&\centering\color{white}\lfont\uppercase{Duration}&\centering\color{white}\lfont\uppercase{Range}&\centering\color{white}\lfont\uppercase{Save}&\centering\color{white}\lfont\uppercase{SR}\tabularnewline\hline
			\multicolumn{7}{c}{}\tabularnewline
			\endhead 
			\hline
			\csname \caster@companion #20spelllist\endcsname
			\csname \caster@companion #21spelllist\endcsname
			\csname \caster@companion #22spelllist\endcsname
			\csname \caster@companion #23spelllist\endcsname
			\csname \caster@companion #24spelllist\endcsname
			\csname \caster@companion #25spelllist\endcsname
			\csname \caster@companion #26spelllist\endcsname
			\csname \caster@companion #27spelllist\endcsname
			\csname \caster@companion #28spelllist\endcsname
			\csname \caster@companion #29spelllist\endcsname
		\end{longtable}}{}{}
	\resetkeys
}
%Caster, Level, Value
\newcommand\addspellsavebonus[4][]
{
	\setkeys{addspellsavebonus}{#1}%
	\addtocounter{\spellsavebonus@companion #2#3savebonus}{#4}
}

%[], category, Caster, Name
\newcommand\addpower[4][]{
	\setkeys{addpower}{#1}
	\ifcsdef{\power@companion #3#2list}{}{
		\expandafter\newcommand\csname \power@companion #3#2list\endcsname{}
		\expandafter\apptocmd\expandafter{\csname \power@companion #3#2list\endcsname}{\tabularnewline\rowcolor{\setting@defaultboxcolor} \leavevmode\color{\setting@defaultfontcolor}\centering\uppercase{#2}\tabularnewline}{}{} %\rowcolor{black} \leavevmode\color{white}\centering\uppercase{#2}\tabularnewline
		\expandafter\apptocmd\expandafter{\csname \power@companion #3powerlist\endcsname}{\setkeys{addpower}{#1} \csname \power@companion #3#2list\endcsname\tabularnewline}{}{}
	}
	\ifthenelse{\equal{\power@parent}{}}{		
		\ifcsdef{\power@companion #3#2#4list}{}{
			\expandafter\newcommand\csname \power@companion #3#2#4sublist\endcsname{}
			\expandafter\newcommand\csname \power@companion #3#2#4list\endcsname{}
		}
		\expandafter\apptocmd\expandafter{\csname \power@companion #3#2#4list\endcsname}{\setkeys{addpower}{#1}#4 \\\csname \power@companion #3#2#4sublist\endcsname}{}{}
	}{
		\expandafter\apptocmd\expandafter{\csname \power@companion #3#2\power@parent sublist\endcsname}{\hspace{20pt}\textbullet\, #4\\}{}{}
	}
	\power@commands
	\expandafter\apptocmd\expandafter{\csname \power@companion #3#2list\endcsname}{\setkeys{addpower}{#1}\csname \power@companion #3#2#4list\endcsname}{}{}
	\resetkeys
}

%Caster, Level, Type, Value
\newcommand\addspellmisc[5][]{
	\setkeys{addspellmisc}{#1}
	\ifcsname c@\spellmisc@companion #2#3#4miscspellslots\endcsname
		\setcounter{tmpspellmisc}{\value{\spellmisc@companion #2#3#4miscspellslots}}
		\ifthenelse{\equal{#4}{untyped}}
		{
			\addtocounter{\spellmisc@companion #2#3#4miscspellslots}{#5}
		}
		{
			\setcounter{\spellmisc@companion #2#3#4miscspellslots}{\maxof{\value{\spellmisc@companion #2#3#4miscspellslots}}{#5}}
		}	
	\else
		\newcounter{\spellmisc@companion #2#3#4miscspellslots}
		\setcounter{tmpspellmisc}{\value{\spellmisc@companion #2#3#4miscspellslots}}
		\setcounter{\spellmisc@companion #2#3#4miscspellslots}{#5}
	\fi
	
		\addtocounter{\spellmisc@companion #2#3miscspellslots}{\value{\spellmisc@companion #2#3#4miscspellslots}-\value{tmpspellmisc}}
}

%%Companion
\newcommand\printcompanions{}
%[Type] Name
\newcommand\addcompanion[2][]{
	\setkeys{addcompanion}{#1}
	\initvariables[#2]	
	\renewcommand\currcompanion{#2}
	\ifthenelse{\equal{\companion@loadfile}{}}{}
	{
		\input{Companions/\companion@loadfile}
	}
	\apptocmd{\printcompanions}{
		\renewcommand\currcompanion{#2}
		\newpagetitlebox[#2]
		\printsheet[#2]
	}{}{}
	\resetkeys
}
\newcommand\printsheet[1][]
{

}
\newcommand\newpagetitlebox[1][]
{
	\newpage
	\ifthenelse{\equal{#1}{}}{}{
		\begin{picture}(420,0)
		%\singletitlebox{\setting@ctbx}{\setting@ctby}{\setting@ctbwidth}{\setting@ctbheight}{#1}
		\drawbox[family = companion]{\setting@ctbx}{\setting@ctby}{\setting@ctbwidth}{\setting@ctbheight}{#1}
		\end{picture}
	}
}
%----------------------------------------------------------------------Settings----------------------------------------------------------------------
\newcommand\currsetting{default}
\newcommand\setting[1]{\renewcommand{\currsetting}{#1}}

\newcommand\newsetting[2][]{
	\expandafter\newcommand\csname setting#2\endcsname{#1}
}

\newcommand\setsetting[1]{
	\begingroup\edef\x{\endgroup\noexpand\setkeys{setting}{\csname setting#1\endcsname}}\x
	\graphicspath{{Images/#1/}{Images/default/}}
}

\newcommand\settingdefault{
	font = a,
	default box color = black,
	default font color = white,
	companion titlebox x = -11.5,
	companion titlebox y = 10,
	companion titlebox height = 10,
	companion titlebox width = 420
}
\setsetting{default}
\IfFileExists{Settings.tex}{\input{Settings.tex}}{}
\setsetting{\currsetting}
