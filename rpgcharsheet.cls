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
\RequirePackage{tabto}
\RequirePackage{forloop}
\RequirePackage{fmtcount}
\RequirePackage{keyval}
\ProcessOptions\relax
\RequirePackage{graphicx}
%%Variables
%loop
\newcounter{loopcount}
\newcounter{innerloopcount}
\newcounter{tmpcount}
%% Attribute box dimensions
\newcount\boxwidth\boxwidth=15
\newcount\boxheight\boxheight=9
\newcount\Moneyboxwidth\Moneyboxwidth=75
\newcount\Moneyboxheight\Moneyboxheight=9

\newcounter{favouredclasshpbonus}
\newcounter{strcount}
\newcounter{dexcount}
\newcounter{concount}
\newcounter{intcount}
\newcounter{wiscount}
\newcounter{chacount}
\newcounter{strmodcount}
\newcounter{dexmodcount}
\newcounter{conmodcount}
\newcounter{intmodcount}
\newcounter{wismodcount}
\newcounter{chamodcount}
\newcounter{strtmpadjcount}
\newcounter{dextmpadjcount}
\newcounter{contmpadjcount}
\newcounter{inttmpadjcount}
\newcounter{wistmpadjcount}
\newcounter{chatmpadjcount}
\newcounter{strtmpmodcount}
\newcounter{dextmpmodcount}
\newcounter{contmpmodcount}
\newcounter{inttmpmodcount}
\newcounter{wistmpmodcount}
\newcounter{chatmpmodcount}
\newcounter{swim speedcount}
\newcounter{climb speedcount}
\newcounter{fly speedcount}
\newcounter{burrow speedcount}
\newcounter{armorspeedsquarecount}
\newcounter{armorspeedpenaltycount}
\newcounter{basespeedsquarecount}
\newcounter{armorspeedcount}
\newcounter{base speedcount}
\newcounter{racebasespeedcount}
\newcounter{hpcount}
\newcounter{totalitemweightcount}
\newcounter{tmpcasterlevelbonus}
\newcounter{tmpClassRanks}
\newcounter{tmpArmorPenalty}
\newcounter{tmpspellmisc}
\newcounter{totalcontainerweightcount}
%AC
\newcounter{totalacitemsbonus}
\newcounter{totalacitemscheckpenalty}
\newcounter{totalacitemsspellfailure}
\newcounter{totalacitemsweight}
\newcounter{totalflatfootedaccount}
\newcounter{totaltouchaccount}
\newcounter{totaldodgebonuscount}
\newcounter{totaldeflectionbonuscount}
\newcounter{totaldexbonuscount}
\newcounter{totalarmorbonuscount}
\newcounter{totalshieldbonuscount}
\newcounter{totalnaturalbonuscount}
\newcounter{totalmiscbonuscount}
\newcounter{maxdexbonuscount} \setcounter{maxdexbonuscount}{9999}
%Weapons
\newcounter{totalweaponweightcount}
\newcounter{tmpattackmodcount}
\newcounter{tmpweapondamagecount}
%Skills
\newcounter{tmpmiscbonus}
\newcounter{totalskillranks}
%Class
\newcounter{levelcount}
\newcounter{babcount}
\newcounter{fortcount}
\newcounter{refcount}
\newcounter{willcount}
%\newcounter{sizemodcount}
\newcounter{totalcasterlevelcount}
%Size
\newcounter{sizemodcount}
\newcounter{specialsizemodcount}
\newcounter{stealthsizemodcount}
\newcounter{flysizemodcount}
\newcounter{carrysizemod}
%Currency
\newcounter{totalcurrencyweightcount}
%Weight
\newcounter{totalweightcount}
\newcounter{totalmiscweightcount}
%Loads and Lift
\newcounter{lightloadcount}
\newcounter{mediumloadcount}
\newcounter{heavyloadcount}
\newcounter{liftaboveheadcount}
\newcounter{liftofgroundcount}
\newcounter{dragandpushcount}
\newcounter{basecapacitycount}
\newcounter{tmpbasecapacitycount}
\newcounter{seriescapacitycount}

\newcounter{boolspells}
\newcounter{boolfeats}
\newcounter{boolfeatures}

\forloop{loopcount}{0}{\value{loopcount}<10}
{
	\expandafter\newcommand\csname default\arabic{loopcount}spelllist\endcsname{}
	\newboolean{default\arabic{loopcount}spelllistbool}
}

%%Lists
\newcommand{\emptylist}{}
\newcommand\containerlist{}
\newcommand{\itemlist}{}
\newcommand{\conditionalmodlist}{}
\newcommand{\featlist}{}
\newcommand{\featurelist}{}
\newcommand{\featureclasslist}{}
\newcommand{\featureracelist}{}
\newcommand{\featuretraitlist}{}
\newcommand{\featureflawlist}{}
\newcommand{\featuremisclist}{}
\newcommand{\acitemlist}{}
\newcommand{\weaponlist}{}
\newcommand{\skilllist}{}
\newcommand{\classlist}{}
\newcommand{\languagelist}{}
\newcommand{\currencylist}{}
\newcommand{\notelist}{}

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

% ========= KEY DEFINITIONS =========
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

\define@key{addspell}{caster level bonus}{\def\spell@clbonus{#1}}
\define@key{addspell}{caster}{\def\spell@caster{#1}}

\define@key{addgear}{type}{\def\gear@type{#1}}
\define@key{addgear}{companion}{\def\gear@companion{#1}}
% ========= KEY DEFAULTS =========
\newcommand\resetkeys{
	\setkeys{addcaster}{offset=0,zeroth=0,first=0,second=0,third=0,fourth=0,fifth=0,sixth=0,seventh=0,eighth=0,ninth=0}%
	\setkeys{addweapon}{enhancement = 0, attack attribute = str, attack bonus = 0, damage attribute = str, damage bonus = 0, companion =}%
	\setkeys{addspell}{caster level bonus = 0, caster =}%
	\setkeys{addgear}{type = item, companion =}%
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

\newcommand\plusminus[1]{
  \ifthenelse{\value{#1}>0}{$+\arabic{#1}$}{$\arabic{#1}$}
}


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
\newcommand{\charbasespeedsquares}{
	\setcounter{basespeedsquarecount}{\value{base speedcount}/5}\arabic{basespeedsquarecount}}
%Speed with armor
\newcommand{\chararmorspeed}{
	\setcounter{armorspeedcount}{\value{base speedcount}-\value{armorspeedpenaltycount}} \arabic{armorspeedcount}}
\newcommand{\chararmorspeedsquares}{
	\setcounter{armorspeedsquarecount}{\value{armorspeedcount}/5} \arabic{armorspeedsquarecount}}

%Name (swim, climb, fly, burrow), Value
\newcommand\setspeed[3][]{
	\setcounter{#1#2 speedcount}{#3}
}

%[Companion], attribute, value
\newcommand\setattribute[3][]{
	\setcounter{#1#2count}{#3}
	\setcounter{#1#2modcount}{(\value{#1#2count}-10)/\real{2}}
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
  \put(\tmpcount,#2){\framebox(\boxwidth,\boxheight){\tmp}}
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
  \put(#1,\downabitcount){\setlength\fboxsep{0pt}\colorbox{black}{\makebox(#3,11){}}}%
  \advance\ycount1
  \put(#1,\ycount){\makebox(#3,\hcount){\color{white}{\uppercase{#4}}}}
  \advance\hcount-7
  \advance\ycount-1
  \put(#1,\ycount){\makebox(#3,\hcount){\color{white}{\tiny\scshape #5}}}
}

\newcommand\singletitlebox[5]{
  \put(#1,#2){%
    \setlength\fboxsep{0pt}\colorbox{black}{%
      \makebox(#3,#4){%
        \color{white}{\centering\uppercase{#5}}%
      }%
    }%
  }%
}

%%typed bonus
% [] Target, type, value
\newcommand\addtypedbonus[4][]{
	\ifcsname c@total#2#3bonuscount\endcsname
		\setcounter{tmpmiscbonus}{\value{total#2#3bonuscount}}
		\ifthenelse{\equal{#3}{untyped}\OR\equal{#2}{dodge}}
		{
			\addtocounter{total#2#3bonuscount}{#4}
		}
		{
			\setcounter{total#2#3bonuscount}{\maxof{\value{total#2#3bonuscount}}{#4}}
		}
	\else
		\newcounter{total#2#3bonuscount}
		\setcounter{tmpmiscbonus}{0}
		\setcounter{total#2#3bonuscount}{#4}
	\fi
	
	\addtocounter{total#1#2bonuscount}{\value{total#2#3bonuscount}-\value{tmpmiscbonus}}
	\ifthenelse{\equal{#2}{dodge}}
	{
		\addtocounter{totalmiscbonuscount}{\value{total#2#3bonuscount}-\value{tmpmiscbonus}}
	}{}	
	\ifcsname c@#1#2skilltotalcount\endcsname
		\addtocounter{#1#2skilltotalcount}{\value{total#2#3bonuscount}-\value{tmpmiscbonus}}
	\fi
}

%%Gear
\newcommand\printgearitems{ \lfont item& \lfont Qty&\lfont wt.\tabularnewline\hline \itemlist \relax & & \relax \tabularnewline \textsc{Total} & & \arabic{totalitemweightcount}~lbs. \tabularnewline\hline}
\newcommand\printcontainers{ \lfont Container& \lfont Volume&\lfont wt.\tabularnewline\hline \containerlist  \relax & & \relax \tabularnewline \textsc{Total} & & \arabic{totalcontainerweightcount}~lbs. \tabularnewline\hline}

%[] Name, Quantity/Volume, Weight
\newcommand\addgear[4][]{
 \setkeys{addgear}{#1}
 \newcounter{\gear@companion #2\gear@type totalweight}
 \ifthenelse{\equal{\gear@type}{item}}{
  	\addtocounter{\gear@companion #2\gear@type totalweight}{#3*#4}
  	\addtocounter{\gear@companion total\gear@type weightcount}{#3* #4}
  }
 {
	\addtocounter{\gear@companion #2\gear@type totalweight}{#4}
  	\addtocounter{\gear@companion total\gear@type weightcount}{#4}
  }
  \expandafter\apptocmd\expandafter{\csname \gear@companion\gear@type list\endcsname}{\tfont{#2} &\tfont #3&\setkeys{addgear}{#1} \tfont \arabic{\gear@companion #2\gear@type totalweight}~lbs.\tabularnewline \resetkeys}{}{}
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
	\apptocmd{\featlist}{\selectfont\scshape#2 &\tfont  #3\tabularnewline\hline}{}{}
	\setcounter{#1boolfeats}{1}
}

%%Features, class features, racial traits etc
%Name,Type, Text, Uses, additional commands
\newcommand\addfeature[6][]{
	#6
	\ifthenelse {\equal{#3}{class}}{
	\apptocmd{\featureclasslist}{\selectfont\scshape#2 &\tfont  #4&\selectfont\scshape#5\tabularnewline\hline}{}{}
	}{
		\ifthenelse {\equal{#3}{flaw}}{
		\apptocmd{\featureflawlist}{\selectfont\scshape#2 &\tfont  #4&\selectfont\scshape#5\tabularnewline\hline}{}{}
		}{
			\ifthenelse {\equal{#3}{trait}}{
			\apptocmd{\featuretraitlist}{\selectfont\scshape#2 &\tfont  #4&\selectfont\scshape#5\tabularnewline\hline}{}{}
			}{
				\ifthenelse {\equal{#3}{race}}{
				\apptocmd{\featureracelist}{\selectfont\scshape#2 &\tfont  #4&\selectfont\scshape#5\tabularnewline\hline}{}{}
				}{
				\apptocmd{\featuremisclist}{\selectfont\scshape#2 &\tfont  #4&\selectfont\scshape#5\tabularnewline\hline}{}{}
				} 
	}}}
	\setcounter{boolfeatures}{1}
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
	\ifcsdef{\spell@caster #2spelllist}
	{
		\ifthenelse{\boolean{\spell@caster#2spelllistbool}}{}{\setboolean{\spell@caster#2spelllistbool}{true}\expandafter\apptocmd\expandafter{\csname \spell@caster#2spelllist\endcsname}{\rowcolor{black! 10}\multicolumn{8}{|c|}{\centering\ORDINALstringnum{#2} \uppercase{TIER}}\\\hline}{}{}}
		\expandafter\apptocmd\expandafter{\csname \spell@caster #2spelllist\endcsname}{
		\multicolumn{8}{|c|}{\selectfont\scshape#3}\\\hline & &\tfont#4&\tfont#5&\tfont#6&\tfont\setkeys{addspell}{#1}\spellrange{#7}{\spell@caster}{\spell@clbonus} &\tfont#8&\tfont#9\tabularnewline\hline}{}{}
		\addtocounter{\spell@caster#2knownspells}{1}
	}{		
		\ifthenelse{\boolean{default#2spelllistbool}}{}{\setboolean{default#2spelllistbool}{true}\expandafter\apptocmd\expandafter{\csname default#2spelllist\endcsname}{\rowcolor{black! 10}\multicolumn{8}{|c|}{\centering\ORDINALstringnum{#2} \uppercase{TIER}}\\\hline}{}{}}
		\expandafter\apptocmd\expandafter{\csname default#2spelllist\endcsname}{\multicolumn{8}{|c|}{\selectfont\scshape#3}\\\hline & &\tfont#4&\tfont#5&\tfont#6&\tfont\setkeys{addspell}{#1}\spellrange{#7}{\spell@caster}{\spell@clbonus} &\tfont#8&\tfont#9\tabularnewline\hline}{}{}		
		\setcounter{boolspells}{1}		
	}
	\resetkeys
}

%%AC
\newcommand{\tmparmorcounter}{totalarmorbonuscount}

\newcommand\printacitems{\rowcolor{black} \leavevmode\color{white} \uppercase{AC Items} & \leavevmode\color{white} \lfont ac bonus & \leavevmode\color{white} \lfont max dex & \leavevmode\color{white} \lfont penalty &\leavevmode\color{white}  \lfont spell failure & \leavevmode\color{white} \lfont type & \leavevmode\color{white} \lfont weight \tabularnewline\hline \acitemlist}

\newcommand{\addacitem}[9]{
\ifthenelse{\equal{\detokenize{#6}}{\detokenize{light}}\OR\equal{\detokenize{#6}}{\detokenize{medium}}\OR\equal{\detokenize{#6}}{\detokenize{heavy}}}
	{\addtocounter{totalarmorbonuscount}{#2}}
	{\ifthenelse{\equal{\detokenize{#6}}{\detokenize{shield}}}
		{\setcounter{totalshieldbonuscount}{\maxof{\value{totalshieldbonuscount}}{#2}}}
		{\ifthenelse{\equal{\detokenize{#6}}{\detokenize{natural}}}
			{\addtocounter{totalnaturalbonuscount}{#2}}
			{\addtocounter{totalmiscbonuscount}{#2}}}}
 %\IsInteger{#3}{\ifthenelse{\value{maxdexbonuscount}>#3}{\setcounter{maxdexbonuscount}{#3}}{ }} {}
 \IsInteger{#3}{\setcounter{maxdexbonuscount}{\minof{\value{maxdexbonuscount}}{#3}}}{}
  \ifthenelse {\value{\characmod}>\value{maxdexbonuscount}}{\setcounter{totaldexbonuscount}{\value{maxdexbonuscount}}}{\setcounter{totaldexbonuscount}{\value{\characmod}}}
  \addtocounter{totalacitemsbonus}{#2}
  \addtocounter{totalacitemscheckpenalty}{#4}
  \addtocounter{totalacitemsspellfailure}{#5}
  \addtocounter{totalacitemsweight}{#7}
  \ifthenelse{\value{racebasespeedcount} = 30}{ \IsInteger{#8}{\addtocounter{armorspeedpenaltycount}{\value{racebasespeedcount}-#8}}{}}{\IsInteger{#9}{\addtocounter{armorspeedpenaltycount}{\value{racebasespeedcount}-#9}}{}}
  %\ifthenelse{\value{racebasespeedcount} = 30}{\addtocounter{chararmorspeedpenaltycount}{\value{racebasespeedcount}-#8}}{\addtocounter{chararmorspeedpenaltycount}{\value{racebasespeedcount}-#9}}
  \apptocmd{\acitemlist}{\tfont#1 & \tfont#2 & \tfont#3 &\tfont #4 &\tfont #5\% & \tfont#6 & \tfont#7~lbs.\tabularnewline\hline}{}{}
}

\newcommand{\calculateflatfootedac}{
  \addtocounter{totalflatfootedaccount}{10+\value{totalarmorbonuscount}+\value{totaldeflectionbonuscount}+\value{totalshieldbonuscount}+\value{totalnaturalbonuscount}+\value{totalmiscbonuscount}+\value{sizemodcount}-\value{totaldodgebonuscount}}
  \arabic{totalflatfootedaccount}
}
\newcommand{\calculatetouchac}{
  \addtocounter{totaltouchaccount}{10+\value{sizemodcount}+\value{totaldeflectionbonuscount}+\value{totalmiscbonuscount}+\value{totaldexbonuscount}}
  \arabic{totaltouchaccount}
}

%%Weapons
\newcommand\addweapon[8][]{
	\addtocounter{totalweaponweightcount}{#7}
	\apptocmd{\weaponlist}{
		\setkeys{addweapon}{#1}
		\setcounter{tmpattackmodcount}{\value{babcount}+\value{\weapon@attackattribute}+\value{sizemodcount}+\weapon@attackbonus+\weapon@enhancement}
		\setcounter{tmpweapondamagecount}{\value{\weapon@damageattribute}+\weapon@damagebonus+\weapon@enhancement}
		\tfont#2 & \tfont \plusminus{tmpattackmodcount}\ifthenelse{\value{babcount}>5}{/\addtocounter{tmpattackmodcount}{-5}\plusminus{tmpattackmodcount}}{}\ifthenelse{\value{babcount}>10}{/\addtocounter{tmpattackmodcount}{-5}\plusminus{tmpattackmodcount}}{}\ifthenelse{\value{babcount}>15}{/\addtocounter{tmpattackmodcount}{-5}\plusminus{tmpattackmodcount}}{}  & \tfont#3\ifthenelse{\value{tmpweapondamagecount} = 0}{}{\plusminus{tmpweapondamagecount}} &\tfont #4 &\tfont #5 & \tfont#6 & \tfont#7~lbs. & \tfont#8 \tabularnewline\hline \resetkeys}{}{}
}

\newcolumntype{A}[1]{@{}>{\centering\footnotesize}m{#1\unitlength}@{}}
\newcolumntype{B}[1]{@{}>{\footnotesize\scshape}m{#1\unitlength}@{}}
\newcolumntype{D}[1]{>{\itshape}p{#1\unitlength}}
\newcolumntype{E}[1]{@{}>{\lfont\raggedleft}b{#1\unitlength}@{}}
\newcolumntype{F}[1]{@{\hspace{-0.5ex}}>{\small\raggedleft}m{#1\unitlength}@{\hspace{0.5ex}}}

%% Skill commands
%[Companion],Name, trained only, class, Abillity mod, ranks, misc
 \newcommand\addskill[7][]{
 \newcounter{#1#2skilltotalcount}
 \newcounter{#1#2skillrankcount}
 \newcounter{total#1#2bonuscount}
 \newcounter{#1#2skillclasscount}
 \newcounter{#1#2skilltrainedonly}
\addtocounter{#1totalskillranks}{#6}
 \addtocounter{#1#2skilltrainedonly}{1}
 \addtocounter{#1#2skillrankcount}{#6}
 \addtocounter{total#1#2bonuscount}{#7}
\ifthenelse{\equal{#5}{str}\OR\equal{#5}{dex}}{\setcounter{tmpArmorPenalty}{\value{totalacitemscheckpenalty}}}{\setcounter{tmpArmorPenalty}{0}}
 \ifthenelse{\equal{#4}{}\OR\equal{#4}{0}}{\setcounter{tmpClassRanks}{0}}{\ifthenelse{\value{#1#2skillrankcount}>0}{\setcounter{tmpClassRanks}{3}}{\setcounter{tmpClassRanks}{0}}}
 \setcounter{#1#2skilltotalcount}{\value{#1#2skillrankcount}+\value{total#1#2bonuscount}+\value{#5modcount}+\value{tmpClassRanks}+\value{tmpArmorPenalty}}
 \apptocmd{\skilllist}{\ifthenelse{\equal{#3}{}\OR\equal{#3}{0}}{}{*}&\classskillbox{#4}&\tfont{#2}&\plusminus{#1#2skilltotalcount} & $=$ &\tabto*{1mm}\color{lightgray}\uppercase{#5}\tabto*{0mm}\color{black}\noindent\llap{\arabic{#5modcount}} & $+$ & $\arabic{#1#2skillrankcount}$ &  $+$ & $\arabic{total#1#2bonuscount}$ \tabularnewline\cline{4-4}\cline{6-6}\cline{8-8}\cline{10-10}}{}{}
}

\newcommand\classskillbox[1]{
  \ifthenelse{\equal{#1}{}\OR\equal{#1}{0}}{$\square$}{\mbox{\ooalign{$\checkmark$\cr\hidewidth$\square$\hidewidth\cr}}}
}

%%Conditional Modifiers
%Text, additional commands
\newcommand\addcondition[2]{
#2
\apptocmd{\conditionalmodlist}{\tfont#1}{}{}
}

%%Class stuff
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
	\addtocounter{babcount}{#3}
	\addtocounter{fortcount}{#4}	
	\addtocounter{refcount}{#5}
	\addtocounter{willcount}{#6}
	\addtocounter{levelcount}{#2}
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
\newcommand\race[2]{
	\renewcommand\charrace{#1}
	\setcounter{racebasespeedcount}{#2}
	\setcounter{base speedcount}{#2}
}
\newcommand\homeland[1]{\renewcommand\charhomeland{#1}}
%%Size
\setcounter{carrysizemod}{1}
\newcommand\size[1]{
	\renewcommand\charsize{#1}
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Fine}}}{
		\setcounter{sizemodcount}{8}
	\setcounter{specialsizemodcount}{-8}
	\setcounter{flysizemodcount}{8}
	\setcounter{stealthsizemodcount}{16}
	% TODO carry mod for smaller creatures	
}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Diminutive}}}{
		\setcounter{sizemodcount}{4}
	\setcounter{specialsizemodcount}{-4}
	\setcounter{flysizemodcount}{6}
	\setcounter{stealthsizemodcount}{12}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Tiny}}}{
		\setcounter{sizemodcount}{2}
	\setcounter{specialsizemodcount}{-2}
	\setcounter{flysizemodcount}{4}
	\setcounter{stealthsizemodcount}{8}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Small}}}{
		\setcounter{sizemodcount}{1}
	\setcounter{specialsizemodcount}{-1}
	\setcounter{flysizemodcount}{2}
	\setcounter{stealthsizemodcount}{4}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Medium}}}{
		\setcounter{sizemodcount}{0}
	\setcounter{specialsizemodcount}{0}
	\setcounter{flysizemodcount}{0}
	\setcounter{stealthsizemodcount}{0}
	\setcounter{carrysizemod}{1}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Large}}}{
		\setcounter{sizemodcount}{-1}
	\setcounter{specialsizemodcount}{1}
	\setcounter{flysizemodcount}{-2}
	\setcounter{stealthsizemodcount}{-4}
	\setcounter{carrysizemod}{2}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Huge}}}{
		\setcounter{sizemodcount}{-2}
	\setcounter{specialsizemodcount}{2}
	\setcounter{flysizemodcount}{-4}
	\setcounter{stealthsizemodcount}{-8}
	\setcounter{carrysizemod}{4}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Gargantuan}}}{
		\setcounter{sizemodcount}{-4}
	\setcounter{specialsizemodcount}{4}
	\setcounter{flysizemodcount}{-6}
	\setcounter{stealthsizemodcount}{-12}
	\setcounter{carrysizemod}{8}}{} 
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{Colossal}}}{
		\setcounter{sizemodcount}{-8}
	\setcounter{specialsizemodcount}{8}
	\setcounter{flysizemodcount}{-8}
	\setcounter{stealthsizemodcount}{16}
	\setcounter{carrysizemod}{16}}{} 
}

\newcommand\gender[1]{\renewcommand\chargender{#1}}
\newcommand\age[1]{\renewcommand\charage{#1}}
\newcommand\height[1]{\renewcommand\charheight{#1}}
\newcommand\weight[1]{\renewcommand\charweight{#1}}
\newcommand\hair[1]{\renewcommand\charhair{\fontsize{8}{8}\selectfont #1}}
\newcommand\eyes[1]{\renewcommand\chareyes{\fontsize{8}{8}\selectfont #1}}

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
\newcommand{\printweight}{
	\addtocounter{totalitemweightcount}{\value{totalcontainerweightcount}}
	\setcounter{totalweightcount}{\value{totalacitemsweight}+\value{totalweaponweightcount}+\value{totalcurrencyweightcount}+\value{totalitemweightcount}+\value{totalmiscweightcount}+\value{totalcontainerweightcount}}
	\arabic{totalacitemsweight} + \arabic{totalweaponweightcount} & \arabic{totalcurrencyweightcount} & \arabic{totalitemweightcount}& \arabic{totalmiscweightcount}& \arabic{totalweightcount}
}

%Loads and Lift
\newcommand{\currentload}{\tfont OVER ENCUMBERED}
\newcommand{\tmpseries}{}

\newcommand{\printloadsandlift}{		

	\ifthenelse{\value{strcount} < 10}{\setcounter{heavyloadcount}{10*\value{strcount}}}
	{
		\setcounter{tmpbasecapacitycount}{\value{strcount}/10}
		\setcounter{basecapacitycount}{1+\value{strcount}-10*\value{tmpbasecapacitycount}}
		\POWER{4}{\arabic{tmpbasecapacitycount}}{\tmpseries}
		\setcounter{seriescapacitycount}{\tmpseries}
		\ifnum\value{basecapacitycount} = 1
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{25}*\value{carrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 2
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{28.75}*\value{carrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 3
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{32.5}*\value{carrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 4
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{37.5}*\value{carrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 5
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{43.75}*\value{carrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 6
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{50}*\value{carrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 7
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{57.5}*\value{carrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 8
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{65}*\value{carrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 9
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{75}*\value{carrysizemod}}
		\fi
		\ifnum\value{basecapacitycount} = 10
			\setcounter{heavyloadcount}{\value{seriescapacitycount}*\real{87.5}*\value{carrysizemod}}
		\fi
	}
	
	\setcounter{lightloadcount}{\value{heavyloadcount}/3}
	\setcounter{mediumloadcount}{2*\value{heavyloadcount}/3}
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

\newcommand\addnote[2]{
	 \apptocmd{\notelist}{\uppercase{#1}&\tfont#2\tabularnewline \hline}{}{}
}

%%Lists
%\expandafter\newcommand\csname #2spellrange \endcsname{#6}{}{}
\newcommand{\printlists}{}
%Name,Column ,Column definition
\newcommand\addcustomlist[3]{	
	\newboolean{bool#1list}
	\expandafter\newcommand\csname #1list\endcsname{}
	\expandafter\newcommand\csname #1listhead\endcsname{}
	\apptocmd{\printlists}{
	\ifthenelse{\boolean{bool#1list}}
	{
		\newpage
		\begin{longtable}{#3} 
			\multicolumn{#2}{c}{\singletitlebox{-210}{0}{420}{10}{#1}}
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
	\expandafter\apptocmd\expandafter{\csname #1list\endcsname}{#2\tabularnewline\hline}{}{}
}
\newcommand\addheadtocustomlist[2]{
	\expandafter\apptocmd\expandafter{\csname #1listhead\endcsname}{#2\tabularnewline\hline}{}{}
}

%%Caster
\newcommand\printcasters{}
%Name (must be a class name that was added via \addclass), Attribute
\newcommand\addcaster[3][]{
	\setkeys{addcaster}{#1}
	%Spell- lists
	\forloop{loopcount}{0}{\value{loopcount}<10}
	{
		\expandafter\newcommand\csname #2\arabic{loopcount}spelllist\endcsname{}
		\newboolean{#2\arabic{loopcount}spelllistbool}
		\newcounter{#2known\arabic{loopcount}spells}
		\newcounter{#2\arabic{loopcount}classspellslots}	
		\newcounter{#2\arabic{loopcount}miscspellslots}
		\newcounter{#2\arabic{loopcount}savebonus}
		\newcounter{#2\arabic{loopcount}knownspells}
		\ifthenelse{\value{loopcount}>0}{\newcounter{#2\arabic{loopcount}abillityspellslots}}{}
	}
	
	\setcounter{#20classspellslots}{\csname caster@zeroth\endcsname}
	\setcounter{#21classspellslots}{\csname caster@first\endcsname}
	\setcounter{#22classspellslots}{\csname caster@second\endcsname}
	\setcounter{#23classspellslots}{\csname caster@third\endcsname}
	\setcounter{#24classspellslots}{\csname caster@fourth\endcsname}
	\setcounter{#25classspellslots}{\csname caster@fifth\endcsname}
	\setcounter{#26classspellslots}{\csname caster@sixth\endcsname}
	\setcounter{#27classspellslots}{\csname caster@seventh\endcsname}
	\setcounter{#28classspellslots}{\csname caster@eighth\endcsname}
	\setcounter{#29classspellslots}{\csname caster@ninth\endcsname}

	%Domains, School, Bloodlines
	\expandafter\newcommand\csname #2domainlist\endcsname{}	
	\expandafter\newcommand\csname #2bloodlinelist\endcsname{}
	\expandafter\newcommand\csname #2schoollist\endcsname{}
	
	\newboolean{#2domainbool}
	\newboolean{#2bloodlinebool}
	\newboolean{#2schoolbool}
	\setboolean{#2domainbool}{false}
	\setboolean{#2bloodlinebool}{false}
	\setboolean{#2schoolbool}{false}

	\addtocounter{#2casterlevelcount}{\caster@offset}
	\newcounter{#2spelldc}
	
	\apptocmd{\printcasters}{
		\newpage					
		\forloop{loopcount}{0}{\value{loopcount}<10}
		{
			\addtocounter{#2\arabic{loopcount}savebonus}{10+\value{loopcount}+\value{#3modcount}}	
		}
		
		\forloop{loopcount}{1}{\value{loopcount}<10}
		{
			\setcounter{tmpcount}{\value{loopcount}-1}
			\forloop[-4]{innerloopcount}{\value{#3modcount}}{\value{innerloopcount}>\value{tmpcount}}{			
				\ifthenelse{\value{#2\arabic{loopcount}classspellslots}>0}{
					\addtocounter{#2\arabic{loopcount}abillityspellslots}{1}
				}{}
			}
		}

		\begin{picture}(420,200)
		\singletitlebox{-11.5}{200}{420}{10}{#2}
		%\titlebox{0}{150}{28}{DEX}{dexterity}
		%\stretchattributes{33}{150}{102}{\arabic{chardexcount},\plusminus{chardexmodcount},\plusminus{chardextmpadjcount},\plusminus{chardextmpmodcount}}
		\singletitlebox{-11.5}{180}{205}{10}{spells per day}
		%Spells per day
		\stretchlabels{85}{170}{180}{TOTAL, class, abillity mod., misc}
		\stretchequalattributes{85}{155}{180}{\arabic{#20classspellslots},0,\arabic{#20miscspellslots}}
		\stretchequalattributes{85}{140}{180}{\arabic{#21classspellslots},\arabic{#21abillityspellslots},\arabic{#21miscspellslots}}
		\stretchequalattributes{85}{125}{180}{\arabic{#22classspellslots},\arabic{#22abillityspellslots},\arabic{#22miscspellslots}}
		\stretchequalattributes{85}{110}{180}{\arabic{#23classspellslots},\arabic{#23abillityspellslots},\arabic{#23miscspellslots}}
		\stretchequalattributes{85}{95}{180}{\arabic{#24classspellslots},\arabic{#24abillityspellslots},\arabic{#24miscspellslots}}
		\stretchequalattributes{85}{80}{180}{\arabic{#25classspellslots},\arabic{#25abillityspellslots},\arabic{#25miscspellslots}}
		\stretchequalattributes{85}{65}{180}{\arabic{#26classspellslots},\arabic{#26abillityspellslots},\arabic{#26miscspellslots}}
		\stretchequalattributes{85}{50}{180}{\arabic{#27classspellslots},\arabic{#27abillityspellslots},\arabic{#27miscspellslots}}
		\stretchequalattributes{85}{35}{180}{\arabic{#28classspellslots},\arabic{#28abillityspellslots},\arabic{#28miscspellslots}}
		\stretchequalattributes{85}{20}{180}{\arabic{#29classspellslots},\arabic{#29abillityspellslots},\arabic{#29miscspellslots}}
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
		\put(27.5,157){\parbox[b][3\unitlength][b]{20\unitlength}{\centering  \arabic{#20savebonus}}}
		\put(30,140){\framebox(15,\boxheight){}}
		\put(27.5,142){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#21savebonus}}}
		\put(30,125){\framebox(15,\boxheight){}}
		\put(27.5,127){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#22savebonus}}}
		\put(30,110){\framebox(15,\boxheight){}}		
		\put(27.5,112){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#23savebonus}}}
		\put(30,95){\framebox(15,\boxheight){}}
		\put(27.5,97){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#24savebonus}}}
		\put(30,80){\framebox(15,\boxheight){}}
		\put(27.5,82){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#25savebonus}}}
		\put(30,65){\framebox(15,\boxheight){}}
		\put(27.5,67){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#26savebonus}}}
		\put(30,50){\framebox(15,\boxheight){}}
		\put(27.5,52){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#27savebonus}}}
		\put(30,35){\framebox(15,\boxheight){}}
		\put(27.5,37){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#28savebonus}}}
		\put(30,20){\framebox(15,\boxheight){}}		
		\put(27.5,22){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#29savebonus}}}
		%Spells known
		\put(3,137){\parbox[b][38\unitlength][t]{10\unitlength}{\centering \lfont\uppercase{Spells known}}}	
		\put(3,155){\framebox(15,\boxheight){}}
		\put(0.5,157){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#20knownspells}}}
		\put(3,140){\framebox(15,\boxheight){}}
		\put(0.5,142){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#21knownspells}}}
		\put(3,125){\framebox(15,\boxheight){}}
		\put(0.5,127){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#22knownspells}}}
		\put(3,110){\framebox(15,\boxheight){}}
		\put(0.5,112){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#23knownspells}}}
		\put(3,95){\framebox(15,\boxheight){}}
		\put(0.5,97){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#24knownspells}}}
		\put(3,80){\framebox(15,\boxheight){}}
		\put(0.5,82){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#25knownspells}}}
		\put(3,65){\framebox(15,\boxheight){}}
		\put(0.5,67){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#26knownspells}}}
		\put(3,50){\framebox(15,\boxheight){}}
		\put(0.5,52){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#27knownspells}}}
		\put(3,35){\framebox(15,\boxheight){}}
		\put(0.5,37){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#28knownspells}}}
		\put(3,20){\framebox(15,\boxheight){}}
		\put(0.5,22){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#29knownspells}}}
		%Domains, Bloodlines, Schools

		\singletitlebox{203}{180}{65}{10}{Caster Level}
		\put(273,180.5){\framebox(15,\boxheight){}}
		\put(270,182.5){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{#2casterlevelcount}}}
	
		\put(203,163){\begin{tabular}[t]{>{\centering}p{195\unitlength}@{}}		
		\csname #1bloodlinelist\endcsname
		\csname #1domainlist\endcsname		
		\csname #1schoollist\endcsname
		\end{tabular}
		}

		\end{picture}
		\begin{longtable}{| p{.015\textwidth}| p{.015\textwidth} | p{.483\textwidth+.038\textwidth}| p{.1\textwidth} | p{.07\textwidth} | p{.05\textwidth} | p{.03\textwidth}| p{.015\textwidth} |} 
			\multicolumn{8}{c}{\singletitlebox{-210}{0}{420}{10}{#2 spells}}\tabularnewline
			%\csname #1listhead\endcsname \endhead
			\hline
			\csname #20spelllist\endcsname
			\csname #21spelllist\endcsname
			\csname #22spelllist\endcsname
			\csname #23spelllist\endcsname
			\csname #24spelllist\endcsname
			\csname #25spelllist\endcsname
			\csname #26spelllist\endcsname
			\csname #27spelllist\endcsname
			\csname #28spelllist\endcsname
			\csname #29spelllist\endcsname
		\end{longtable}}{}{}
	\resetkeys
}
%Caster, Level, Value
\newcommand\addspellsavebonus[3]
{
	\addtocounter{#1#2savebonus}{#3}
}

%Caster, Name
\newcommand\adddomain[3]{
	#3
	\ifthenelse{\boolean{#1domainbool}}{}{\setboolean{#1domainbool}{true}\expandafter\apptocmd\expandafter{\csname #1domainlist\endcsname}{\rowcolor{black} \leavevmode\color{white} \uppercase{Domains}\tabularnewline}{}{}}
	\expandafter\apptocmd\expandafter{\csname #1domainlist\endcsname}{#2\tabularnewline}{}{}
}
%Caster, Name
\newcommand\addbloodline[3]{
	#3
	\ifthenelse{\boolean{#1bloodlinebool}}{}{\setboolean{#1bloodlinebool}{true}\expandafter\apptocmd\expandafter{\csname #1bloodlinelist\endcsname}{\rowcolor{black} \leavevmode\color{white} \uppercase{Bloodlines \& Patrons} \tabularnewline}{}{}}
	\expandafter\apptocmd\expandafter{\csname #1bloodlinelist\endcsname}{#2\tabularnewline}{}{}
}
%Caster, Name
\newcommand\addschool[3]{
	#3
	\ifthenelse{\boolean{#1schoolbool}}{}{\setboolean{#1schoolbool}{true}\expandafter\apptocmd\expandafter{\csname #1schoollist\endcsname}{\rowcolor{black} \leavevmode\color{white} \uppercase{Wizard speciality school}\tabularnewline}{}{}}
	\expandafter\apptocmd\expandafter{\csname #1schoollist\endcsname}{#2\tabularnewline}{}{}
}
%Caster, Level, Type, Value
\newcommand\addspellmisc[4]{
	\ifcsname c@#1#2#3miscspellslots\endcsname
		\setcounter{tmpspellmisc}{\value{#1#2#3miscspellslots}}
		\ifthenelse{\equal{#3}{untyped}}
		{
			\addtocounter{#1#2#3miscspellslots}{#4}
		}
		{
			\setcounter{#1#2#3miscspellslots}{\maxof{\value{#1#2#3miscspellslots}}{#4}}
		}	
	\else
		\newcounter{#1#2#3miscspellslots}
		\setcounter{tmpspellmisc}{\value{#1#2#3miscspellslots}}
		\setcounter{#1#2#3miscspellslots}{#4}
	\fi
	
		\addtocounter{#1#2miscspellslots}{\value{#1#2#3miscspellslots}-\value{tmpspellmisc}}
}

%%Companion

\newcommand\printcompanions{}
%Name, 
\newcommand\addcompanion[1]{

	\expandafter\newcommand\csname #1skilllist\endcsname{}
	\expandafter\newcommand\csname #1featlist\endcsname{}
	\expandafter\newcommand\csname #1featurelist\endcsname{}
	\expandafter\newcommand\csname #1notelist\endcsname{}

	\newcounter{companion#1str}
	\newcounter{companion#1strmod}
	\newcounter{companion#1dex}
	\newcounter{companion#1dexmod}
	\newcounter{companion#1con}
	\newcounter{companion#1conmod}
	\newcounter{companion#1int}
	\newcounter{companion#1intmod}
	\newcounter{companion#1wis}
	\newcounter{companion#1wismod}
	\newcounter{companion#1cha}
	\newcounter{companion#1chamod}

	\newcounter{companion#1ac}
	\newcounter{companion#1acdexbonus}
	\newcounter{companion#1naturalarmor}
	\newcounter{companion#1miscac}
	
	\newcounter{companion#1touchac}
	\newcounter{companion#1flatfootedac}
	\newcounter{companion#1bab}
	\newcounter{companion#1cmd}
	\newcounter{companion#1cmb}

	\newcounter{companion#1fort}
	\newcounter{companion#1ref}
	\newcounter{companion#1will}
	
	\newcounter{companion#1init}
	\newcounter{companion#1initmisc}

	\newcounter{companion#1speed}

	\newcounter{companion#1HP}

	
	\apptocmd{\printcompanions}{
		\newpage
		\begin{picture}(420,594)
		\singletitlebox{-11.5}{594}{420}{10}{Companion: #1}
		%% Labels
  \put(0,512){\makebox(28,3){\tiny\scshape attribute}}
  \stretchlabels{33}{512}{66}{ability score,  ability modifier}
  %% STR
  \titlebox{0}{500}{28}{STR}{strength}
\stretchattributes{33}{500}{66}{\arabic{companion#1str},\plusminus{companion#1strmod}}

  %% DEX
  \titlebox{0}{488}{28}{DEX}{dexterity}
  \stretchattributes{33}{488}{66}{\arabic{companion#1dex},\plusminus{companion#1dexmod}}
  
  %% CON
  \titlebox{0}{476}{28}{CON}{constitution}
  \stretchattributes{33}{476}{66}{\arabic{companion#1con},\plusminus{companion#1conmod}}
  
  %% INT
  \titlebox{0}{464}{28}{INT}{intelligence}
  \stretchattributes{33}{464}{66}{\arabic{companion#1int},\plusminus{companion#1intmod}}

  %% WIS
  \titlebox{0}{452}{28}{WIS}{wisdom}
  \stretchattributes{33}{452}{66}{\arabic{companion#1wis},\plusminus{companion#1wismod}}

  %% CHA
  \titlebox{0}{440}{28}{CHA}{charisma}
  \stretchattributes{33}{440}{66}{\arabic{companion#1cha},\plusminus{companion#1chamod}}


  %% HP
  \singletitlebox{71}{505}{26}{12}{HP}
  \put(101,505){\framebox(38,12){}}
  \put(101,512){\makebox(14,4){\tiny\scshape Total}}
  \put(101,505){\parbox[b][12\unitlength][c]{36\unitlength}{\raggedleft \arabic{companion#1HP}}}
  \put(141,505){\framebox(28,12){}}
  \put(141,512){\makebox(8,4){\tiny\scshape DR}}

  %% little boxes
  \put(71,500){\makebox(36,4){\tiny\scshape wounds/current hp}}
  \put(71,480){\framebox(98,20){}}
  \put(73,480){\parbox[b][18\unitlength][t]{82\unitlength}{\tiny \textwoundscurrenthp}}
  \put(71,475){\makebox(36,4){\tiny\scshape nonleathal damage}}
  \put(71,455){\framebox(98,20){}}
  
  %% INIT
  \titlebox{71}{440}{43}{INITIATIVE}{modifier}
  \stretchequalattributes{116}{440}{170}{\arabic{companion#1init},0}
  \stretchlabels{116}{434}{170}{TOTAL, dex modifier, misc modifier}
  
  %% AC
  \titlebox{0}{420}{27}{AC}{armour class}
  \equalattributes{29}{420}{10,\arabic{companion#1ac},\arabic{companion#1acdexbonus},\arabic{sizemodcount},\arabic{companion#1naturalarmor},\arabic{companion#1miscac}}{20}
  \scaleattributelabels{29}{410}{TOTAL,default, armor bonus,dex \mbox{modifier},size \mbox{modifier},natural armou,misc \mbox{modifier}}{20}

  %% Touch, Flat footed
  \titlebox{0}{400}{35}{TOUCH}{armour class}
  \attributes{40}{400}{\arabic{companion#1touchac}}
  \titlebox{80}{400}{55}{FLAT-FOOTED}{armour class}
  \attributes{140}{400}{\arabic{companion#1flatfootedac}}

  %% fort, reflex and will
  \titlebox{180}{507}{53}{fortitude}{(constitution)}
  \attributes{240}{507}{\arabic{companion#1fort}}
  \titlebox{180}{492}{53}{reflex}{(dexterity)}
  \attributes{240}{492}{\arabic{companion#1ref}}
  \titlebox{180}{477}{53}{will}{(wisdom)} 
   \attributes{240}{477}{\arabic{companion#1will}}

  %%Base attack bonus, spell resistance
  \singletitlebox{180}{439}{90}{11}{base attack bonus}
  \attributes{274}{440}{\arabic{babcount}}
  \singletitlebox{180}{454}{90}{11}{spell resistance}
  \attributes{274}{455}{0}
  
%%CMB and CMD
  \singletitlebox{180}{419}{21}{11}{cmb}
  \stretchequalattributes{205}{420}{335}{\arabic{babcount},\arabic{strmodcount},\arabic{specialsizemodcount}}
  \stretchlabels{205}{414}{335}{TOTAL, BAB,str mod., size mod.}
  \singletitlebox{180}{399}{21}{11}{cmd}
  \stretchequalattributes{205}{400}{335}{\arabic{babcount},\arabic{strmodcount},\arabic{dexmodcount},\arabic{specialsizemodcount} ,10}
  \stretchlabels{205}{394}{335}{TOTAL, BAB,str mod.,dex mod., size mod.,default}

  \singletitlebox{265}{483}{25}{35}{speed}
  \put(295,509){\framebox(40,\boxheight){}}
  \put(294,510){\begin{tabular}[b]{F{17}E{2}F{16}E{2}}\arabic{base speedcount} &ft. & \charbasespeedsquares& sq.\end{tabular}}
  \put(295,506){\parbox[b][3\unitlength][b]{40\unitlength}{\centering\lfont base speed}}
  \put(295,496){\framebox(40,\boxheight){}}
  \put(294,497){\begin{tabular}[b]{F{17}E{2}F{16}E{2}}\chararmorspeed &ft. & \chararmorspeedsquares& sq.\end{tabular}}
  \put(295,493){\parbox[b][3\unitlength][b]{40\unitlength}{\centering\lfont with armour}}
  \put(295,483){\framebox(40,\boxheight){}}
  \put(294,484){\begin{tabular}[b]{F{17}E{2}@{\hspace{1ex}/\hspace{-1.6ex}}F{16}E{2}}\arabic{fly speedcount} &ft. & 0& \end{tabular}}
  \put(295,480){\parbox[b][3\unitlength][b]{40\unitlength}{\lfont\centering fly/manoeuvrability}}
  \put(265,470){\framebox(20,\boxheight){}}
  \put(264,471){\begin{tabular}[b]{F{16}E{2}}\arabic{swim speedcount} &ft.\end{tabular}}
  \put(265,466){\parbox[b][3\unitlength][b]{20\unitlength}{\centering\lfont swim}}
  \put(290,470){\framebox(20,\boxheight){}}
  \put(289,471){\begin{tabular}[b]{F{16}E{2}}\arabic{climb speedcount} &ft.\end{tabular}}
  \put(290,466){\parbox[b][3\unitlength][b]{20\unitlength}{\centering\lfont climb}}
  \put(315,470){\framebox(20,\boxheight){}}
  \put(314,471){\begin{tabular}[b]{F{16}E{2}}\arabic{burrow speedcount} &ft.\end{tabular}}
  \put(315,466){\parbox[b][3\unitlength][b]{20\unitlength}{\centering\lfont burrow}}

		\end{picture}

	}{}{}

}

