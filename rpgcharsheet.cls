\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{rpgcharsheet}[2013/02/23]

\LoadClass{article}

\RequirePackage[margin=1cm,footskip=0.25in,a4paper]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx}
\RequirePackage{anyfontsize}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{dashrule}
\RequirePackage{etex}
\RequirePackage[table]{xcolor}
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
\RequirePackage{pgf, pgffor}
\RequirePackage{environ}
\ProcessOptions\relax
\RequirePackage{graphicx}
\RequirePackage{xparse}
\RequirePackage{array}
\RequirePackage{xtab}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

\RequirePackage{transparent}

\newcolumntype{A}[1]{@{}>{\centering\footnotesize}m{#1\unitlength}@{}}
\newcolumntype{B}[1]{@{}>{\footnotesize\scshape}m{#1\unitlength}@{}}
\newcolumntype{D}[1]{>{\itshape}p{#1\unitlength}}
\newcolumntype{E}[1]{@{}>{\lfont\raggedleft}b{#1\unitlength}@{}}
\newcolumntype{F}[1]{@{\hspace{-0.5ex}}>{\small\raggedleft}m{#1\unitlength}@{\hspace{0.5ex}}}

%Settings
%========== BOX KEYS===========
\define@key{box}{family}{\def\box@family{#1}}
\define@key{box}{special family}{\def\box@specialfamily{#1}}
\define@key{box}{subtext}{\def\box@subtext{#1}}

\newcommand\resetboxkeys{
	\setkeys{box}{family =, special family=, subtext =}
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
\newcounter{tmpcount2}
\newcounter{tmpcount3}
\newcounter{tmpcount4}
\newcounter{tmpcount5}
\newcounter{tmpcount6}
\newcounter{tmpcount7}
\newcounter{boolcount}
\newcounter{result}
\newboolean{tmpbool}
\newboolean{tmpbool2}
\global\def\tmpcmd{}
\newcommand\tmptwocmd{}
\newcommand\stackabletypes{untyped, dodge, racial}
\global\newcommand\companionlist{}
\newcounter{companioncount}
\global\expandafter\def\csname emptylist\endcsname{}
%% Attribute box dimensions
\newcount\boxwidth\boxwidth=15
\newcount\boxheight\boxheight=9
\newcount\Moneyboxwidth\Moneyboxwidth=75
\newcount\Moneyboxheight\Moneyboxheight=9
%%Spell overview
\global\def\cmd{}
\global\def\cmdtwo{}
\global\def\cmdthree{}
\newcounter{overviewnextlevel}
\newcounter{l_overviewone_seq_bool}
\newcounter{l_overviewtwo_seq_bool}
\newcounter{l_overviewthree_seq_bool}
%
\global\newboolean{slotnotfound}

\newcommand\initvariables[1][]
{
	\newcounter{#1favouredclasshpbonus}
	\newcounter{#1nonemodcount}
	\global\newtoggle{#1strcountnovaluebool}
	\global\newtoggle{#1dexcountnovaluebool}
	\global\newtoggle{#1concountnovaluebool}
	\global\newtoggle{#1intcountnovaluebool}
	\global\newtoggle{#1wiscountnovaluebool}
	\global\newtoggle{#1chacountnovaluebool}
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
	\newcounter{#1basespeedcount}
	\newcounter{#1racebasespeedcount}
	\newcounter{#1hpcount}
	\newcounter{#1itemweightcount}
	\newcounter{#1tmpcasterlevelbonus}
	\newcounter{#1tmpClassRanks}
	\newcounter{#1tmpArmorPenalty}
	\newcounter{#1tmpspellmisc}
	\newcounter{#1containerweightcount}
	\newcounter{#1initiativebonuscount}

	%Animate dead
	\newcounter{#1undeadcount}
	\newcounter{#1animationbucket}
	\newcounter{#1featbucket}
	\newcounter{#1spellbucket}
	\newcounter{#1corpse companionbucket}
	\newcounter{#1animationbucketcapacity}
	\newcounter{#1featbucketcapacity}
	\newcounter{#1corpse companionbucketcapacity}
	\global\expandafter\newcommand\csname#1undeadtype\endcsname{}
	
	\global\expandafter\def\csname#1acmod\endcsname{dex}
	\global\expandafter\def\csname#1cmbmod\endcsname{str}
	\newcounter{#1cmbmisccount}
	\global\expandafter\def\csname#1cmdstrmod\endcsname{str}
	\global\expandafter\def\csname#1cmddexmod\endcsname{dex}
	\global\expandafter\def\csname#1initiativemod\endcsname{dex}
	\global\expandafter\def\csname#1fortmod\endcsname{con}
	\global\expandafter\def\csname#1refmod\endcsname{dex}
	\global\expandafter\def\csname#1willmod\endcsname{wis}
	\global\expandafter\def\csname#1hpmod\endcsname{con}

	%Gear
	\newcounter{#1gearidcount}
	\newcounter{#1itemidcount}
	\newcounter{#1containeridcount}	

	%AC
	\newcounter{#1account}
	\newcounter{#1acitemsbonus}
	\newcounter{#1acitemscheckpenalty}
	\newcounter{#1acitemsspellfailure}
	\newcounter{#1acitemsweight}
	\newcounter{#1flatfootedaccount}
	\newcounter{#1flatfootedbonuscount}
	\newcounter{#1touchaccount}
	\newcounter{#1touchbonuscount}
	\newcounter{#1acdodgebonuscount}
	\newcounter{#1acdeflectionbonuscount}
	\newcounter{#1acdexbonuscount}
	\newcounter{#1acbonuscount}
	\newcounter{#1acarmorbonuscount}
	\newcounter{#1acshieldbonuscount}
	\newcounter{#1acnaturalbonuscount}
	\newcounter{#1acmiscbonuscount}	
	\newcounter{#1fortbonuscount}
	\newcounter{#1refbonuscount}
	\newcounter{#1willbonuscount}
	\newcounter{#1maxdexbonuscount} \setcounter{#1maxdexbonuscount}{9999}

	\newcounter{#1spellresistancebonuscount}

	\newcounter{#1armoridcount}

	%Weapons
	\newcounter{#1weaponweightcount}
	\newcounter{#1tmpattackmodcount}
	\newcounter{#1tmpweapondamagecount}
	%Skills
	\newcounter{#1tmpmiscbonus}	
	\newcounter{#1skillranks}
	\newcounter{#1skillcount}
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
	\global\newtoggle{#1smallersizebool}

	\newcounter{#1sizeindex}
	\newcounter{#1sizebonuscount}
	\newcounter{#1spezialsizebonuscount} %Comabt maneuver
	\newcounter{#1initialsizeindex}
	\newcounter{#1specialsizeindex}
	\newcounter{#1stealthsizeindex}
	\newcounter{#1flysizeindex}
	\newcounter{#1carrysizeindex}

	%Currency
	\newcounter{#1currencyweightcount}
	%Weight
	\newcounter{#1weightcount}	
	\newcounter{#1miscweightcount}
	\global\expandafter\def\csname #1currentload\endcsname{}
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
	\newcounter{#1boolspellsoverview}
	\newcounter{#1boolfeats}
	\newcounter{#1boolfeatures}

	\forloop{loopcount}{0}{\value{loopcount}<10}
	{
		\global\expandafter\newcommand\csname #1default\arabic{loopcount}spelllist\endcsname{}
		\global\newbool{#1default\arabic{loopcount}spelllistbool}
	}
	%%DR
	\global\expandafter\def\csname #1damagereduction\endcsname{}
	%%Lists
	\global\expandafter\def\csname #1containerlist\endcsname{}
	\global\expandafter\def\csname #1itemlist\endcsname{}
	\global\expandafter\def\csname #1conditionalmodlist\endcsname{}
	\global\expandafter\def\csname #1featlist\endcsname{}
	\global\expandafter\def\csname #1featurelist\endcsname{}
	\global\expandafter\def\csname #1alternatefeatlist\endcsname{}
	\global\expandafter\def\csname #1alternatefeaturelist\endcsname{}
	\global\expandafter\def\csname #1acitemlist\endcsname{}
	\global\expandafter\def\csname #1weaponlist\endcsname{}
	\global\expandafter\def\csname #1skilllist\endcsname{}
	\global\expandafter\def\csname #1classlist\endcsname{}
	\global\expandafter\def\csname #1languagelist\endcsname{}
	\global\expandafter\def\csname #1currencylist\endcsname{}
	\global\expandafter\def\csname #1notelist\endcsname{}
	\global\expandafter\def\csname #1printcasters\endcsname{}

	\global\expandafter\def\csname #1magicitembelt\endcsname{}
	\global\expandafter\def\csname #1magicitembody\endcsname{}
	\global\expandafter\def\csname #1magicitemchest\endcsname{}
	\global\expandafter\def\csname #1magicitemeyes\endcsname{}
	\global\expandafter\def\csname #1magicitemfeet\endcsname{}
	\global\expandafter\def\csname #1magicitemhands\endcsname{}
	\global\expandafter\def\csname #1magicitemhead\endcsname{}
	\global\expandafter\def\csname #1magicitemheadband\endcsname{}
	\global\expandafter\def\csname #1magicitemneck\endcsname{}
	\global\expandafter\def\csname #1magicitemringone\endcsname{}
	\global\expandafter\def\csname #1magicitemringtwo\endcsname{}
	\global\expandafter\def\csname #1magicitemshoulders\endcsname{}
	\global\expandafter\def\csname #1magicitemwrist\endcsname{}

	\global\expandafter\def\csname #1charname\endcsname{}
	\global\expandafter\def\csname #1charplayername\endcsname{}
	\global\expandafter\def\csname #1charalignment\endcsname{}
	\global\expandafter\def\csname #1chardeity\endcsname{}
	\global\expandafter\def\csname #1charrace\endcsname{}
	\global\expandafter\def\csname #1charhomeland\endcsname{}
	\global\expandafter\def\csname #1charsize\endcsname{}
	\global\expandafter\def\csname #1chargender\endcsname{}
	\global\expandafter\def\csname #1charage\endcsname{}
	\global\expandafter\def\csname #1charheight\endcsname{}
	\global\expandafter\def\csname #1charweight\endcsname{}
	\global\expandafter\def\csname #1charhair\endcsname{}
	\global\expandafter\def\csname #1chareyes\endcsname{}
	\global\expandafter\def\csname #1charfavouredclass\endcsname{}	

}
\global\def\currcompanion{}
\initvariables
% ========= KEY DEFINITIONS =========
\define@key{addcaster}{companion}{\def\caster@companion{#1}}
\define@key{addcaster}{offset}{\def\caster@offset{#1}}
\define@key{addcaster}{level name}{\def\caster@levelname{#1}}
\define@key{addcaster}{spell name}{
	\def\caster@spellname{#1}
	\ifthenelse{\equal{#1}{spells}}{}{\def\caster@spelloverviewname{#1}}
}
\define@key{addcaster}{spell-overview name}{\def\caster@spelloverviewname{#1}}
\define@key{addcaster}{calculate bonus spells}{\def\caster@calculatebonusspells{#1}}
\define@key{addcaster}{show dcs}{\def\caster@showdcs{#1}}
\define@key{addcaster}{show spell overview}{\def\caster@showspelloverview{#1}}
\define@key{addcaster}{show buckets}{\def\caster@showbuckets{#1}}
\define@key{addcaster}{animate dead multiplier}{\def\caster@animatedeadmultiplier{#1}}
\define@key{addcaster}{animate dead bonus}{\def\caster@animatedeadbonus{#1}}
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
\define@key{addweapon}{calculate size}{\def\weapon@calculatesize{#1}}
\define@key{addweapon}{attack attribute}{\def\weapon@attackattribute{#1modcount}}
\define@key{addweapon}{attack bonus}{\def\weapon@attackbonus{#1}}
\define@key{addweapon}{attack}{\def\weapon@attack{#1}}
\define@key{addweapon}{damage attribute}{\def\weapon@damageattribute{#1modcount}}
\define@key{addweapon}{damage bonus}{\def\weapon@damagebonus{#1}}
\define@key{addweapon}{notes}{\def\weapon@notes{#1}}
\define@key{addweapon}{companion}{\def\weapon@companion{#1}}
\define@key{addweapon}{category}{\def\weapon@category{#1}}
\define@key{addweapon}{base}{\def\weapon@base{#1}}
\define@key{addweapon}{masterwork}{\def\weapon@masterwork{#1}}

\define@key{addspell}{companion}{\def\spell@companion{#1}}
\define@key{addspell}{caster level bonus}{\def\spell@clbonus{#1}}
\define@key{addspell}{caster}{\def\spell@caster{#1}}
\define@key{addspell}{prepared}{\def\spell@prepared{#1}}
\define@key{addspell}{known}{\def\spell@known{#1}}

\define@key{addgear}{type}{\def\gear@type{#1}}
\define@key{addgear}{companion}{\def\gear@companion{#1}}
\define@key{addgear}{overwrite weight}{\def\gear@overwritetweight{#1}}
\define@key{addgear}{symbol}{\def\gear@symbol{#1}}

\define@key{addacitem}{companion}{\def\acitem@companion{#1}}
\define@key{addacitem}{armorspeed}{\def\acitem@armorspeed{#1}}
\define@key{addacitem}{enhancement}{\def\acitem@enhancement{#1}}
\define@key{addacitem}{notes}{\def\acitem@notes{#1}}
\define@key{addacitem}{category}{\def\acitem@category{#1}}
\define@key{addacitem}{base}{\def\acitem@base{#1}}

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

\define@key{unlockatlevel}{companion}{\def\unlockatlevel@companion{#1}}
\define@key{unlockatlevel}{class}{\def\unlockatlevel@class{#1}}

\define@key{addtypedbonus}{companion}{\def\addtypedbonus@companion{#1}}
\define@key{addtypedbonus}{stackablecategory}{\def\addtypedbonus@stackablecategory{#1}}

\define@key{containerenv}{weightless}{\def\containerenv@weightless{#1}}
\define@key{containerenv}{symbol}{\def\containerenv@symbol{#1}}

\define@key{addfeat}{companion}{\def\addfeat@companion{#1}}

\define@key{addfeature}{companion}{\def\addfeature@companion{#1}}

\define@key{animatedead}{companion}{\def\animatedead@companion{#1}}
\define@key{animatedead}{template}{\def\animatedead@template{#1}}
\define@key{animatedead}{bucket}{\def\animatedead@bucket{#1}}
\define@key{animatedead}{number}{\def\animatedead@number{#1}}

\define@key{setattribute}{companion}{\def\setattribute@companion{#1}}

\define@key{setspeed}{companion}{\def\setspeed@companion{#1}}

\define@key{addskill}{companion}{\def\addskill@companion{#1}}

\define@key{name}{companion}{\def\name@companion{#1}}

\define@key{playername}{companion}{\def\playername@companion{#1}}

\define@key{alignment}{companion}{\def\alignment@companion{#1}}

\define@key{deity}{companion}{\def\deity@companion{#1}}

\define@key{race}{companion}{\def\race@companion{#1}}

\define@key{homeland}{companion}{\def\homeland@companion{#1}}

\define@key{size}{companion}{\def\size@companion{#1}}

\define@key{gender}{companion}{\def\gender@companion{#1}}

\define@key{age}{companion}{\def\age@companion{#1}}

\define@key{height}{companion}{\def\height@companion{#1}}

\define@key{weight}{companion}{\def\weight@companion{#1}}

\define@key{hair}{companion}{\def\hair@companion{#1}}

\define@key{eyes}{companion}{\def\eyes@companion{#1}}

\define@key{addcurrency}{companion}{\def\addcurrency@companion{#1}}

\define@key{addlanguages}{companion}{\def\addlanguages@companion{#1}}

\define@key{favouredclass}{companion}{\def\favouredclass@companion{#1}}


% ========= KEY DEFAULTS =========
\newcommand\resetkeys{
	\setkeys{addcaster}{level name = caster, spell name = spells, spell-overview name = spell, calculate bonus spells = true, show dcs = true, show spell overview = true, companion = \currcompanion, offset=0, show buckets = false, animate dead multiplier = 1, animate dead bonus = 0,zeroth=infinity,first=0,second=0,third=0,fourth=0,fifth=0,sixth=0,seventh=0,eighth=0,ninth=0}%
	\setkeys{addweapon}{notes =, enhancement = 0, attack attribute = str, attack bonus = 0, attack =, damage attribute = str, damage bonus = 0, companion = \currcompanion, category =, base =, calculate size = false, masterwork = false}%
	\setkeys{addspell}{companion = \currcompanion, caster level bonus = 0, caster =, prepared =, known = true}%
	\setkeys{addgear}{type = item, companion = \currcompanion, overwrite weight = false, symbol =}%
	\setkeys{addacitem}{notes =,armorspeed =, companion = \currcompanion, enhancement = 0, category =, base =}%
	\setkeys{addpower}{companion = \currcompanion, parent =, additional commands =}%
	\setkeys{addclass}{calculate bab =,calculate fort =,calculate ref =,calculate will =, companion = \currcompanion}%
	\setkeys{addcompanion}{type =,load file=}%
	\setkeys{printsheet}{type =,companion= \currcompanion}%
	\setkeys{addspellsavebonus}{companion= \currcompanion}%
	\setkeys{addspellmisc}{companion= \currcompanion}%
	\setkeys{addcondition}{companion= \currcompanion, comma =, line break=}%
	\setkeys{unlockatlevel}{companion = \currcompanion, class =}%
	\setkeys{addtypedbonus}{companion = \currcompanion, stackablecategory =}%
	\setkeys{containerenv}{weightless = false, symbol = }%
	\setkeys{animatedead}{companion = \currcompanion, template = , bucket = none, number = 1}%
	\setkeys{addfeat}{companion = \currcompanion}%
	\setkeys{addfeature}{companion = \currcompanion}%
	\setkeys{setattribute}{companion = \currcompanion}%
	\setkeys{setspeed}{companion = \currcompanion}%
	\setkeys{addskill}{companion = \currcompanion}%
	
	\setkeys{name}{companion = \currcompanion}%
	\setkeys{playername}{companion = \currcompanion}%
	\setkeys{alignment}{companion = \currcompanion}%
	\setkeys{deity}{companion = \currcompanion}%
	\setkeys{race}{companion = \currcompanion}%
	\setkeys{homeland}{companion = \currcompanion}%
	\setkeys{size}{companion = \currcompanion}%	
	\setkeys{gender}{companion = \currcompanion}%
	\setkeys{age}{companion = \currcompanion}%
	\setkeys{height}{companion = \currcompanion}%
	\setkeys{weight}{companion = \currcompanion}%
	\setkeys{hair}{companion = \currcompanion}%
	\setkeys{eyes}{companion = \currcompanion}%
	\setkeys{addcurrency}{companion = \currcompanion}%
	\setkeys{addlanguages}{companion = \currcompanion}%
	\setkeys{favouredclass}{companion = \currcompanion}%
}
\resetkeys

%%Commands

\newcommand{\appendcmd}[2]{
		\g@addto@macro#1{#2}
}

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
    \gdef\LT@sep{\penalty\@M\vskip\doublerulesep}%
  \else
    \global\let\@gtempa\@empty
    \gdef\LT@sep{\penalty\@M\vskip-\arrayrulewidth}% 
  \fi
  \ifnum0=`{\fi}%
  \multispan\LT@cols
     \unskip\leaders\hrule\@height\arrayrulewidth\hfill\cr
  \noalign{\LT@sep}%
  \multispan\LT@cols
     \unskip\leaders\hrule\@height\arrayrulewidth\hfill\cr
  \noalign{\penalty\@M}%
  \@gtempa}

\newcommand\plusminus[1]{%
  \ifthenelse{\value{#1}>0}{$+\arabic{#1}$}{$\arabic{#1}$}%
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

%%Adds a stackable type to either the weapon, armor or default list
%\addstackabletype[weapon or armor]{Type}
\newcommand{\addstackabletype}[1]{
	 \expandafter\appendcmd\expandafter{\stackabletypes}{,#1}
}

%changeattribute [companion], Target, new attribute
%Changes skill, ac, cmb, cmd, initiative, fort, ref, will, and hp attribute
%To change the attribute to attack and/or damage of weapons use the appropriate optional parametes r(attack attribute and/or damage attribute) of \addweapon
%To change the attribute of a skill, the appropriate skill must be defined beforehand
%ac must be changed before the first \addacitem command
\newcommand\changeattribute[3][]
{
	%check if command exists
	\ifcsname #1#2mod\endcsname
		\expandafter\def\csname #1#2mod\endcsname{#3}
	\fi
}

\newcommand\writeattributename[1]
{%
	\ifthenelse{\expandafter\equal{#1}{str}}%
	{%
		strength%
	}{}%
	\ifthenelse{\expandafter\equal{#1}{dex}}%
	{%
		dexterity%
	}{}%
	\ifthenelse{\expandafter\equal{#1}{con}}%
	{%
		constitution%
	}{}%
	\ifthenelse{\expandafter\equal{#1}{int}}%
	{%
		intelligence%
	}{}%
	\ifthenelse{\expandafter\equal{#1}{wis}}%
	{%
		wisdom%
	}{}%
	\ifthenelse{\expandafter\equal{#1}{cha}}%
	{%
		charisma%
	}{}%
}

%\unlockatlevel [companion, class], level, command
%Unlcok commands at the specific level
\newcommand\unlockatlevel[3][]
{
	\setkeys{unlockatlevel}{#1}%
	\ifthenelse{\value{\unlockatlevel@companion\unlockatlevel@class levelcount} = #2 \OR \value{\unlockatlevel@companion\unlockatlevel@class levelcount} > #2}
	{
		#3
	}{}
	\resetkeys
}

%Text for Conditional Modifiers
\newcommand{\textconditionalmodifiers}{}
%Total HP
\newcommand{\chartotalhp}[1][]{\addtocounter{#1hpcount}{\maxof{\value{#1favouredclasshpbonus}+\value{#1\csname #1hpmod\endcsname modcount}*\value{#1levelcount}}{0}}\arabic{#1hpcount}}
%Text for Wounds/currentHP
\newcommand{\textwoundscurrenthp}{} %0/\arabic{charhpcount}
%Base speed
\newcommand\basespeedsquares[1][]{
	\setcounter{#1basespeedsquarecount}{\value{#1basespeedcount}/5}\arabic{#1basespeedsquarecount}}
%Speed with armor
\newcommand\armorspeed[1][]{
	\setcounter{#1armorspeedcount}{\value{#1basespeedcount}-\value{#1armorspeedpenaltycount}} \arabic{#1armorspeedcount}}
\newcommand{\armorspeedsquares}[1][]{
	\setcounter{#1armorspeedsquarecount}{\value{#1armorspeedcount}/5} \arabic{#1armorspeedsquarecount}}

%Name (swim, climb, fly, burrow), Value
\newcommand\setspeed[3][]{
	\setkeys{setspeed}{#1}
	\setcounter{\setspeed@companion #2 speedcount}{#3}
	\resetkeys
}

%[Companion], attribute, value
\newcommand\setattribute[3][]{
	\setkeys{setattribute}{#1}
	\ifthenelse{\equal{#3}{-}}{
	    \global\toggletrue{\setattribute@companion #2countnovaluebool}
	}
	{
        \setcounter{\setattribute@companion #2count}{#3}  
	}
	\calculateattributemod{\setattribute@companion #2modcount}{\setattribute@companion #2count}
	\resetkeys
}
\newcommand\calculateattributemod[2]{
    \iftoggle{#2novaluebool}
    {
        \setcounter{#1}{0}
    }
    {
    	\ifthenelse{\value{#2} < 10}
    	{
            \setcounter{#1}{(\value{#2} -11)/\real{2}}
    	}
    	{
    		\setcounter{#1}{(\value{#2} -10)/\real{2}}
    	}
	}
}


%%Draw Box
\newcommand\selectedboxfamily{default}
% [family, special family, ], x, y, size x, size y, text
\newcommand\drawbox[6][]{%
	\setkeys{box}{#1}%
 	\newcount\hcount\hcount=#5%
	\setcounter{tmpcount}{1*\real{#4}-1}%
	\setcounter{tmpcount2}{1*\real{#5}-1}%
	\ifthenelse{\equal{\box@family}{}}{}{%
		\ifcsname setting@\box@family \endcsname%
			\renewcommand\selectedboxfamily{\csname setting@\box@family\endcsname}%
		%\else	
			%\expandafter\expandafter\expandafter\define@key\expandafter{setting}\expandafter\expandafter{\csname \box@family box color\endcsname}{\edef\csname setting@\box@family boxcolor\endcsname{#1}}
			%\renewcommand\selectedboxfamily{\csname setting@\box@family\endcsname}
		\fi%
	}%
	\ifthenelse{\equal{\box@specialfamily}{}}{}{%
		\ifcsname setting@\box@family \endcsname%
			\renewcommand\selectedboxfamily{\csname setting@\box@specialfamily\endcsname}%
		%\else	
			%\expandafter\expandafter\expandafter\define@key\expandafter{setting}\expandafter\expandafter{\csname \box@specialfamily box color\endcsname}{\edef\csname setting@\box@specialfamily boxcolor\endcsname{#1}}
		\fi%
	}%	
	\ifx\box@subtext\empty%
		\put(#2,#3){%
    			\framebox(#4,#5){\setlength\fboxsep{0pt}\colorbox{\csname setting@\selectedboxfamily boxcolor\endcsname}{%
      				\makebox(#4,#5){%
        					\color{\csname setting@\selectedboxfamily fontcolor\endcsname}{%
							\centering{\MakeUppercase{#6}}%
						}%
					}%
      				}%
    			}%
  		}%
	\else%
		\advance\hcount 1%
		\put(#2,#3){%
    			\framebox(#4,#5){\setlength\fboxsep{0pt}\colorbox{\csname setting@\selectedboxfamily boxcolor\endcsname}{%
      				\makebox(#4,#5){%
        					\color{\csname setting@\selectedboxfamily fontcolor\endcsname}{%
							\vspace{3pt}\centering{\MakeUppercase{#6}}%
						}%
					}%
      				}%
    			}%
  		}%	
		\advance\hcount -7%
		\addtocounter{tmpcount}{-4}%
		\put(#2,#3){%    			
      			\makebox(#4,\hcount){%
        				\color{\csname setting@\selectedboxfamily fontcolor\endcsname}{%
					\tiny\scshape \box@subtext%
				}%
			}%
      			
  		}%
    	\fi%
	\resetboxkeys%
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
  \put(#1,\ycount){\makebox(#3,\hcount){\color{\setting@defaultfontcolor}{\MakeUppercase{#4}}}}
  \advance\hcount-7
  \advance\ycount-1
  \put(#1,\ycount){\makebox(#3,\hcount){\color{\setting@defaultfontcolor}{\tiny\scshape #5}}}
}

%%typed bonus
% [] Target, type, value
\newcommand\addtypedbonus[4][]{

	\setkeys{addtypedbonus}{#1}
	\setcounter{tmpcount}{0}

	\ifcsname c@\addtypedbonus@companion#2#3bonuscount\endcsname
		\setcounter{tmpmiscbonus}{\value{\addtypedbonus@companion#2#3bonuscount}}
		\foreach\member in \stackabletypes {
			\ifthenelse{\equal{#3}{\member}}
			{
				\setcounter{tmpcount}{1}
			}{}
		}
		\ifthenelse{\value{tmpcount} = 1}
		{
			\addtocounter{\addtypedbonus@companion#2#3bonuscount}{#4}
		}
		{
			\setcounter{\addtypedbonus@companion#2#3bonuscount}{\maxof{\value{\addtypedbonus@companion#2#3bonuscount}}{#4}}
		}

	\else
		\newcounter{\addtypedbonus@companion#2#3bonuscount}
		\setcounter{tmpmiscbonus}{0}
		\setcounter{\addtypedbonus@companion#2#3bonuscount}{#4}
	\fi

	\ifthenelse{\equal{#2}{str} \OR\equal{#2}{dex} \OR\equal{#2}{con} \OR\equal{#2}{int} \OR\equal{#2}{wis} \OR\equal{#2}{cha}}
	{
		\addtocounter{\addtypedbonus@companion#2count}{\value{\addtypedbonus@companion#2#3bonuscount}-\value{tmpmiscbonus}}
		\calculateattributemod{\addtypedbonus@companion#2modcount}{\addtypedbonus@companion#2count}
	}
	{	
		\addtocounter{\addtypedbonus@companion#2bonuscount}{\value{\addtypedbonus@companion#2#3bonuscount}-\value{tmpmiscbonus}}
	}
	\ifthenelse{\equal{#3}{dodge}}
	{
		\addtocounter{\addtypedbonus@companion acmiscbonuscount}{\value{\addtypedbonus@companion#2#3bonuscount}-\value{tmpmiscbonus}}
	}{}
	\ifcsname c@\addtypedbonus@companion#2skillcount\endcsname
		\addtocounter{\addtypedbonus@companion#2skillcount}{\value{\addtypedbonus@companion#2#3bonuscount}-\value{tmpmiscbonus}}
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
%[Companion] Target, Type, value
\newcommand\addcategorybonus[4][]{
	\ifcsname c@#1#2#3categorybonuscount\endcsname
	\else
		\newcounter{#1#2#3categorybonuscount}
	\fi
	\addtocounter{#1#2#3categorybonuscount}{#4}
}

%%Gear

\newcommand\printgearitems[1][]{
 	&\lfont item& \lfont Qty&\lfont wt.\tabularnewline\hline
 	\forloop{loopcount}{0}{\value{loopcount}<\value{#1itemidcount}}
	{
		\csname #1item\arabic{loopcount}symbol\endcsname
		&\tfont\csname #1item\arabic{loopcount}name\endcsname
		&\tfont\arabic{#1item\arabic{loopcount}qty}
		&\tfont\arabic{#1item\arabic{loopcount}weight} lbs.\tabularnewline
	}
	\relax & & \relax \tabularnewline \textsc{Total} & & \multicolumn{2}{r}{\arabic{#1itemweightcount}~lbs.} \tabularnewline\hline
}
\newcommand\printcontainers[1][]{
	& \lfont Container& \lfont Volume&\lfont wt.\tabularnewline\hline 
	\forloop{loopcount}{0}{\value{loopcount}<\value{#1containeridcount}}
	{
		\csname #1container\arabic{loopcount}symbol\endcsname
		&\tfont\csname #1container\arabic{loopcount}name\endcsname
		&\tfont\csname#1container\arabic{loopcount}volume\endcsname
		&\tfont\arabic{#1container\arabic{loopcount}weight} lbs.\tabularnewline
	}
	\relax & & \relax \tabularnewline \textsc{Total} & & & \arabic{#1containerweightcount}~lbs. \tabularnewline\hline
}

%[] Name, Quantity/Volume, Weight
\newcommand\addgear[4][]{
 \setkeys{addgear}{#1}
 \ifthenelse{\equal{\gear@type}{item}}
{
	 \newcounter{\gear@companion item\arabic{\gear@companion itemidcount}weight}
	\newcounter{\gear@companion item\arabic{\gear@companion itemidcount}qty}
	\setcounter{\gear@companion item\arabic{\gear@companion itemidcount}qty}{#3}
	\global\expandafter\def\csname \gear@companion item\arabic{\gear@companion itemidcount}symbol\endcsname{\setkeys{addgear}{#1} \gear@symbol}
	\global\expandafter\def\csname \gear@companion item\arabic{\gear@companion itemidcount}name\endcsname{#2}
	\ifthenelse{\boolean{\gear@overwritetweight}}
	{
  		\addtocounter{\gear@companion  item\arabic{\gear@companion itemidcount}weight}{#4}
  		\addtocounter{\gear@companion itemweightcount}{#4}
	}
	{
  		\addtocounter{\gear@companion  item\arabic{\gear@companion itemidcount}weight}{#3*#4}
  		\addtocounter{\gear@companion itemweightcount}{#3* #4}
	}
	\addtocounter{\gear@companion itemidcount}{1}
  }
 {
	\global\expandafter\def\csname \gear@companion container\arabic{\gear@companion containeridcount}symbol\endcsname{\setkeys{addgear}{#1} \gear@symbol}
	\global\expandafter\def\csname \gear@companion container\arabic{\gear@companion containeridcount}name\endcsname{#2}
	\global\expandafter\def\csname\gear@companion container\arabic{\gear@companion containeridcount}volume\endcsname{#3}
	 \newcounter{\gear@companion container\arabic{\gear@companion containeridcount}weight}
	\addtocounter{\gear@companion container\arabic{\gear@companion containeridcount}weight}{#4}
  	\addtocounter{\gear@companion containerweightcount}{#4}
	\addtocounter{\gear@companion containeridcount}{1}
  }
\addtocounter{\gear@companion gearidcount}{1}
 % \expandafter\appendcmd\expandafter{\csname \gear@companion\gear@type list\endcsname}{\setkeys{addgear}{#1} \gear@symbol&\tfont{#2} &\tfont #3&\setkeys{addgear}{#1} \tfont \arabic{\gear@companion \arabic{#1itemidcount}\gear@type weight}~lbs.\tabularnewline \resetkeys}
  \resetkeys
}

%%Magic items
%Name, Type (belt, body, chest, eyes, feet, hands, head, headband, neck, ring, shoulders, wrist), additional commands
\newcommand\addmagicitem[3]{
	\setboolean{slotnotfound}{true}
	\ifthenelse{\equal{#2}{belt}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitembelt\emptylist
		#3
	\appendcmd{\magicitembelt}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{body}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitembody\emptylist
		#3
	\appendcmd{\magicitembody}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{chest}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitemchest\emptylist
		#3
	\appendcmd{\magicitemchest}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{eyes}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitemeyes\emptylist
		#3
	\appendcmd{\magicitemeyes}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{feet}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitemfeet\emptylist
		#3
	\appendcmd{\magicitemfeet}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{hands}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitemhands\emptylist
		#3
	\appendcmd{\magicitemhands}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{head}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitemhead\emptylist
		#3
	\appendcmd{\magicitemhead}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{headband}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitemheadband\emptylist
		#3
	\appendcmd{\magicitemheadband}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{neck}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\setboolean{slotnotfound}{false}
	\ifx \magicitemneck\emptylist
		#3
	\appendcmd{\magicitemneck}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{ring}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
		\ifx \magicitemringone\emptylist
		#3
		\appendcmd{\magicitemringone}{\tfont #1}
		\else	
		\ifx \magicitemringtwo\emptylist
		#3
		\appendcmd{\magicitemringtwo}{\tfont #1}
		\fi
		\fi
	}{}
	\ifthenelse{\equal{#2}{shoulders}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitemshoulders\emptylist
		#3
	\appendcmd{\magicitemshoulders}{\tfont #1}
		\fi
	}{}
	\ifthenelse{\equal{#2}{wrist}\AND \boolean{slotnotfound}}{
	\setboolean{slotnotfound}{false}
	\ifx \magicitemwrist\emptylist
		#3
	\appendcmd{\magicitemwrist}{\tfont #1}
		\fi
	}{}
	%SLOTLESS MAGIC ITEM, WILL BE ADDED TO GEAR
	\ifthenelse{\boolean{slotnotfound}}{
		#3
	}{}
}
%%Feats
\newcommand\printfeats[1][]{
	\begin{longtable}{| p{.25\textwidth} | p{.704\textwidth} |} 
\multicolumn{2}{c}{\drawbox[family = list, special family = feat]{-210}{-2.8}{420}{10}{feats}}\tabularnewline
\hline
\rowcolor{\setting@defaultboxcolor}\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Name}&\centering \color{\setting@defaultfontcolor}\lfont\MakeUppercase{Text}\tabularnewline
\hline
\multicolumn{2}{c}{}\tabularnewline
\endhead
\hline
\csname #1featlist\endcsname
\end{longtable}
}

%Name, Text, additional commands
\newcommand\addfeat[4][]{
	\setkeys{addfeat}{#1}
	#4
	\expandafter\appendcmd\expandafter{\csname \addfeat@companion featlist\endcsname}{\selectfont\scshape#2 &\tfont  #3\\\hline}
	\expandafter\appendcmd\expandafter{\csname  \addfeat@companion alternatefeatlist\endcsname}{\tfont#2, }
	\setcounter{\addfeat@companion boolfeats}{1}
	\resetkeys
}
	
%%Features, class features, racial traits etc
\newcommand\printfeatures[1][]{%
	\begin{longtable}{| p{.25\textwidth} | p{.666\textwidth} |p{.015\textwidth}| } 
\multicolumn{3}{c}{\drawbox[family = list, special family = feature]{-210}{-2.8}{420}{10}{features}}\tabularnewline
\hline
\rowcolor{\setting@defaultboxcolor}\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Name}&\centering \color{\setting@defaultfontcolor}\lfont\MakeUppercase{Text}&\centering \color{\setting@defaultfontcolor}\centering\lfont\MakeUppercase{Uses}\tabularnewline
\hline
\endfirsthead
\multicolumn{3}{c}{\drawbox[family = list, special family = feature]{-210}{-2.8}{420}{10}{features}}\tabularnewline
\hline
\rowcolor{\setting@defaultboxcolor}\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Name}&\centering \color{\setting@defaultfontcolor}\lfont\MakeUppercase{Text}&\centering \color{\setting@defaultfontcolor}\centering\lfont\MakeUppercase{Uses}\tabularnewline
\hline
\multicolumn{3}{c}{}\tabularnewline
\endhead
\ifx\featurelist\emptylist
\else
\csname #1featurelist\endcsname
\fi
\end{longtable}
}

%[Companion] Name,Type, Text, Uses, additional commands
\newcommand\addfeature[6][]{
	\setkeys{addfeature}{#1}
	#6
	\ifcsname \addfeature@companion feature#3list\endcsname	
	\else
		\global\expandafter\def\csname \addfeature@companion feature#3list\endcsname{\multicolumn{3}{c}{}\tabularnewline\hline\rowcolor{black! 10}\multicolumn{3}{|c|}{\centering\MakeUppercase{#3}}\\*\nobreakhline}
		\expandafter\appendcmd\expandafter{\csname \addfeature@companion featurelist\endcsname}{\csname \addfeature@companion feature#3list\endcsname}
	
	\fi
	\expandafter\appendcmd\expandafter{\csname \addfeature@companion feature#3list\endcsname}{\selectfont\scshape#2 &\tfont  #4&\selectfont\scshape#5\\\hline}
	\setcounter{\addfeature@companion boolfeatures}{1}
	\expandafter\appendcmd\expandafter{\csname \addfeature@companion alternatefeaturelist\endcsname}{\tfont#2, }
	\resetkeys%
}

%%Spells

\newcommand\printspells[1][]{
	%\begin{longtable}{| p{.015\textwidth}| p{.47\textwidth}| p{.1\textwidth} | p{.07\textwidth} | p{.065\textwidth} | p{.07\textwidth}| p{.05\textwidth} |} 
	\begin{longtable}{| >{\centering}p{.015\textwidth}| >{\centering}p{.2\textwidth} |>{\centering} p{.15008\textwidth} | >{\centering}p{.1\textwidth} | >{\centering}p{.199\textwidth}| >{\centering}p{.199\textwidth} |} 
\multicolumn{6}{c}{\drawbox[family = caster, special family = spell]{-210}{-2.8}{420}{10}{spells}}\tabularnewline
\hline
\rowcolor{\setting@defaultboxcolor}\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Prep.}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{School}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Duration}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Range}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Save}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Target}\tabularnewline
\hline
\endfirsthead 
\multicolumn{6}{c}{\drawbox[family = caster, special family = spell]{-210}{-2.8}{420}{10}{spells}}\tabularnewline
\hline
\rowcolor{\setting@defaultboxcolor}\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Prep.}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{School}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Duration}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Range}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Save}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Target}\tabularnewline
\multicolumn{3}{c}{}\tabularnewline
\hline
\endhead 
\csname #1default0spelllist\endcsname
\csname #1default1spelllist\endcsname
\csname #1default2spelllist\endcsname
\csname #1default3spelllist\endcsname
\csname #1default4spelllist\endcsname
\csname #1default5spelllist\endcsname
\csname #1default6spelllist\endcsname
\csname #1default7spelllist\endcsname
\csname #1default8spelllist\endcsname
\csname #1default9spelllist\endcsname
\end{longtable}
}

%Range (close, medium, long) , Caster, Caster level adjustment
\newcommand\spellrange[3]{%
	\IsInteger{#3}{\setcounter{tmpcasterlevelbonus}{#3}}{\setcounter{tmpcasterlevelbonus}{0}}%
	\ifthenelse{\equal{#1}{close}}{%
		\ifcsname c@#2rangeclosecount\endcsname%
		\setcounter{#2rangeclosecount}{25+(\value{#2casterlevelcount}+\value{tmpcasterlevelbonus})/2*5}%
		\arabic{#2rangeclosecount} ft.%
		\else 25 ft.\fi%
	}{%
	\ifthenelse{\equal{#1}{medium}}{%
		\ifcsname c@#2rangemediumcount\endcsname%
		\setcounter{#2rangemediumcount}{100+(\value{#2casterlevelcount}+\value{tmpcasterlevelbonus})*10}%
		\arabic{#2rangemediumcount} ft.%
		\else 100 ft.\fi%
	}{%
	\ifthenelse{\equal{#1}{long}}{\ifcsname c@#2rangelongcount\endcsname%
		\setcounter{#2rangelongcount}{400+(\value{#2casterlevelcount}+\value{tmpcasterlevelbonus})*40}%
		\arabic{#2rangelongcount} ft.%
		\else 400 ft.\fi%
	}{#1}}}%
}

\DeclareRobustCommand\addspell[9][]{	
	\setkeys{addspell}{#1}
	\ifcsdef{\spell@companion \spell@caster #2spelllist}
	{
		%%Spelloverview
		\ifthenelse{\boolean{\spell@companion \spell@caster#2spelllistbool}}%
		{%
			\expandafter\appendcmd\expandafter{\csname \spell@companion\spell@caster #2spellnamelist\endcsname}{%
				,#3%
			}%
		}%
		{%
			\expandafter\appendcmd\expandafter{\csname \spell@companion\spell@caster #2spellnamelist\endcsname}{%
				#3%
			}%
		}%

		\ifthenelse{\boolean{\spell@companion \spell@caster#2spelllistbool}}{}{\setboolean{\spell@companion \spell@caster#2spelllistbool}{true}\expandafter\appendcmd\expandafter{\csname\spell@companion  \spell@caster#2spelllist\endcsname}{\multicolumn{3}{c}{}\tabularnewline\hline\rowcolor{\setting@defaultboxcolor! 10}\multicolumn{6}{|c|}{\centering\ORDINALstringnum{#2} \MakeUppercase
{LEVEL}}\\*\nobreakhline}}
		\expandafter\appendcmd\expandafter{\csname \spell@companion \spell@caster #2spelllist\endcsname}{
		%\hline\hline
		\multicolumn{6}{|c|}{\selectfont\scshape#3}\tabularnewline*\nobreakhline
		 \setkeys{addspell}{#1}\ifthenelse{\equal{\spell@prepared}{}\OR\equal{\spell@prepared}{0}\OR\equal{\spell@prepared}{false}}{}{X}&\centering\tfont#5&\centering\tfont#6&\centering\setkeys{addspell}{#1}\tfont\setkeys{addspell}{#1}\spellrange{#7}{\spell@companion\spell@caster}{\spell@clbonus} &\centering\tfont#8&\centering\tfont#9\tabularnewline*\nobreakhline
		\multicolumn{6}{|p{\textwidth-2\tabcolsep}|}{ \tfont#4}\tabularnewline\hline
		}
		\ifthenelse{\boolean{\spell@known}}
		{
			\addtocounter{\spell@companion\spell@caster#2knownspells}{1}
		}{}
	}{		
		\ifthenelse{\boolean{\spell@companion default#2spelllistbool}}{}{\setboolean{\spell@companion default#2spelllistbool}{true}\expandafter\appendcmd\expandafter{\csname\spell@companion default#2spelllist\endcsname}{\multicolumn{3}{c}{}\tabularnewline\hline\rowcolor{\setting@defaultboxcolor! 10}\multicolumn{6}{|c|}{\centering\ORDINALstringnum{#2} \MakeUppercase{LEVEL}}\\*\nobreakhline}}
		\expandafter\appendcmd\expandafter{\csname \spell@companion default#2spelllist\endcsname}{
		%\hline\hline
		\multicolumn{6}{|c|}{\selectfont\scshape#3}\tabularnewline*\nobreakhline
		 \setkeys{addspell}{#1}\ifthenelse{\equal{\spell@prepared}{}\OR\equal{\spell@prepared}{0}\OR\equal{\spell@prepared}{false}}{}{X}&\centering\tfont#5&\centering\tfont#6&\centering\setkeys{addspell}{#1}\tfont\setkeys{addspell}{#1}\spellrange{#7}{\spell@companion\spell@caster}{\spell@clbonus} &\centering\tfont#8&\centering\tfont#9\tabularnewline*\nobreakhline
		\multicolumn{6}{|p{\textwidth-2\tabcolsep}|}{ \tfont#4}\tabularnewline\hline
		}		
		\setcounter{\spell@companion boolspells}{1}		
	}
	\resetkeys
}

%%AC

\newcommand{\printacitems}[1][]{
	\tabularnewline\rowcolor{\setting@defaultboxcolor}\leavevmode\color{\setting@defaultfontcolor} \MakeUppercase{AC Items} & \leavevmode\color{\setting@defaultfontcolor} \lfont ac bonus & \leavevmode\color{\setting@defaultfontcolor} \lfont max \csname #1acmod\endcsname & \leavevmode\color{\setting@defaultfontcolor} \lfont penalty &\leavevmode\color{\setting@defaultfontcolor}  \lfont spell failure & \leavevmode\color{\setting@defaultfontcolor} \lfont type & \leavevmode\color{\setting@defaultfontcolor} \lfont weight \tabularnewline\hline
	\forloop{loopcount}{0}{\value{loopcount}<\value{#1armoridcount}}
	{
		\tfont\csname #1armorid\arabic{loopcount}name\endcsname \ifthenelse{\arabic{#1armorid\arabic{loopcount}enhancement} = 0}{}{+ \arabic{#1armorid\arabic{loopcount}enhancement}}
		&\tfont \writevalue{\value{#1armorid\arabic{loopcount}acbonus}}%\value{#1armorid\arabic{loopcount}enhancement}+\value{tmpcount2}}
		&\tfont\ifthenelse{\boolean{#1armorid\arabic{loopcount}maxdexbool}}{-}{\writevalue{\value{#1armorid\arabic{loopcount}maxdex}}}
		&\tfont \writevalue{\value{#1armorid\arabic{loopcount}penalty}}%+\value{tmpcount4}}
		&\tfont \writevalue{\value{#1armorid\arabic{loopcount}spellfailure}}\%
		&\tfont \csname #1armorid\arabic{loopcount}type\endcsname
		& \tfont\arabic{#1armorid\arabic{loopcount}weight}~lbs.\ifthenelse{\equal{\csname #1armorid\arabic{loopcount}notes\endcsname}{}}{}{\tabularnewline[-0.9ex] \multicolumn{7}{l}{\tfont\csname #1armorid\arabic{loopcount}notes\endcsname}}\tabularnewline\hline
	}

\csname #1acitemlist\endcsname
}

\newcommand\calculatereducedspeed[1]
{
	\setcounter{tmpcount2}{#1/5+1}
	\setcounter{result}{0}
	\forloop{innerloopcount}{1}{\value{innerloopcount}<\value{tmpcount2}}
	{
		\MODULO{\arabic{innerloopcount}}{3}{\tmpcmd}
		\ifthenelse{\tmpcmd > 0}
		{
			\addtocounter{result}{5}
		}{}		
	}
}

\newcommand{\addacitem}[8][]{
	\setkeys{addacitem}{#1}
	%define variables
	\newcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}acbonus}
	\setcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}acbonus}{#3+\acitem@enhancement}
	\newcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}maxdex}
	\newboolean{\acitem@companion armorid\arabic{\acitem@companion armoridcount}maxdexbool}
	\IsInteger{#4}{\setcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}maxdex}{#4}}{\setboolean{\acitem@companion armorid\arabic{\acitem@companion armoridcount}maxdexbool}{true}}
	\newcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}penalty}
	\setcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}penalty}{#5}
	\newcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}spellfailure}
	\setcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}spellfailure}{#6}
	\newcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}weight}
	\setcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}weight}{#8}
	\newcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}enhancement}
	\setcounter{\acitem@companion armorid\arabic{\acitem@companion armoridcount}enhancement}{\acitem@enhancement}

	%\expandafter\newcommand\csname \acitem@companion armorid\arabic{\acitem@companion armoridcount}maxdex\endcsname{#4}
	\global\expandafter\def\csname \acitem@companion armorid\arabic{\acitem@companion armoridcount}name\endcsname{#2}
	\global\expandafter\def\csname \acitem@companion armorid\arabic{\acitem@companion armoridcount}type\endcsname{#7}
	\global\expandafter\expandafter\expandafter\def\expandafter\expandafter\csname \acitem@companion armorid\arabic{\acitem@companion armoridcount}category\endcsname\expandafter{\acitem@category}
	\global\expandafter\expandafter\expandafter\def\expandafter\expandafter\csname \acitem@companion armorid\arabic{\acitem@companion armoridcount}base\endcsname\expandafter{\acitem@base}
	\global\expandafter\expandafter\expandafter\def\expandafter\expandafter\csname \acitem@companion armorid\arabic{\acitem@companion armoridcount}notes\endcsname\expandafter{\acitem@notes}
	\global\expandafter\expandafter\expandafter\def\expandafter\expandafter\csname \acitem@companion armorid\arabic{\acitem@companion armoridcount}armorspeed\endcsname\expandafter{\acitem@armorspeed}

	\addtocounter{\acitem@companion acitemsweight}{\value{\acitem@companion armorid\arabic{\acitem@companion armoridcount}weight}}
	\addtocounter{\acitem@companion armoridcount}{1}

 	\resetkeys
}

\newcommand\initacitems[1][]{
	\forloop{loopcount}{0}{\value{loopcount}<\value{#1armoridcount}}%
	{%
		\ifthenelse{\equal{\csname #1armorid\arabic{loopcount}armorspeed\endcsname}{}}%
		{%
			\ifthenelse{\equal{\csname #1armorid\arabic{loopcount}type\endcsname}{medium}\OR\equal{\csname #1armorid\arabic{loopcount}type\endcsname}{heavy}}%
			{%
				\calculatereducedspeed{\value{#1basespeedcount}}%
				\setcounter{#1armorspeedcount}{\minof{\value{result}}{\value{#1armorspeedcount}}}%
			}{}%
		}%
		{%
			\setcounter{#1armorspeedcount}{\minof{\csname #1armorid\arabic{loopcount}armorspeed\endcsname}{\value{#1armorspeedcount}}}%
		}%
%
		\setcounter{tmpcount2}{0}%
		\setcounter{tmpcount3}{0}%
		\setcounter{tmpcount4}{0}%
		\setcounter{tmpcount5}{0}%
%
        \edef\tmpcategory{\csname #1armorid\arabic{loopcount}category\endcsname}
%        \ifx \csname #1armorid\arabic{loopcount}category\endcsname\empty%
%            \appendcmd{\tmpcategory}{armor}
%		\else%
%			\appendcmd{\tmpcategory}{armor, }
%        \fi%
		\foreach\category in \tmpcategory {%
				\expandafter\expandafter\ifcsname\expandafter c@\category ac bonuscategorybonuscount\endcsname%
					\addtocounter{#1armorid\arabic{loopcount}acbonus}{\value{\category ac bonuscategorybonuscount}}%
					\setcounter{#1armorid\arabic{loopcount}acbonus}{\maxof{\value{#1armorid\arabic{loopcount}acbonus}}{0}}%
				\fi%
				\expandafter\expandafter\ifcsname\expandafter c@\category max dexcategorybonuscount\endcsname%
					\addtocounter{#1armorid\arabic{loopcount}maxdex}{\value{\category max dexcategorybonuscount}}%
					\setcounter{#1armorid\arabic{loopcount}maxdex}{\maxof{\value{#1armorid\arabic{loopcount}maxdex}}{0}}%
				\fi%
				\expandafter\expandafter\ifcsname\expandafter c@\category penaltycategorybonuscount\endcsname%
					\addtocounter{#1armorid\arabic{loopcount}penalty}{\value{\category penaltycategorybonuscount}}%
					\setcounter{#1armorid\arabic{loopcount}penalty}{\minof{\value{#1armorid\arabic{loopcount}penalty}}{0}}%
				\fi%
				\expandafter\expandafter\ifcsname\expandafter c@\category spell failurecategorybonuscount\endcsname%
					\addtocounter{#1armorid\arabic{loopcount}spellfailure}{\value{\category spell failurecategorybonuscount}}%
					\setcounter{#1armorid\arabic{loopcount}spellfailure}{\maxof{\value{#1armorid\arabic{loopcount}spellfailure}}{0}}%
				\fi%
		}%
        \edef\tmpbase{\csname #1armorid\arabic{loopcount}base\endcsname}				
        \foreach\base in \tmpbase {%
				\expandafter\expandafter\ifcsname\expandafter c@\base ac bonuscategorybonuscount\endcsname%
					\addtocounter{#1armorid\arabic{loopcount}acbonus}{\value{\base ac bonuscategorybonuscount}}%
					\setcounter{#1armorid\arabic{loopcount}acbonus}{\maxof{\value{#1armorid\arabic{loopcount}acbonus}}{0}}%
				\fi%
				\expandafter\expandafter\ifcsname\expandafter c@\base\endcsname max dexcategorybonuscount\endcsname%
					\addtocounter{#1armorid\arabic{loopcount}maxdex}{\value{\base max dexcategorybonuscount}}%
					\setcounter{#1armorid\arabic{loopcount}maxdex}{\maxof{\value{#1armorid\arabic{loopcount}maxdex}}{0}}%
				\fi%
				\expandafter\expandafter\ifcsname\expandafter c@\base\endcsname penaltycategorybonuscount\endcsname%
					\addtocounter{#1armorid\arabic{loopcount}penalty}{\value{\base penaltycategorybonuscount}}%
					\setcounter{#1armorid\arabic{loopcount}penalty}{\minof{\value{#1armorid\arabic{loopcount}penalty}}{0}}%
				\fi%
				\expandafter\expandafter\ifcsname\expandafter c@\base\endcsname spell failurecategorybonuscount\endcsname%
					\addtocounter{#1armorid\arabic{loopcount}spellfailure}{\value{\base spell failurecategorybonuscount}}%
					\setcounter{#1armorid\arabic{loopcount}spellfailure}{\maxof{\value{#1armorid\arabic{loopcount}spellfailure}}{0}}%
				\fi%
        }%
%
		\ifthenelse{\equal{\csname #1armorid\arabic{loopcount}type\endcsname}{light}\OR\equal{\csname #1armorid\arabic{loopcount}type\endcsname}{medium}\OR\equal{\csname #1armorid\arabic{loopcount}type\endcsname}{heavy}\OR\equal{\csname #1armorid\arabic{loopcount}type\endcsname}{armor}}%
		{%
			\addtypedbonus[companion = #1]{ac}{armor}{\value{#1armorid\arabic{loopcount}acbonus}}%
		}%
		{%
			\ifcsname c@#1ac\csname #1armorid\arabic{loopcount}type\endcsname bonuscount\endcsname%
				\addtypedbonus[companion = #1]{ac}{\csname #1armorid\arabic{loopcount}type\endcsname}{\value{#1armorid\arabic{loopcount}acbonus}}%
			\else%
				\addtypedbonus[companion = #1]{ac}{misc}{\value{#1armorid\arabic{loopcount}acbonus}}%
			\fi%
		}%
		\ifthenelse{\boolean{#1armorid\arabic{loopcount}maxdexbool}}{}{\setcounter{#1maxdexbonuscount}{\minof{\value{#1maxdexbonuscount}}{\value{#1armorid\arabic{loopcount}maxdex}+\value{tmpcount3}}}}%
		%\setcounter{#1acdexbonuscount}{\minof{\value{#1maxdexbonuscount}}{\value{#1\csname #1acmod\endcsname modcount}}}%
		\addtocounter{#1acitemsbonus}{\value{#1armorid\arabic{loopcount}acbonus}+\value{#1armorid\arabic{loopcount}enhancement}+\value{tmpcount2}}%
 		\addtocounter{#1acitemscheckpenalty}{\value{#1armorid\arabic{loopcount}penalty}+\value{tmpcount4}}%
		\ifthenelse{\value{#1acitemscheckpenalty}>0}%
		{%
			\setcounter{#1acitemscheckpenalty}{0}%
		}{}%
		\addtocounter{#1acitemsspellfailure}{\value{#1armorid\arabic{loopcount}spellfailure}+\value{tmpcount5}}%
		\ifthenelse{\value{#1acitemsspellfailure}<0\OR\value{#1acitemsspellfailure}=0}%
		{%
			\setcounter{#1acitemsspellfailure}{0}%
		}{}%
	}%
		\setcounter{#1acdexbonuscount}{\minof{\value{#1maxdexbonuscount}}{\value{#1\csname #1acmod\endcsname modcount}}}%
}%

\newcommand\calculateflatfootedac[1][]{
	\addtocounter{#1flatfootedaccount}{10+\value{#1acarmorbonuscount}+\value{#1acdeflectionbonuscount}+\value{#1acshieldbonuscount}+\value{#1acnaturalbonuscount}+\value{#1acmiscbonuscount}+\value{#1sizemodcount}-\value{#1acdodgebonuscount}+\value{#1flatfootedbonuscount}}
	\arabic{#1flatfootedaccount}
}
\newcommand\calculatetouchac[1][]{
	\addtocounter{#1touchaccount}{10+\value{#1sizemodcount}+\value{#1acdeflectionbonuscount}+\value{#1acmiscbonuscount}+\value{#1acdexbonuscount}+\value{#1touchbonuscount}}
	\arabic{#1touchaccount}
}


%%Weapons

\newcommand\printweapons[1][]{
	\rowcolors{2}{}{}
	\begin{tabular}[t]{p{5\unitlength} p{85\unitlength} >{\centering}p{55\unitlength} >{\centering}p{40\unitlength} >{\centering}p{40\unitlength} >{\centering}p{40\unitlength} >{\centering}p{10\unitlength} >{\centering}p{40\unitlength}>{\centering}p{20\unitlength} } 
	\rowcolor{\setting@defaultboxcolor} \multicolumn{2}{l}{\leavevmode\color{\setting@defaultfontcolor} \MakeUppercase{Weapons}} & \leavevmode\color{\setting@defaultfontcolor}\lfont Attack modifiers & \leavevmode\color{\setting@defaultfontcolor}\lfont damage & \leavevmode\color{\setting@defaultfontcolor}\lfont critical &\leavevmode\color{\setting@defaultfontcolor} \lfont range & \leavevmode\color{\setting@defaultfontcolor}\lfont type &\leavevmode\color{\setting@defaultfontcolor} \lfont weight &\leavevmode\color{\setting@defaultfontcolor} \lfont ammo \tabularnewline\hline
	\csname #1weaponlist\endcsname
	\end{tabular}
}
\newcommand\tmpdamagedice{}
\ExplSyntaxOn
\tl_new:N \l_dice_string_tl
\tl_new:N \l_dice_number_string_tl
\seq_new:N \l_dice_string_seq

\newcounter{calccount}
\newcounter{calccount2}
\newcounter{calccount3} %size index
\newcounter{calccount4}
%calculates the weapon damage dice  corresponding to the weapon size. DOES CURRENTLY NOT WORK FOR SMALL OR SMALLER CREATURES/WEAPONS OR DECREASING SIZE
%#1: Companion
%#2: command to save the new damage
%#3: size category/ size index bonus
%#4: weapon damage dice
\newcommand\calculatewweaponsize[4][]{%
	%split weapon damage dice in number of dice and type of dice (d4, d6, d8 etc.)
	%calculate new number of die and, if nessesary, new type of dice	
	\setcounter{tmpcount6}{#3 + \value{#1sizeindex}}%
	\ifthenelse{\equal{#4}{1}}{% 
		\setcounter{tmpcount5}{1}%number i
	}%
	{%
		\tl_set:Nn \l_dice_string_tl {#4}%
		\regex_extract_once:nnN { [\w|\W ]* d } {#4}  \l_dice_string_seq%
	 	\regex_replace_once:nnN { [\w|\W ]* d } { } \l_dice_string_tl%
		\seq_get_left:NN   \l_dice_string_seq \l_dice_number_string_tl%
		\regex_replace_once:nnN { d } { } \l_dice_number_string_tl%
		\setcounter{tmpcount7}{\l_dice_string_tl}% dice type
		\setcounter{tmpcount5}{\l_dice_number_string_tl}% number i
	}%
	\ifthenelse{\value{tmpcount6} = 0}{}%
	{%
		\setcounter{tmpcount4}{1}% number i-1
		\ifnum \value{tmpcount7} = 12%
			\setcounter{tmpcount7}{6}%
			\addtocounter{tmpcount6}{2}%
		\fi%
		\ifthenelse{\value{tmpcount7} = 10 \AND \value{tmpcount5} >1}{%
			\setcounter{tmpcount7}{8}%
			\addtocounter{tmpcount6}{1}%
		}{}%
		\ifthenelse{\value{tmpcount7} = 4 \AND \value{tmpcount5} >1}{%
			\setcounter{tmpcount7}{6}%
			\addtocounter{tmpcount6}{-1}%
		}{}%
		%find the next dice numbers
		\ifnum \value{tmpcount5} > 1%
			\setcounter{calccount}{1}%
			\setcounter{calccount2}{1}%
			\setcounter{calccount4}{1}%
			\forloop{loopcount}{1}{\value{loopcount} < \arabic{tmpcount5}}%
			{%
				\ifthenelse{\value{loopcount} < 3}%
				{%
					\setcounter{calccount4}{\value{calccount2}}
					\setcounter{calccount2}{\value{calccount}}%
					\setcounter{calccount}{\value{loopcount}+1}%
				}%
				{%
					\setcounter{loopcount}{2*\value{calccount2}}%
					\setcounter{calccount4}{\value{calccount2}}
					\setcounter{calccount2}{\value{calccount}}%
					\setcounter{calccount}{\value{loopcount}}%
					\addtocounter{loopcount}{-1}%
				}%
		}%
			\ifnum \value{calccount} = \value{tmpcount5}
				\setcounter{tmpcount4}{\value{calccount2}}%
				\setcounter{tmpcount5}{\value{calccount}}%
			\else
				\ifnum \value{tmpcount7} = 6%
					\setcounter{tmpcount4}{\value{calccount4}}%
					\setcounter{tmpcount5}{\value{calccount2}}%
					\setcounter{tmpcount7}{8}%
				\else \ifnum \value{tmpcount7} = 8%
					\setcounter{tmpcount7}{6}%
					\fi
				\setcounter{tmpcount4}{\value{calccount2}}%
				\setcounter{tmpcount5}{\value{calccount}}%
				\fi
			\fi
		\fi%
		\setcounter{calccount3}{\value{#1initialsizeindex}}%
		\ifnum \value{tmpcount6} > 0%
			\calculateWeaponSizeIncrease[#1]{calccount3}{tmpcount6}{tmpcount4}{tmpcount5}{tmpcount7}%
		\else \ifnum \value{tmpcount6} < 0%
			\calculateWeaponSizeDecrease[#1]{calccount3}{tmpcount6}{tmpcount4}{tmpcount5}{tmpcount7}%
		\fi%
		\fi%
	}
	\renewcommand #2 {\arabic{tmpcount5}d\arabic{tmpcount7}}%
}
\ExplSyntaxOff

%\calculateWeaponSizeIncrease
%#1: Companion
%#2: sizeindex
%#3: size increase
%#4: number i-1
%#5: number i
%#6: dice

\newcommand\calculateWeaponSizeIncrease[6][]{%
	\ifnum \value{#3} >0%
		\ifnum \value{#5} = 1%
			\ifnum \value{#6} = 1%
				\setcounter{#6}{2}%
			\else \ifnum \value{#6} = 2%
				\setcounter{#6}{3}%
			\else \ifnum \value{#6} = 3%
				\setcounter{#6}{4}%
			\else \ifnum \value{#6} = 4%
				\setcounter{#6}{6}%
			\else \ifnum \value{#6} = 6%
				\setcounter{#6}{8}%
			\else \ifnum \value{#6} = 8%
				\ifnum \value{#2} < 0%
					\setcounter{#6}{10}%
				\else%
					\setcounter{#6}{6}%
					\setcounter{#5}{2}%
				\fi%
			\else \ifnum \value{#6} = 10%
				\ifnum \value{#2} < 0%
					\setcounter{#6}{6}%
					\setcounter{#5}{2}%
				\else%
					\setcounter{#6}{8}%
					\setcounter{#5}{2}%
				\fi%
			\fi%
			\fi%
			\fi%
			\fi%
			\fi%
			\fi%
			\fi%
		\else%
			\ifnum \value{#2} < 0%
				\ifnum \value{#6} = 6%
					\setcounter{#6}{8}%
				\else%
					\setcounter{#6}{6}%
					\ifnum \value{#5} > 2%
						\setcounter{calccount}{\value{#5}}%
						\setcounter{#5}{\value{#4}*2}%
						\setcounter{#4}{\value{calccount}}%
					\else%
						\setcounter{#4}{\value{#5}}%
						\addtocounter{#5}{1}%
					\fi%
				\fi%
			\else%
				\ifnum \value{#5} > 2%
					\setcounter{calccount}{\value{#5}}%
					\setcounter{#5}{\value{#4}*2}%
					\setcounter{#4}{\value{calccount}}%
				\else%
					\setcounter{#4}{\value{#5}}%
					\addtocounter{#5}{1}%
				\fi%
			\fi%
		\fi%
		\addtocounter{#3}{-1}%
		\addtocounter{#2}{1}%
		\calculateWeaponSizeIncrease[#1]{#2}{#3}{#4}{#5}{#6}%
	\fi%
}

\newcommand\calculateWeaponSizeDecrease[6][]{%
	\ifnum \value{#3} <0%
		\ifnum \value{#5} = 1%
			\ifnum \value{#6} = 1%
				\setcounter{#6}{1}%
			\else \ifnum \value{#6} = 2%
				\setcounter{#6}{1}%
			\else \ifnum \value{#6} = 3%
				\setcounter{#6}{2}%
			\else \ifnum \value{#6} = 4%
				\setcounter{#6}{3}%
			\else \ifnum \value{#6} = 6%
				\setcounter{#6}{4}%
			\else \ifnum \value{#6} = 8%
				\setcounter{#6}{6}%
			\else \ifnum \value{#6} = 10%
				\ifnum \value{#2} < 0%
					\setcounter{#6}{8}%
				\else%
					\setcounter{#6}{6}%
				\fi%
			\fi%
			\fi%
			\fi%
			\fi%
			\fi%
			\fi%
			\fi%
		\else%
			\ifnum \value{#2} < 0%
				\ifnum \value{#6} = 8%
					\setcounter{#6}{6}%
				\else %
					\setcounter{#6}{8}%
					\ifnum \value{#5} > 2%
						\setcounter{#5}{\value{#4}}%
						\setcounter{#4}{\value{#5}/2}%
					\else%
						\ifnum \value{#6} = 6%
							\setcounter{#5}{1}%
							\setcounter{#4}{1}%
							\setcounter{#6}{8}%
						\else%
							\setcounter{#5}{1}%
							\setcounter{#4}{1}%
							\setcounter{#6}{10}%
						\fi%
					\fi%
				\fi%	
			\else%
				\ifnum \value{#5} > 2%
					\setcounter{#5}{\value{#4}}%
					\setcounter{#4}{\value{#5}/2}%
				\else%
					\ifnum \value{#6} = 6%
						\setcounter{#5}{1}%
						\setcounter{#4}{1}%
						\setcounter{#6}{8}%
					\else%
						\setcounter{#5}{1}%
						\setcounter{#4}{1}%
						\setcounter{#6}{10}%
					\fi%
				\fi%
			\fi%
		\fi%
		\addtocounter{#3}{1}%
		\addtocounter{#2}{-1}%
		\calculateWeaponSizeDecrease[#1]{#2}{#3}{#4}{#5}{#6}%
	\fi%
}%

\newcommand\addweapon[8][]{%
	\setkeys{addweapon}{#1}%
	\addtocounter{\weapon@companion weaponweightcount}{#7}%
	\expandafter\appendcmd\expandafter{\csname\weapon@companion weaponlist\endcsname}{%
	    \resetkeys
		\setkeys{addweapon}{#1}%
		\setcounter{tmpcount}{0}%
		\setcounter{tmpcount2}{0}%
		\ifx \weapon@category\empty%
            	\appendcmd{\weapon@category}{weapon}
		\else%
				\appendcmd{\weapon@category}{weapon, }
        \fi%
        
		\foreach\category in \weapon@category {%
			\ifcsname c@\weapon@companion\category attackcategorybonuscount\endcsname%
				\addtocounter{tmpcount}{\value{\weapon@companion\category attackcategorybonuscount}}%
			\fi%
			\ifcsname c@\weapon@companion\category damagecategorybonuscount\endcsname%
				\addtocounter{tmpcount2}{\value{\weapon@companion\category damagecategorybonuscount}}%
			\fi%
		}%
	
	    \foreach\base in \weapon@base {%
			\ifcsname c@\weapon@companion\base attackcategorybonuscount\endcsname%
				\addtocounter{tmpcount}{\value{\weapon@companion\base attackcategorybonuscount}}%
			\fi%
			\ifcsname c@\weapon@companion\base damagecategorybonuscount\endcsname%
				\addtocounter{tmpcount2}{\value{\weapon@companion\base damagecategorybonuscount}}%
			\fi%
		}%
		\setcounter{tmpattackmodcount}{\value{\weapon@companion babcount}+\value{\weapon@companion \weapon@attackattribute}+\value{\weapon@companion sizemodcount}+\weapon@attackbonus+\weapon@enhancement+\value{tmpcount}+\ifbool{\weapon@masterwork}{1}{0}}%
		\setcounter{tmpweapondamagecount}{\value{\weapon@companion \weapon@damageattribute}+\weapon@damagebonus+\weapon@enhancement+\value{tmpcount2}}%
		\fontsize{6}{6}\selectfont\bf\scshape \ifthenelse{\weapon@enhancement > 0}{MA}{\ifbool{\weapon@masterwork}{MW}{}} &
		\tfont #2 \ifthenelse{\weapon@enhancement = 0}{}{+\weapon@enhancement} &\setkeys{addweapon}{#1} \tfont\ifx \weapon@attack\empty  \plusminus{tmpattackmodcount}\ifthenelse{\value{\weapon@companion babcount}>5}{/\addtocounter{tmpattackmodcount}{-5}\plusminus{tmpattackmodcount}}{}\ifthenelse{\value{\weapon@companion babcount}>10}{/\addtocounter{tmpattackmodcount}{-5}\plusminus{tmpattackmodcount}}{}\ifthenelse{\value{\weapon@companion babcount}>15}{/\addtocounter{tmpattackmodcount}{-5}\plusminus{tmpattackmodcount}}{}\else \setcounter{boolcount}{0}\foreach\member in \weapon@attack {%
			\ifnum \value{boolcount} = 1/\else \setcounter{boolcount}{1}\fi\setcounter{tmpcount3}{\member + \value{tmpattackmodcount}-\value{\weapon@companion babcount}}\plusminus{tmpcount3}}\fi  & \setkeys{addweapon}{#1}%
		\ifthenelse{\equal{\weapon@calculatesize}{false}}%
		{%
			\renewcommand{\tmpcmd}{#3}%
		}%
		{%
			%\IsInteger\expandafter{\weapon@calculatesize}
			%{
				\calculatewweaponsize[\weapon@companion]{\tmpcmd}{\weapon@calculatesize}{#3}%
			%}
		}%
	\tfont\tmpcmd\ifthenelse{\value{tmpweapondamagecount} = 0}{}{\plusminus{tmpweapondamagecount}} &\tfont #4 &\tfont #5 & \tfont#6 & \tfont#7~lbs. & \tfont#8 \setkeys{addweapon}{#1}\ifthenelse{\equal{\weapon@notes}{}}{}{\tabularnewline[-0.9ex] & \multicolumn{8}{l}{\setkeys{addweapon}{#1}\tfont\weapon@notes}}\tabularnewline\hline}%
	\resetkeys%
}

\newcommand\printskills[1][]{	
	\rowcolors{2}{}{}
	 \begin{tabular}[t]{A{2}A{10}B{80}A{21}B{7}A{21}A{7}A{21}A{7}A{21}}	
    	\rowcolor{\setting@defaultboxcolor}& &{\color{\setting@defaultfontcolor}\footnotesize \scshape Skill Names}&{\color{\setting@defaultfontcolor}\lfont Total\\ Bonus}&&{\color{\setting@defaultfontcolor}\lfont Ability\newline Mod.}&&{\color{\setting@defaultfontcolor}\lfont Ranks\\}&&{\color{\setting@defaultfontcolor}\lfont Misc.\\ Mod.}\tabularnewline[-1pt]\hline
 	\csname #1skilllist\endcsname%
	&\lfont\mbox{\ooalign{$\checkmark$\cr\hidewidth$\square$\hidewidth\cr}}&\lfont Class Skill\hspace{2ex}  * trained only & & &\lfont Total & & \arabic{#1skillranks}&&%
	\end{tabular}
}
 \newcommand\addskill[7][]{
	\resetkeys\setkeys{addskill}{#1}
	\global\expandafter\def\csname\addskill@companion #2mod\endcsname{#5}
	\global\newcounter{\addskill@companion #2skillcount}
 	\global\newcounter{\addskill@companion #2skillrankcount}
 	\global\newcounter{\addskill@companion #2bonuscount}
 	\global\newcounter{\addskill@companion #2skillclasscount}
 	\global\newcounter{\addskill@companion #2skilltrainedonly}
 	\addtocounter{\addskill@companion skillranks}{#6}
 	\addtocounter{\addskill@companion #2skilltrainedonly}{1}
 	\addtocounter{\addskill@companion #2skillrankcount}{#6}
 	\addtocounter{\addskill@companion #2bonuscount}{#7}
 	\expandafter\appendcmd\expandafter{\csname\addskill@companion skilllist\endcsname}
	{	
		\resetkeys\setkeys{addskill}{#1}
	 	\ifthenelse{\equal{\csname\addskill@companion #2mod\endcsname}{str}\OR\equal{\csname \addskill@companion #2mod\endcsname}{dex}}
		{
			\setcounter{\addskill@companion tmpArmorPenalty}{\value{\addskill@companion acitemscheckpenalty}}
		}
		{
			\setcounter{\addskill@companion tmpArmorPenalty}{0}
		}
  		\addtocounter{\addskill@companion #2bonuscount}{\value{\addskill@companion tmpArmorPenalty}}
  		\ifcsname c@\addskill@companion skill#5categorybonuscount\endcsname%
  		    \addtocounter{\addskill@companion #2bonuscount}{\value{\addskill@companion skill#5categorybonuscount}}
  		\fi
  		\ifcsname c@\addskill@companion skillallcategorybonuscount\endcsname%
  		    \addtocounter{\addskill@companion #2bonuscount}{\value{\addskill@companion skillallcategorybonuscount}}
        \fi
 		\ifthenelse{\equal{#4}{}\OR\equal{#4}{0}}
		{
			\setcounter{\addskill@companion tmpClassRanks}{0}
		}
		{
			\ifthenelse{\value{\addskill@companion #2skillrankcount}>0}
			{
				\setcounter{\addskill@companion tmpClassRanks}{3}
			}
			{
				\setcounter{\addskill@companion tmpClassRanks}{0}
			}
		}
 		\setcounter{\addskill@companion #2skillcount}{\value{\addskill@companion #2skillrankcount}+\value{\addskill@companion #2bonuscount}+\value{\addskill@companion \csname \addskill@companion #2mod\endcsname modcount}+\value{\addskill@companion tmpClassRanks}}
		\ifthenelse{\equal{#3}{}\OR\equal{#3}{0}}{}{*}
		&\resetkeys\setkeys{addskill}{#1} \classskillbox{#4}&\tfont{#2}
		&\resetkeys\setkeys{addskill}{#1} \ifthenelse{\equal{#3}{}\OR\equal{#3}{0} \OR \value{\addskill@companion #2skillrankcount}>0}{\plusminus{\addskill@companion #2skillcount}}{-}  
		& $=$ 
		&\resetkeys\setkeys{addskill}{#1} \tabto*{1mm}\color{black! 35}\MakeUppercase{\csname \addskill@companion #2mod\endcsname}\tabto*{0mm}\color{black}\noindent\llap{\arabic{\addskill@companion \csname \addskill@companion #2mod\endcsname modcount}} 
		& $+$ 
		&\resetkeys\setkeys{addskill}{#1}  $\arabic{\addskill@companion #2skillrankcount}$ 
		& $+$ 
		&\resetkeys\setkeys{addskill}{#1}  $\arabic{\addskill@companion #2bonuscount}$ \tabularnewline\cline{4-4}\cline{6-6}\cline{8-8}\cline{10-10}
	}
	\resetkeys
}


\newcommand\classskillbox[1]{
  \ifthenelse{\equal{#1}{}\OR\equal{#1}{0}}{$\square$}{\mbox{\ooalign{$\checkmark$\cr\hidewidth$\square$\hidewidth\cr}}}
}

%%Conditional Modifiers
%Text, additional commands
\newcommand\addcondition[2][]{
	\setkeys{addcondition}{#1}%
	\expandafter\appendcmd\expandafter{\csname \condition@companion conditionalmodlist\endcsname}{\tfont#2}
	\ifthenelse{\equal{\condition@comma}{}\OR\equal{\condition@comma}{no}\OR\equal{\condition@comma}{false}\OR\equal{\condition@comma}{0}}{}
	{
		\expandafter\appendcmd\expandafter{\csname \condition@companion conditionalmodlist\endcsname}{, }
	}
	\ifthenelse{\equal{\condition@linebreak}{}\OR\equal{\condition@linebreak}{no}\OR\equal{\condition@linebreak}{false}\OR\equal{\condition@linebreak}{0}}{}
	{
		\expandafter\appendcmd\expandafter{\csname \condition@companion conditionalmodlist\endcsname}{\\}
	}
	\resetkeys
}

\newcommand\writevalue[1]{%
	\setcounter{tmpcount}{#1}%
	\arabic{tmpcount}%
}

\newcommand\writesignedvalue[1]{%
	\setcounter{tmpcount}{#1}%
	\plusminus{tmpcount}%
}

%%Class stuff
%[], Name, level, BAB, Fort, Ref, Will
\newcommand\addclass[7][]{
	\setkeys{addclass}{#1}
	\ifthenelse{\equal{\csname \class@companion classlist\endcsname}{}}{\expandafter\appendcmd\expandafter{\csname \class@companion classlist\endcsname}{\fontsize{7}{7}\selectfont}}{\expandafter\appendcmd\expandafter{\csname \class@companion classlist\endcsname}{, }}
	\expandafter\appendcmd\expandafter{\csname \class@companion classlist\endcsname}{Lvl #3 #2}
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
	\resetkeys
}

\newcommand\lfont{\fontsize{5}{6}\selectfont\bf\scshape}
\newcommand\tfont{\fontsize{7}{8.4}\selectfont}

\newcommand\name[2][]{
	\setkeys{name}{#1}
	\global\expandafter\def\csname \name@companion charname\endcsname{#2}
	\resetkeys
}
\newcommand\playername[2][]{
	\setkeys{playername}{#1}
	\global\expandafter\def\csname \playername@companion charplayername\endcsname{#2}
	\resetkeys
}
\newcommand\alignment[2][]{
	\setkeys{alignment}{#1}
	\global\expandafter\def\csname \alignment@companion charalignment\endcsname{#2}
	\resetkeys
}
\newcommand\deity[2][]{
	\setkeys{deity}{#1}
	\global\expandafter\def\csname \deity@companion chardeity\endcsname{#2}
	\resetkeys
}
\newcommand\race[3][]{
	\setkeys{race}{#1}
	\global\expandafter\def\csname \race@companion charrace\endcsname{#2}
	\setcounter{\race@companion racebasespeedcount}{#3}
	\setcounter{\race@companion basespeedcount}{#3}
	\setcounter{\race@companion armorspeedcount}{#3}
	\resetkeys
}
\newcommand\homeland[2][]{
	\setkeys{homeland}{#1}
	\global\expandafter\def\csname \homeland@companion charhomeland\endcsname{#2}
	\resetkeys
}
%%Size
\setcounter{carrysizemod}{1}

\newcommand\convertsizecategory[2]{
		\setboolean{tmpbool}{false}
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Fine}}}{
		\setcounter{tmpcount}{-4}	
		\global\settoggle{#1smallersizebool}{true}
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Diminutive}}}{
		\setcounter{tmpcount}{-3}
		\global\settoggle{#1smallersizebool}{true}
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Tiny}}}{
		\setcounter{tmpcount}{-2}
		\global\settoggle{#1smallersizebool}{true}
	}{} 
	\ifthenelse{\equal{\detokenize{#2}}{\detokenize{Small}}}{
		\setcounter{tmpcount}{-1}
		\global\settoggle{#1smallersizebool}{true}
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
}

\newcommand\size[2][]{
	\setkeys{size}{#1}
	\convertsizecategory{\size@companion}{#2}	
	\setcounter{\size@companion initialsizeindex}{\value{tmpcount}}
}

\newcommand\initsize[1][]{
	%Find a better way
	%\ifthenelse{\boolean{tmpbool}}
	%{\global\settoggle{#1smallersizebool}{true}}
	%{\global\settoggle{#1smallersizebool}{false}}

	\setcounter{#1sizeindex}{\value{#1initialsizeindex}+\value{#1sizebonuscount}}
	\setcounter{#1specialsizeindex}{\value{#1sizeindex}+\value{#1spezialsizebonuscount}}
	\setcounter{#1stealthsizeindex}{\value{#1sizeindex}}
	\setcounter{#1flysizeindex}{\value{#1sizeindex}}
	\setcounter{#1carrysizeindex}{\value{#1sizeindex}}

	\calculatesizemod[#1]{\value{#1sizeindex}}
	\calculatespecialsizemod[#1]{\value{#1specialsizeindex}}
	\calculatestealthsizemod[#1]{\value{#1stealthsizeindex}}
	\calculateflysizemod[#1]{\value{#1flysizeindex}}
	\calculatecarrysizemod[#1]{\value{#1carrysizeindex}}
	
	 \ifcsname c@#1stealthbonuscount\endcsname
		\addtypedbonus{stealth}{untyped}{\value{stealthsizemodcount}}
	\fi
	\ifcsname c@#1flybonuscount\endcsname
		\addtypedbonus{fly}{untyped}{\value{flysizemodcount}}
	\fi	

	\ifnum \value{#1sizeindex} < -4
		\global\expandafter\def\csname #1charsize\endcsname{Fine}
	\else  \ifnum \value{#1sizeindex} = -3
		\global\expandafter\def\csname #1charsize\endcsname{Diminutive}
	\else  \ifnum \value{#1sizeindex} = -2
		\global\expandafter\def\csname #1charsize\endcsname{Tiny}
	\else  \ifnum \value{#1sizeindex} = -1
		\global\expandafter\def\csname #1charsize\endcsname{Small}
	\else  \ifnum \value{#1sizeindex} = 0
		\global\expandafter\def\csname #1charsize\endcsname{Medium}
	\else  \ifnum \value{#1sizeindex}  = 1
		\global\expandafter\def\csname #1charsize\endcsname{Large}
	\else  \ifnum \value{#1sizeindex} = 2
		\global\expandafter\def\csname #1charsize\endcsname{Huge}
	\else  \ifnum \value{#1sizeindex} = 3
		\global\expandafter\def\csname #1charsize\endcsname{Gargantuan}
	\else 
		\global\expandafter\def\csname #1charsize\endcsname{Colossal}
	\fi
	\fi
	\fi
	\fi
	\fi
	\fi
	\fi
	\fi

	\resetkeys
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

\newcommand\gender[2][]{
	\setkeys{gender}{#1}
	\global\expandafter\def\csname\gender@companion chargender\endcsname{#2}
	\resetkeys
}
\newcommand\age[2][]{
	\setkeys{age}{#1}
	\global\expandafter\def\csname\age@companion charage\endcsname{#2}
	\resetkeys
}
\newcommand\height[2][]{
	\setkeys{height}{#1}
	\global\expandafter\def\csname\height@companion charheight\endcsname{#2}
	\resetkeys
}
\newcommand\weight[2][]{
	\setkeys{weight}{#1}
	\global\expandafter\def\csname\weight@companion charweight\endcsname{#2}
	\resetkeys
}
\newcommand\hair[2][]{
	\setkeys{hair}{#1}
	\global\expandafter\def\csname\hair@companion charhair\endcsname{\fontsize{8}{8}\selectfont #2}
	\resetkeys
}
\newcommand\eyes[2][]{
	\setkeys{eyes}{#1}
	\global\expandafter\def\csname\eyes@companion chareyes\endcsname{\fontsize{8}{8}\selectfont #2}
	\resetkeys
}

%Languages
\newcommand\addlanguages[2][]{
	\setkeys{addlanguages}{#1}%
	\ifthenelse{\equal{\csname\addlanguages@companion languagelist\endcsname}{}}{}
	{
		\expandafter\appendcmd\expandafter{\csname\addlanguages@companion languagelist\endcsname}
	{, }}
	\expandafter\appendcmd\expandafter{\csname\addlanguages@companion languagelist\endcsname}{#2}
	\resetkeys
	}

\newcommand\favouredclass[2][]{
	\setkeys{favouredclass}{#1}%
	\global\expandafter\def\csname\favouredclass@companion charfavouredclass\endcsname{#2}
	\resetkeys
}

%Currency
\newcommand\printcurrency[1][]{
  	\begin{tabular}[t]{>{\centering}p{42\unitlength}>{\centering}p{42\unitlength}>{\centering}p{42\unitlength}>{\centering}p{42\unitlength}}
	\rowcolor{\setting@defaultboxcolor} \leavevmode\color{\setting@defaultfontcolor} \MakeUppercase{Currency}& \leavevmode\lfont\color{\setting@defaultfontcolor}Carried& \leavevmode\lfont\color{\setting@defaultfontcolor}Carried weight&\leavevmode\lfont\color{\setting@defaultfontcolor}Stored\tabularnewline
	\csname #1currencylist\endcsname
	\end{tabular}
}

\newcommand\addcurrency[5][]{
\setkeys{addcurrency}{#1}
\newcounter{\addcurrency@companion #2currencycarriedcount}
\newcounter{\addcurrency@companion #2currencyweightcount}
\newcounter{\addcurrency@companion #2currencystoredcount}
\setcounter{\addcurrency@companion #2currencycarriedcount}{#3}
\setcounter{\addcurrency@companion #2currencyweightcount}{#3*\real{#4}}
\setcounter{\addcurrency@companion #2currencystoredcount}{#5}
\addtocounter{\addcurrency@companion currencyweightcount}{\value{\addcurrency@companion #2currencyweightcount}}
 \expandafter\appendcmd\expandafter{\csname \addcurrency@companion currencylist\endcsname}{\tfont #2 &\resetkeys\setkeys{addcurrency}{#1} \tfont \arabic{\addcurrency@companion #2currencycarriedcount}&\resetkeys\setkeys{addcurrency}{#1} \tfont \arabic{\addcurrency@companion #2currencyweightcount} &\resetkeys\setkeys{addcurrency}{#1} \tfont \arabic{\addcurrency@companion #2currencystoredcount}\tabularnewline}
\resetkeys
}

%Weight

\newcommand{\calculateweight}[1][]{
	\addtocounter{#1itemweightcount}{\value{#1containerweightcount}}%
	\setcounter{#1weightcount}{\value{#1acitemsweight}+\value{#1weaponweightcount}+\value{#1currencyweightcount}+\value{#1itemweightcount}+\value{#1miscweightcount}}%
}

\newcommand{\printweight}[1][]{
	\arabic{#1acitemsweight} + \arabic{#1weaponweightcount} & \arabic{#1currencyweightcount} & \arabic{#1itemweightcount}& \arabic{#1miscweightcount}& \arabic{#1weightcount}
}

%Loads and Lift
\newcommand{\tmpseries}{}

\newcommand{\calculateloadsandlift}[1][]{%
	\ifthenelse{\value{#1strcount} < 10}{\setcounter{#1heavyloadcount}{10*\value{#1strcount}}}%
	{%
		\setcounter{tmpbasecapacitycount}{\value{#1strcount}/10}%
		\setcounter{basecapacitycount}{1+\value{#1strcount}-10*\value{tmpbasecapacitycount}}%
		\POWER{4}{\arabic{tmpbasecapacitycount}}{\tmpseries}%
		\setcounter{seriescapacitycount}{\tmpseries}%
		\ifnum\value{basecapacitycount} = 1%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{25}}%
		\fi%
		\ifnum\value{basecapacitycount} = 2%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{28.75}}%
		\fi%
		\ifnum\value{basecapacitycount} = 3%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{32.5}}%
		\fi%
		\ifnum\value{basecapacitycount} = 4%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{37.5}}%
		\fi%
		\ifnum\value{basecapacitycount} = 5%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{43.75}}%
		\fi%
		\ifnum\value{basecapacitycount} = 6%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{50}}%
		\fi%
		\ifnum\value{basecapacitycount} = 7%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{57.5}}%
		\fi%
		\ifnum\value{basecapacitycount} = 8%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{65}}%
		\fi%
		\ifnum\value{basecapacitycount} = 9%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{75}}%
		\fi%
		\ifnum\value{basecapacitycount} = 10%
			\setcounter{#1heavyloadcount}{\value{seriescapacitycount}*\real{87.5}}%
		\fi%
	}%
	
	\iftoggle{#1smallersizebool}{%
		\setcounter{#1heavyloadcount}{\value{#1heavyloadcount}/\value{#1carrysizemod}}%
	}{%
		\setcounter{#1heavyloadcount}{\value{#1heavyloadcount}*\value{#1carrysizemod}}%
	}%
	\setcounter{#1lightloadcount}{\value{#1heavyloadcount}/3}%
	\setcounter{#1mediumloadcount}{2*\value{#1heavyloadcount}/3}%
	\setcounter{#1liftaboveheadcount}{\value{#1heavyloadcount}}%
	\setcounter{#1liftofgroundcount}{\value{#1heavyloadcount}*2}%
	\setcounter{#1dragandpushcount}{\value{#1heavyloadcount}*5}%

	\ifnum\value{#1weightcount} < \value{#1lightloadcount}%
		\expandafter\renewcommand\csname #1currentload\endcsname{LIGHT}%
	\else%
	\ifnum \value{#1weightcount} < \value{#1mediumloadcount}%
		\addacitem[companion = #1]{\centering{MEDIUM\newline ENCUMBRANCE}}{0}{3}{-3}{0}{medium}{0}%
		\expandafter\renewcommand\csname #1currentload\endcsname{MEDIUM}%
	\else%
		\addacitem[companion = #1]{HEAVY\newline ENCUMBRANCE}{0}{1}{-6}{0}{heavy}{0}%
		\expandafter\renewcommand\csname #1currentload\endcsname{HEAVY}%
	\fi\fi%
}

\newcommand{\printloadsandlift}[1][]{		
	\tfont \arabic{#1lightloadcount} lbs.& \tfont \arabic{#1mediumloadcount} lbs. & \tfont \arabic{#1heavyloadcount} lbs.& & \tfont \arabic{#1liftaboveheadcount} lbs. & \tfont  \arabic{#1liftofgroundcount} lbs.& \tfont \arabic{#1dragandpushcount} lbs.\tabularnewline\hline
	\multicolumn{3}{c}{\MakeUppercase{Current load}}& &\multicolumn{3}{c}{\csname #1currentload\endcsname}\tabularnewline\hline
}

\newcommand\addnote[2]{
	 \appendcmd{\notelist}{\MakeUppercase{#1}&\tfont#2\tabularnewline \hline}
}

%%Lists
%\expandafter\newcommand\csname #2spellrange \endcsname{#6}{}{}
\newcommand{\printcustomlists}{}
%Name,Column ,Column definition
\newcommand\addcustomlist[3]{	
	\newboolean{bool#1list}
	\expandafter\newcommand\csname #1list\endcsname{}
	\expandafter\newcommand\csname #1listhead\endcsname{}
	\appendcmd{\printcustomlists}{
	\ifthenelse{\boolean{bool#1list}}
	{
		\newpage
		\begin{longtable}{#3} 
			\multicolumn{#2}{c}{\drawbox[family = list, special family = custom]{-210}{-2.8}{420}{10}{#1}}\tabularnewline
			\csname #1listhead\endcsname 
			\endhead
			\hline
			\csname #1list\endcsname
		\end{longtable}
	}{}
}
}
%List name, row content
\newcommand\addtocustomlist[2]{
	\setboolean{bool#1list}{true}
	\expandafter\appendcmd\expandafter{\csname #1list\endcsname}{#2\\\hline}
}
\newcommand\addheadtocustomlist[2]{
	\expandafter\appendcmd\expandafter{\csname #1listhead\endcsname}{#2 \tabularnewline}
}

%%Caster
%Name (must be a class name that was added via \addclass), Attribute
\newcommand\addcaster[3][]{
	\setkeys{addcaster}{#1}
	%Spell- lists
	\forloop{loopcount}{0}{\value{loopcount}<10}
	{
		\expandafter\def\csname \caster@companion #2\arabic{loopcount}spelllist\endcsname{}
		\expandafter\def\csname \caster@companion #2\arabic{loopcount}spellnamelist\endcsname{}
		\newboolean{\caster@companion #2\arabic{loopcount}spelllistbool}
		\newboolean{\caster@companion #2\arabic{loopcount}isnumberbool}
		\newboolean{\caster@companion #2\arabic{loopcount}dontshowspellperday}
		\setboolean{\caster@companion #2\arabic{loopcount}dontshowspellperday}{true}
		\setboolean{\caster@companion #2\arabic{loopcount}isnumberbool}{true}
		\newcounter{\caster@companion #2known\arabic{loopcount}spells}
		\newcounter{\caster@companion #2\arabic{loopcount}classspellslots}	
		\newcounter{\caster@companion #2\arabic{loopcount}miscspellslots}
		\newcounter{\caster@companion #2\arabic{loopcount}savebonus}
		\newcounter{\caster@companion #2\arabic{loopcount}knownspells}
		\newcounter{\caster@companion #2\arabic{loopcount}abillityspellslots}
	}

	\ifthenelse{\equal{\csname caster@zeroth\endcsname}{false}}{\setboolean{\caster@companion #20dontshowspellperday}{false}}{}
	\ifthenelse{\equal{\csname caster@first\endcsname}{false}}{\setboolean{\caster@companion #21dontshowspellperday}{false}}{	}
	\ifthenelse{\equal{\csname caster@second\endcsname}{false}}{\setboolean{\caster@companion #22dontshowspellperday}{false}}{}
	\ifthenelse{\equal{\csname caster@third\endcsname}{false}}{\setboolean{\caster@companion #23dontshowspellperday}{false}}{}
	\ifthenelse{\equal{\csname caster@fourth\endcsname}{false}}{\setboolean{\caster@companion #24dontshowspellperday}{false}}{}
	\ifthenelse{\equal{\csname caster@fifth\endcsname}{false}}{\setboolean{\caster@companion #25dontshowspellperday}{false}}{}
	\ifthenelse{\equal{\csname caster@sixth\endcsname}{false}}{\setboolean{\caster@companion #26dontshowspellperday}{false}}{}
	\ifthenelse{\equal{\csname caster@seventh\endcsname}{false}}{\setboolean{\caster@companion #27dontshowspellperday}{false}}{}
	\ifthenelse{\equal{\csname caster@eighth\endcsname}{false}}{\setboolean{\caster@companion #28dontshowspellperday}{false}}{}
	\ifthenelse{\equal{\csname caster@ninth\endcsname}{false}}{\setboolean{\caster@companion #29dontshowspellperday}{false}}{}


	\IsInteger{\csname caster@zeroth\endcsname}{\setcounter{\caster@companion #20classspellslots}{\csname caster@zeroth\endcsname}}{\setboolean{\caster@companion #20isnumberbool}{false}}
	\IsInteger{\csname caster@first\endcsname}{\setcounter{\caster@companion #21classspellslots}{\csname caster@first\endcsname}}{\setboolean{\caster@companion #21isnumberbool}{false}}
	\IsInteger{\csname caster@second\endcsname}{\setcounter{\caster@companion #22classspellslots}{\csname caster@second\endcsname}}{\setboolean{\caster@companion #22isnumberbool}{false}}
	\IsInteger{\csname caster@third\endcsname}{\setcounter{\caster@companion #23classspellslots}{\csname caster@third\endcsname}}{\setboolean{\caster@companion #23isnumberbool}{false}}
	\IsInteger{\csname caster@fourth\endcsname}{\setcounter{\caster@companion #24classspellslots}{\csname caster@fourth\endcsname}}{\setboolean{\caster@companion #24isnumberbool}{false}}
	\IsInteger{\csname caster@fifth\endcsname}{\setcounter{\caster@companion #25classspellslots}{\csname caster@fifth\endcsname}}{\setboolean{\caster@companion #25isnumberbool}{false}}
	\IsInteger{\csname caster@sixth\endcsname}{\setcounter{\caster@companion #26classspellslots}{\csname caster@sixth\endcsname}}{\setboolean{\caster@companion #26isnumberbool}{false}}
	\IsInteger{\csname caster@seventh\endcsname}{\setcounter{\caster@companion #27classspellslots}{\csname caster@seventh\endcsname}}{\setboolean{\caster@companion #27isnumberbool}{false}}
	\IsInteger{\csname caster@eighth\endcsname}{\setcounter{\caster@companion #28classspellslots}{\csname caster@eighth\endcsname}}{\setboolean{\caster@companion #28isnumberbool}{false}}
	\IsInteger{\csname caster@ninth\endcsname}{\setcounter{\caster@companion #29classspellslots}{\csname caster@ninth\endcsname}}{\setboolean{\caster@companion #29isnumberbool}{false}}
	
 	\newcounter{\caster@companion #2knownspells}

	%Domains, School, Bloodlines
	\expandafter\newcommand\csname \caster@companion #2powerlist\endcsname{}	

	\addtocounter{\caster@companion #2casterlevelcount}{\caster@offset}
	\newcounter{\caster@companion #2spelldc}

	%Animate dead
	\ifthenelse{\boolean{\csname caster@showbuckets\endcsname}}
	{
		\addtocounter{\caster@companion animationbucketcapacity}{4*\value{\caster@companion #2casterlevelcount}*\caster@animatedeadmultiplier+\caster@animatedeadbonus}
		\addtocounter{\caster@companion featbucketcapacity}{\value{\caster@companion #2levelcount}}
		\addtocounter{\caster@companion corpse companionbucketcapacity}{\value{\caster@companion #2casterlevelcount}}
	}{}
	
	\expandafter\appendcmd\expandafter{\csname \caster@companion printcasters\endcsname}{
		\setkeys{addcaster}{#1}
		 \newpagetitlebox[\caster@companion]					
		\forloop{loopcount}{0}{\value{loopcount}<10}
		{
			\addtocounter{\caster@companion #2\arabic{loopcount}savebonus}{10+\value{loopcount}+\value{\caster@companion #3modcount}}	
		}
		\ifthenelse{\boolean{\caster@calculatebonusspells}}{
		\forloop{loopcount}{1}{\value{loopcount}<10}
		{
			\setcounter{tmpcount}{\value{loopcount}-1}
			\forloop[-4]{innerloopcount}{\value{\caster@companion #3modcount}}{\value{innerloopcount}>\value{tmpcount}}{			
				\ifthenelse{\value{\caster@companion #2\arabic{loopcount}classspellslots}>0}{
					\addtocounter{\caster@companion #2\arabic{loopcount}abillityspellslots}{1}
				}{}
			}
		}
		}{}

		\begin{picture}(420,200)
		\drawbox[family = caster, special family = caster name]{-11.5}{200}{420}{10}{#2}
		\drawbox[family = caster, special family = spells per day]{-11.5}{180}{205}{10}{\caster@spellname\, per day}
		%Spells per day
		\put(70,170){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \lfont\MakeUppercase{Used}}}
		\stretchlabels{99}{170}{194}{TOTAL, class, abillity mod., misc}
		\setcounter{tmpcount}{155}
		\forloop{loopcount}{0}{\value{loopcount}<10}
		{
			\ifthenelse{\boolean{\caster@companion #2\arabic{loopcount}dontshowspellperday}}{
				\ifthenelse{\boolean{\caster@companion #2\arabic{loopcount}isnumberbool}}
				{
					\put(70,\arabic{tmpcount}){\framebox(20,\boxheight){}}
					\stretchequalattributes{99}{\arabic{tmpcount}}{194}{\arabic{\caster@companion #2\arabic{loopcount}classspellslots},\arabic{\caster@companion #2\arabic{loopcount}abillityspellslots},\arabic{\caster@companion #2\arabic{loopcount}miscspellslots}}
				}
				{
					\put(99,\arabic{tmpcount}){\framebox(15,\boxheight){}}
					\addtocounter{tmpcount}{2}
					\put(96.5,\arabic{tmpcount}){\parbox[b][3\unitlength][b]{20\unitlength}{\centering $\infty$}}
					\addtocounter{tmpcount}{-2}
				}
			}{}
			\addtocounter{tmpcount}{-15}
		}
		%Spell level
		\put(42,137){\parbox[b][38\unitlength][t]{10\unitlength}{\centering \MakeUppercase{Level}}}
		\put(48,125){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 0}}
		\put(48,109){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 1st}}
		\put(48,94){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 2nd}}
		\put(48,79){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 3rd}}
		\put(48,64){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 4th}}
		\put(48,49){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 5th}}
		\put(48,34){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 6th}}
		\put(48,19){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 7th}}
		\put(48,4){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 8th}}
		\put(48,-11){\parbox[b][38\unitlength][t]{10\unitlength}{\centering 9th}}
		%Spell DC
		\ifthenelse{\boolean{\caster@showdcs}}{
		\put(20,137){\parbox[b][38\unitlength][t]{10\unitlength}{\centering \lfont\MakeUppercase{Save DC}}}
		\put(18,155){\framebox(15,\boxheight){}}
		\put(15.5,157){\parbox[b][3\unitlength][b]{20\unitlength}{\centering  \arabic{\caster@companion #20savebonus}}}
		\put(18,140){\framebox(15,\boxheight){}}
		\put(15.5,142){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #21savebonus}}}
		\put(18,125){\framebox(15,\boxheight){}}
		\put(15.5,127){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #22savebonus}}}
		\put(18,110){\framebox(15,\boxheight){}}		
		\put(15.5,112){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #23savebonus}}}
		\put(18,95){\framebox(15,\boxheight){}}
		\put(15.5,97){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #24savebonus}}}
		\put(18,80){\framebox(15,\boxheight){}}
		\put(15.5,82){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #25savebonus}}}
		\put(18,65){\framebox(15,\boxheight){}}
		\put(15.5,67){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #26savebonus}}}
		\put(18,50){\framebox(15,\boxheight){}}
		\put(15.5,52){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #27savebonus}}}
		\put(18,35){\framebox(15,\boxheight){}}
		\put(15.5,37){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #28savebonus}}}
		\put(18,20){\framebox(15,\boxheight){}}		
		\put(15.5,22){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #29savebonus}}}
		}{}
		%Spells known			
		\forloop{loopcount}{0}{\value{loopcount}<10}
		{
			\addtocounter{\caster@companion #2knownspells}{\value{\caster@companion #2\arabic{loopcount}knownspells}}
		}	
		\put(-10,137){\parbox[b][38\unitlength][t]{10\unitlength}{\centering \lfont\MakeUppercase{\caster@spellname\, known}}}	
		\put(-10,155){\framebox(15,\boxheight){}}
		\put(-12.5,157){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #20knownspells}}}
		\put(-10,140){\framebox(15,\boxheight){}}
		\put(-12.5,142){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #21knownspells}}}
		\put(-10,125){\framebox(15,\boxheight){}}
		\put(-12.5,127){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #22knownspells}}}
		\put(-10,110){\framebox(15,\boxheight){}}
		\put(-12.5,112){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #23knownspells}}}
		\put(-10,95){\framebox(15,\boxheight){}}
		\put(-12.5,97){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #24knownspells}}}
		\put(-10,80){\framebox(15,\boxheight){}}
		\put(-12.5,82){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #25knownspells}}}
		\put(-10,65){\framebox(15,\boxheight){}}
		\put(-12.5,67){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #26knownspells}}}
		\put(-10,50){\framebox(15,\boxheight){}}
		\put(-12.5,52){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #27knownspells}}}
		\put(-10,35){\framebox(15,\boxheight){}}
		\put(-12.5,37){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #28knownspells}}}
		\put(-10,20){\framebox(15,\boxheight){}}
		\put(-12.5,22){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #29knownspells}}}
		\put(-10,5){\framebox(15,\boxheight){}}
		\put(-12.5,7){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #2knownspells}}}
		%Domains, Bloodlines, Schools
		\drawbox[family = caster, special family = caster level]{203}{180}{75}{10}{\caster@levelname\, Level}
		\put(282,180.5){\framebox(15,\boxheight){}}
		\put(279,182.5){\parbox[b][3\unitlength][b]{20\unitlength}{\centering \arabic{\caster@companion #2casterlevelcount}}}

		\drawbox[family = caster, special family = caster attribute]{300}{180}{85}{10}{Primary Attribute}
		\put(390,180.5){\framebox(18,\boxheight){}}
		\put(387,182.5){\parbox[b][3\unitlength][b]{24\unitlength}{\centering \MakeUppercase{#3}}}
	
		\ifthenelse{\boolean{\csname caster@showbuckets\endcsname}}
		{
			\rowcolors{2}{}{}
			\put(201,170){
				\begin{tabular}[t]{p{32\unitlength} >{\centering}p{31\unitlength} >{\centering}p{31\unitlength} >{\centering}p{29\unitlength} >{\centering}p{36\unitlength}} 
					\rowcolor{\setting@defaultboxcolor}\leavevmode\color{\setting@defaultfontcolor} \MakeUppercase{Buckets} & \leavevmode\color{\setting@defaultfontcolor}\lfont Animation & \leavevmode\color{\setting@defaultfontcolor}\lfont Feat & \leavevmode\color{\setting@defaultfontcolor}\lfont Spell &\leavevmode\color{\setting@defaultfontcolor} \lfont Corpse Companion\tabularnewline\hline
				\tfont Curr./Max. &\tfont \arabic{\caster@companion animationbucket}/\arabic{\caster@companion animationbucketcapacity} &\tfont \arabic{\caster@companion featbucket}/\arabic{\caster@companion featbucketcapacity} &\tfont \arabic{\caster@companion spellbucket}/$\infty$ &\tfont \arabic{\caster@companion corpse companionbucket}/\arabic{\caster@companion corpse companionbucketcapacity}\tabularnewline\hline
				\end{tabular}
			}			
			\put(203,157){\begin{tabular}[t]{p{196\unitlength}}
			\csname \caster@companion #2powerlist\endcsname
			\end{tabular}
			}
		}
		{
			\put(203,178){\begin{tabular}[t]{p{196\unitlength}}
			\csname \caster@companion #2powerlist\endcsname
			\end{tabular}
			}
	 	}	
		%\csname #2powerlist\endcsname

		%\caster@companion #2known\arabic{loopcount}spells		

		\end{picture}%

		%%Spell overview
		\ifthenelse{\boolean{\caster@showspelloverview}}{
			\setcounter{l_overviewone_seq_bool}{0}
			\setcounter{l_overviewtwo_seq_bool}{0}
			\setcounter{l_overviewthree_seq_bool}{0}
			\setcounter{overviewnextlevel}{0}		
			\setlength{\tabcolsep}{0pt}
			\begin{longtable}{>{}p{0.331\textwidth}>{}p{0.003\textwidth}>{}p{0.331\textwidth}>{}p{0.003\textwidth}>{}p{0.331\textwidth}}%
					\multicolumn{5}{c}{\drawbox[family = caster, special family = caster spells]{-210}{0}{420}{10}{#2 \caster@spelloverviewname -Overview}}\tabularnewline%
					\hline\\[-7.5pt]
					\endhead 
					\forloop{loopcount}{0}{\value{l_overviewone_seq_bool} <1 \OR \value{l_overviewtwo_seq_bool} <1 \OR \value{l_overviewthree_seq_bool} <1}
					{
						\getnextitem{\cmd}{l_overviewone_seq}{#2}%
						\cmd%
						& &\getnextitem{\cmdtwo}{l_overviewtwo_seq}{#2}%
						\cmdtwo%
						& &\getnextitem{\cmdthree}{l_overviewthree_seq}{#2}%
						\cmdthree \tabularnewline
					}
			\end{longtable}		
			\setlength{\tabcolsep}{6pt}	
		}{}

		%%Spell list
		%\begin{longtable}{| p{.015\textwidth}| p{.47\textwidth}| p{.1\textwidth} | p{.07\textwidth} | p{.065\textwidth} | p{.07\textwidth}| p{.05\textwidth} |} 
		\begin{longtable}{| >{\centering}p{.015\textwidth}| >{\centering}p{.2\textwidth} |>{\centering} p{.15008\textwidth} | >{\centering}p{.1\textwidth} | >{\centering}p{.199\textwidth}| >{\centering}p{.199\textwidth} |} 
			\multicolumn{6}{c}{\drawbox[family = caster, special family = caster spells]{-210}{-2.8}{420}{10}{#2 \caster@spellname}}\tabularnewline
			\hline
			\rowcolor{\setting@defaultboxcolor}\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Prep.}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{School}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Duration}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Range}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Save}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Target}\tabularnewline
			\hline
			\endfirsthead 
			\hline
			\multicolumn{6}{c}{\drawbox[family = caster, special family = caster spells]{-210}{-2.8}{420}{10}{#2 \caster@spellname}}\tabularnewline
			\rowcolor{\setting@defaultboxcolor}\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Prep.}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{School}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Duration}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Range}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Save}&\centering\color{\setting@defaultfontcolor}\lfont\MakeUppercase{Target}\tabularnewline\hline
			\multicolumn{6}{c}{}\tabularnewline
			\hline
			\endhead 
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
		\end{longtable}}
	\resetkeys
}

%%SPELL OVERVIEW COMMANDS---------------------------------------------------------------------------------------------------------------------------------------------------------------
\ExplSyntaxOn
	\seq_new:N \l_overviewone_seq
	\seq_new:N \l_overviewtwo_seq
	\seq_new:N \l_overviewthree_seq

	\NewDocumentCommand{\getnextitem}{ m m m}
 	{
 		\egreg_seq_next:nnn { #1 } { #2 } { #3 }%
	 }
	\cs_new_protected:Npn \egreg_seq_next:nnn #1 #2 #3
 	{%
		\seq_get_left:cN  { #2 } { \tmpcmd }%
		\quark_if_no_value:NTF{\tmpcmd}{%
					\egreg_seq_nextlevel:nnn  { #1 } { #2 } { #3 }%
		}{%
				\seq_gpop_left:cN { #2 } { #1 }%
		}%
	}
	\cs_new_protected:Npn \egreg_seq_nextlevel:nnn #1 #2 #3
	{
		\ifthenelse{\value{overviewnextlevel} < 10}%
		{%
			\global\seq_set_from_clist:cc {#2}  {\caster@companion #3\arabic{overviewnextlevel}spellnamelist}%
			\seq_get_left:cN  { #2 } { \tmpcmd }%
			\quark_if_no_value:NTF{\tmpcmd}{%				
				\addtocounter{overviewnextlevel}{1}%
				\egreg_seq_nextlevel:nnn  { #1 } { #2 } { #3 }%
			}%
			{%		
				\cellcolor{\setting@defaultboxcolor} \centering {\color{\setting@defaultfontcolor} \ORDINALstringnum{\arabic{overviewnextlevel}} $\;$ \MakeUppercase {LEVEL}}%	
				\addtocounter{overviewnextlevel}{1}%
			}%
		}
		{
			\setcounter{#2_bool}{1}
		}
	}

\ExplSyntaxOff
%%--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%Caster, Level, Value
\newcommand\addspellsavebonus[4][]
{
	\setkeys{addspellsavebonus}{#1}%
	\addtocounter{\spellsavebonus@companion #2#3savebonus}{#4}
}

%[], category, Caster, Name
\newcommand\addpower[4][]{%
	\setkeys{addpower}{#1}%
	\ifcsdef{\power@companion #3#2list}{}{%
		\expandafter\newcommand\csname \power@companion #3#2list\endcsname{}%
		\expandafter\appendcmd\expandafter{\csname \power@companion #3#2list\endcsname}{\tabularnewline\rowcolor{\setting@defaultboxcolor} \leavevmode\color{\setting@defaultfontcolor}\centering\MakeUppercase{#2}\tabularnewline} %\rowcolor{black} \leavevmode\color{white}\centering\MakeUppercase{#2}\tabularnewline
		\expandafter\appendcmd\expandafter{\csname \power@companion #3powerlist\endcsname}{\setkeys{addpower}{#1} \csname \power@companion #3#2list\endcsname}%
	}%
	\ifthenelse{\equal{\power@parent}{}}{%		
		\ifcsdef{\power@companion #3#2#4list}{}{%
			\expandafter\newcommand\csname \power@companion #3#2#4sublist\endcsname{}%
			\expandafter\newcommand\csname \power@companion #3#2#4list\endcsname{}%
		}%
		\expandafter\appendcmd\expandafter{\csname \power@companion #3#2#4list\endcsname}{\setkeys{addpower}{#1}#4 \\\csname \power@companion #3#2#4sublist\endcsname}%
	}{%
		\expandafter\appendcmd\expandafter{\csname \power@companion #3#2\power@parent sublist\endcsname}{\hspace{20pt}\textbullet\, #4\\}%
	}%
	\power@commands%
	\expandafter\appendcmd\expandafter{\csname \power@companion #3#2list\endcsname}{\setkeys{addpower}{#1}\csname \power@companion #3#2#4list\endcsname}%
	\resetkeys%
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

\newcommand\printcompanions{
	\foreach \x in \companionlist
	{
		\input{Companions/\x}
	}
}
%[Type] Name
%\newcommand\addcompanion[2][]{
%	\setkeys{addcompanion}{#1}
%	\initvariables[#2]	
%	\renewcommand\currcompanion{#2}
%	\ifthenelse{\equal{\companion@loadfile}{}}{}
%	{
%		\input{Companions/\companion@loadfile}
%	}
%	\appendcmd{\printcompanions}{
%		\renewcommand\currcompanion{#2}
%		\newpagetitlebox[#2]
%		\printsheet[#2]
%	}
%	\resetkeys
%}

%[Type] Name
\newcommand\addcompanion[2][]{
	\appendcmd{\companionlist}{%
		%\ifx \companionlist\emptylist%
		%	#2%%
		%\else%
		%	, #2%%
		%\fi%
		#2%
	}
}

\newcommand\printsheet[1][]
{

}
\newcommand\newpagetitlebox[1][]
{
	\newpage
	\ifthenelse{\equal{#1}{}}{}{%
		\begin{picture}(420, 0)%
			\put(0,-8){\drawbox[family = companion]{\setting@ctbx}{\setting@ctby}{\setting@ctbwidth}{\setting@ctbheight}{#1}}%
		\end{picture}%
	}
}

%Command to simplfy the animate dead spell and similar effects
%Create an ID = <Companion><counter> to identify the creatures 
%#1: optional parameter (Companion, Template, Bucket)
%#2: Name
%#3: Hit die/ Level
%#4: HP
%#5: Size
%#6: Strength
%#7: Dexterity 
%#8: Undead type (Zombie or Skeleton)
%#9: Additional commands
\newcommand\animatedead[9][]{
	\setkeys{animatedead}{#1}
	\edef\ID{\animatedead@companion\arabic{\animatedead@companion undeadcount}}
	\initvariables[\ID]	
	\global\expandafter\renewcommand\csname\ID undeadtype\endcsname{#8}
	\addtocounter{\animatedead@companion undeadcount}{1}
	\ifthenelse{\equal{\animatedead@bucket}{none}}{}{
	    \addtocounter{\animatedead@companion\animatedead@bucket bucket}{#3*\csname animatedead@number\endcsname}
	}
	\newcounter{\animatedead@companion\ID numbercount}
	\addtocounter{\animatedead@companion\ID numbercount}{\animatedead@number}
	%\addclass														Class name, 		level,	 BAB,	 Fort,	 	REF, 		Will
	\addclass[companion = \ID, calculate bab = true,calculate fort = true, calculate ref = true, calculate will = true]	{animatedead}	{#3}	{3/4}	{1/3}		{1/3}		{1/2+2}
	\name[companion = \ID]{#2}
	\size[companion = \ID]{#5}
	\setattribute[companion = \ID]{str}{#6}
	\setattribute[companion = \ID]{dex}{#7}
	\setattribute[companion = \ID]{con}{-}
	\setattribute[companion = \ID]{int}{10}
	\setattribute[companion = \ID]{wis}{10}
	\setattribute[companion = \ID]{cha}{12}
	
	\setcounter{\ID hpcount}{#4}
	\changeattribute[\ID]{hp}{cha}
	\changeattribute[\ID]{fort}{cha}

	%%Skills
	%		Name, 				trained only	 classskill	 Abillity mod  ranks	misc
	\addskill[companion = \ID]	{Climb}				{0}		{1}		{str}		{0}	{0}
	\addskill[companion = \ID]	{Disguise}				{0}		{1}		{cha}		{0}	{0}
	\addskill[companion = \ID]	{Fly}					{0}		{1}		{dex}		{0}	{0}
	\addskill[companion = \ID]	{Intimidate}				{0}		{1}		{cha}		{0}	{0}
	\addskill[companion = \ID]	{Knowledge (arcane)}		{1}		{1}		{int}		{0}	{0}
	\addskill[companion = \ID]	{Knowledge (religion)}		{1}		{1}		{int}		{0}	{0}
	\addskill[companion = \ID]	{Perception}				{0}		{1}		{wis}		{0}	{0}
	\addskill[companion = \ID]	{Sense Motive}			{0}		{1}		{wis}		{0}	{0}
	\addskill[companion = \ID]	{Spellcraft}				{1}		{1}		{int}		{0}	{0}
	\addskill[companion = \ID]	{Stealth}				{0}		{1}		{dex}		{0}	{0}
	
	\setkeys{animatedead}{#1}
	\foreach \x in \animatedead@template
	{
		\expandafter\loadtemplate{\x}
	}
	#9
	\initsize[\ID]
	\loadtemplate{#8}	
	\resetkeys
}

%Adds a template for \animatedead
%#1: Name
%#2: Content like feats, attribute increase, etc.
\newcommand\addtemplate[2]{
	\expandafter\newcommand\csname template#1\endcsname{#2}
}
%Loads a template
%#1: Companion (not yet relevant)
%#2: Name
\newcommand\loadtemplate[2][]{
	\expandafter\csname template#2\endcsname
}

\newcounter{animatedeadloop}
\newcommand\printanimatedead[1][]{
	\begin{longtable}{p{\textwidth}}
	\forloop{animatedeadloop}{0}{\value{animatedeadloop}<\value{#1undeadcount}}{
		\ifnum\value{animatedeadloop} > 0
			\tabularnewline
		\fi
		\noindent\begin{picture}(420,202)
		\edef\ID{#1\arabic{animatedeadloop}}		
		\initsize[\ID]
		\drawbox[subtext = number]{0}{201}{20}{10}{\arabic{\ID numbercount}}
		\drawbox{20}{201}{400}{10}{\csname \ID charname\endcsname $\;$ (\csname \ID charsize\endcsname $\;$ \csname \ID charrace\endcsname $\;$ \csname \ID undeadtype\endcsname)}
		\drawbox[subtext = HD]{400}{201}{20}{10}{\arabic{\ID levelcount}}
		%%STR
		\drawbox[subtext = strength]{0}{188}{28}{10}{STR}
		\stretchattributes{33}{188}{66}{\iftoggle{\ID strcountnovaluebool}{-}{\arabic{\ID strcount}} ,\plusminus{\ID strmodcount}}		
 	 	%% DEX
  		\drawbox[subtext = dexterity]{0}{176}{28}{10}{DEX}
  		\stretchattributes{33}{176}{66}{\iftoggle{\ID dexcountnovaluebool}{-}{\arabic{\ID dexcount}} ,\plusminus{\ID dexmodcount}}	
  		%%% CON
  		%\drawbox[subtext = constitution]{0}{476}{28}{10}{CON}
  		%\stretchattributes{33}{476}{66}{\arabic{\ID concount},\plusminus{\ID conmodcount}}  
  		%% INT
  		\drawbox[subtext = intelligence]{0}{164}{28}{10}{INT}
  		\stretchattributes{33}{164}{66}{\iftoggle{\ID intcountnovaluebool}{-}{\arabic{\ID intcount}} ,\plusminus{\ID intmodcount}}	
  		%% WIS
  		\drawbox[subtext = wisdom]{0}{152}{28}{10}{WIS}
  		\stretchattributes{33}{152}{66}{\iftoggle{\ID wiscountnovaluebool}{-}{\arabic{\ID wiscount}} ,\plusminus{\ID wismodcount}}	
  		%% CHA
  		\drawbox[subtext = charisma]{0}{140}{28}{10}{CHA}
  		\stretchattributes{33}{140}{66}{\iftoggle{\ID chacountnovaluebool}{-}{\arabic{\ID chacount}} ,\plusminus{\ID chamodcount}}	
		 %% HP
  		\drawbox[family = info, special family = hp, subtext =  (\csname \ID hpmod\endcsname)]{72}{186}{26}{12}{HP}
  		\put(102,186){\framebox(38,12){}}
  		\put(102,193){\makebox(14,4){\tiny\scshape Total}}
  		\put(102,186){\parbox[b][12\unitlength][c]{36\unitlength}{\raggedleft \chartotalhp[\ID]}}
		\put(142,186){\framebox(38,12){}}	
  		\put(142,193){\makebox(16,4){\tiny\scshape wounds}}	
		\put(182,186){\framebox(28,12){}}
  		\put(182,193){\makebox(8,4){\tiny\scshape DR}}
		\put(181,185){\parbox[b][12\unitlength][c]{26\unitlength}{\raggedleft \tfont{\csname \ID damagereduction\endcsname}}}
		\setcounter{tmpcount}{215}
		\setcounter{tmpcount2}{186}
		\setcounter{tmpcount3}{\value{\ID numbercount}+1}
		\forloop{loopcount}{2}{\value{loopcount}< \value{tmpcount3}}
		{
			
			\ifthenelse{\value{loopcount}<8}{
				\ifthenelse{\value{loopcount} = 5}{
					\setcounter{tmpcount}{215}
					\setcounter{tmpcount2}{166}
				}{}
				\put(\arabic{tmpcount},\arabic{tmpcount2}){\framebox(29,12){}}
				\addtocounter{tmpcount}{6}				
				\addtocounter{tmpcount2}{-5}
  				\put(\arabic{tmpcount},\arabic{tmpcount2}){\makebox(16,4){\lfont Wounds \#\arabic{loopcount}}}
				\addtocounter{tmpcount}{25}
				\addtocounter{tmpcount2}{+5}
			}{\setcounter{loopcount}{\value{tmpcount3}}}
		}		

		%% fort, reflex and will
  		\stretchlabels{128}{178}{210}{TOTAL, base save, ability modifier, misc modifier}
  		\drawbox[subtext = (\writeattributename{\csname \ID fortmod\endcsname})]{72}{166}{53}{10}{fortitude}
  		\stretchequalattributes{128}{166}{210}{\arabic{\ID fortcount},\arabic{\ID \csname \ID fortmod\endcsname modcount},\arabic{\ID fortbonuscount}}
  		\drawbox[subtext =(\writeattributename{\csname \ID refmod\endcsname})]{72}{151}{53}{10}{reflex}
  		\stretchequalattributes{128}{151}{210}{\arabic{\ID refcount},\arabic{\ID \csname \ID refmod\endcsname modcount},\arabic{\ID refbonuscount}}
  		\drawbox[subtext =(\writeattributename{\csname \ID willmod\endcsname})]{72}{136}{53}{10}{will}  
  		\stretchequalattributes{128}{136}{210}{\arabic{\ID willcount},\arabic{\ID \csname \ID willmod\endcsname modcount},\arabic{\ID willbonuscount}}
		 %% AC			
		%\setcounter{\ID acdexbonuscount}{20}
		\initacitems[\ID]%
  		\drawbox[subtext = armor class]{0}{123}{27}{10}{AC}	
  		\equalattributes{29}{123.5}{10,\arabic{\ID acarmorbonuscount},\arabic{\ID acshieldbonuscount},\arabic{\ID acdexbonuscount},\arabic{\ID sizemodcount},\arabic{\ID acnaturalbonuscount},\arabic{\ID acdeflectionbonuscount},\arabic{\ID acmiscbonuscount}}{20}
  		\scaleattributelabels{29}{113}{TOTAL,default, armor bonus,shield bonus,\csname \ID acmod\endcsname\, \mbox{modifier},size \mbox{modifier},natural armor,\mbox{deflection} \mbox{modifier},misc \mbox{modifier}}{20}
  		%% Touch, Flat footed
  		\drawbox[subtext = armour class]{0}{103}{35}{10}{TOUCH}
  		\attributes{40}{103.5}{\calculatetouchac[\ID]}
  		\drawbox[subtext = armour class]{60}{103}{55}{10}{FLAT-FOOTED}
  		\attributes{120}{103.5}{\calculateflatfootedac[\ID]} 
%		%%Skills
%		\put(215,507){\printskills[\ID]}
		%%Feats and Features
		\drawbox[family = info, special family = conditional modifiers]{215}{150}{205}{10}{Feats and Features}
  		\put(215.11,60){\framebox(204.78,90){}}
  		\put(220,104){\parbox[b][43\unitlength][t]{195\unitlength}{\normalsize\itshape \textbf{FEATURES: }\csname \ID alternatefeaturelist\endcsname\\ \normalsize\itshape \textbf{FEATS: }\csname \ID alternatefeatlist\endcsname}}
		%%Base attack bonus
 		\drawbox[family = info, special family = bab]{310}{186}{90}{11}{base attack bonus}
  		\attributes{404}{187}{\arabic{\ID babcount}}
		%%CMB and CMD
  		\drawbox[family = info, special family = cmb]{0}{85}{21}{11}{cmb}
  		\stretchequalattributes{25}{86}{135}{\arabic{\ID babcount}, \arabic{\ID\csname\ID cmbmod\endcsname modcount},\arabic{\ID specialsizemodcount}, \arabic{\ID cmbmisccount}}
  		\stretchlabels{25}{80}{135}{TOTAL, BAB,\csname \ID cmbmod\endcsname\, mod., size mod., misc}
  		\drawbox[family = info, special family = cmd]{0}{65}{21}{11}{cmd}
  		\setcounter{tmpcount}{10+\value{\ID acmiscbonuscount}+\value{\ID acdeflectionbonuscount}}
  		\stretchequalattributes{25}{66}{135}{\arabic{\ID babcount},\arabic{\ID \csname \ID cmdstrmod\endcsname modcount},\arabic{\ID \csname \ID cmddexmod\endcsname modcount},\arabic{\ID specialsizemodcount} ,\arabic{tmpcount}}
  		\stretchlabels{25}{60}{135}{TOTAL, BAB,\csname \ID cmdstrmod\endcsname\, mod.,\csname \ID cmddexmod\endcsname\, mod., size mod., misc}
		%%Speed
		\drawbox[family = info, special family = speed]{140}{77}{25}{35}{speed}
 		\put(170,104){\framebox(40,7){}}
 		\put(169,105){\begin{tabular}[b]{F{17}E{2}F{16}E{2}}\arabic{\ID basespeedcount} &ft. & \basespeedsquares[\ID]& sq.	\end{tabular}}
  		\put(170,101){\parbox[b][3\unitlength][b]{40\unitlength}{\centering\lfont base speed}}
  		\put(170,92){\framebox(40,7){}}
  		\put(169,93){\begin{tabular}[b]{F{17}E{2}F{16}E{2}}\arabic{\ID armorspeedcount} &ft. & \armorspeedsquares[\ID]& sq.\end{tabular}}
 		\put(170,89){\parbox[b][3\unitlength][b]{40\unitlength}{\centering\lfont with armour}}
  		\put(170,80){\framebox(40,7){}}
  		\put(169,81){\begin{tabular}[b]{F{17}E{2}@{\hspace{1ex}/\hspace{-1.6ex}}F{16}E{2}}\arabic{\ID fly speedcount} &ft. & 0& \end{tabular}}
  		\put(170,77){\parbox[b][3\unitlength][b]{40\unitlength}{\lfont\centering fly/manoeuvrability}}
  		\put(140,65){\framebox(20,7){}}
  		\put(139,66){\begin{tabular}[b]{F{16}E{2}}\arabic{\ID swim speedcount} &ft.\end{tabular}}
  		\put(140,62){\parbox[b][3\unitlength][b]{20\unitlength}{\centering\lfont swim}}
  		\put(165,65){\framebox(20,7){}}
  		\put(164,66){\begin{tabular}[b]{F{16}E{2}}\arabic{\ID climb speedcount} &ft.\end{tabular}}
  		\put(165,62){\parbox[b][3\unitlength][b]{20\unitlength}{\centering\lfont climb}}
  		\put(190,65){\framebox(20,7){}}
  		\put(189,66){\begin{tabular}[b]{F{16}E{2}}\arabic{\ID burrow speedcount} &ft.\end{tabular}}
  		\put(190,62){\parbox[b][3\unitlength][b]{20\unitlength}{\centering\lfont burrow}}
		 %% INIT
  		\drawbox[subtext = modifier]{310}{171}{43}{11}{INITIATIVE}
  		\stretchequalattributes{355}{172}{419}{\arabic{\ID \csname \ID initiativemod\endcsname modcount},\arabic{\ID initiativebonuscount}}
  		\stretchlabels{355}{166}{419}{TOTAL, \csname \ID initiativemod\endcsname\, modifier, misc modifier}		
		%%Weapons
 		\put(-2,51){\printweapons[\ID]}
		\end{picture} 
	}
	\end{longtable}
}

%%Enviroments
\newenvironment{Companion}[2][]
{	
	\initvariables[#2]
	\global\def\currcompanion{#2}
	\resetkeys
}
{
	\newpagetitlebox[\currcompanion]
	\printsheet[\currcompanion]
	\global\def\currcompanion{}
	\resetkeys
}


\ExplSyntaxOn
\NewDocumentCommand{\parse}{ m  o }
 {
  \egreg_string:n { #1 }
  %\IfNoValueTF { #3 } { \tl_use:N } { \tl_set_eq:NN #3 } \l_tarass_string_tl
 }

\tl_new:N \l_parse_string_tl
\cs_new_protected:Npn \egreg_string:n #1 
{
	\tl_set:Nn \l_parse_string_tl { #1 }
	\regex_replace_all:nnN {\;} {\;\;} \l_parse_string_tl
	\regex_replace_all:nnN {\,} {\;} \l_parse_string_tl
	\regex_replace_all:nnN {\;\;} {\;\;\,} \l_parse_string_tl
	\tl_reverse:N \l_parse_string_tl
	\regex_replace_once:nnN { \, } { } \l_parse_string_tl
	\tl_reverse:N \l_parse_string_tl  
 }

\NewDocumentCommand{\parseOPTIONAL}{ m }
 {
  \egreg_string_optional:n { #1 }
 }
\tl_new:N \l_optional_string_tl
\tl_new:N \l_optional_parameter_string_tl
\seq_new:N \l_optional_string_seq
\cs_new_protected:Npn \egreg_string_optional:n #1 
 {
	\tl_set:Nn \l_optional_string_tl { #1 }
	\tl_set:Nn \l_optional_parameter_string_tl { #1 }
 	\regex_match:nnTF{\[ [ \w|\W ]* \]}{#1}
	{
		\regex_replace_once:nnN { \[ [\w|\W ]* \] } { } \l_optional_string_tl
		\regex_extract_once:nnN { \[ [\w|\W ]* \] } {#1}  \l_optional_string_seq
		\seq_get_left:NN  \l_optional_string_seq \l_optional_parameter_string_tl
		\regex_replace_all:nnN {\;} {\,}  \l_optional_parameter_string_tl
		\expandafter\tl_put_left:Nn\expandafter \l_optional_string_tl\expandafter{\l_optional_parameter_string_tl}
	}
	{
		\tl_put_left:Nn \l_optional_string_tl {[]}
	}
 }

%------------------------------------------------------------------------------------------------------------
\NewEnviron{Weapon}
{
	\expandafter\expandafter\expandafter\parse\expandafter{\BODY}
	\foreach \x in \l_parse_string_tl
	{
		\expandafter\expandafter\expandafter\parseOPTIONAL\expandafter{\x}
		\expandafter\envaddweapon \l_optional_string_tl 
	}
}

\NewEnviron{ACitem}
{
	\expandafter\expandafter\expandafter\parse\expandafter{\BODY}
	\foreach \x in \l_parse_string_tl
	{
		\expandafter\expandafter\expandafter\parseOPTIONAL\expandafter{\x}
		\expandafter\envaddacitem \l_optional_string_tl 
	}
}

\NewEnviron{Gear}
{
	\expandafter\expandafter\expandafter\parse\expandafter{\BODY}
	\foreach \x in \l_parse_string_tl
	{
		\expandafter\expandafter\expandafter\parseOPTIONAL\expandafter{\x}
		\expandafter\envaddgear \l_optional_string_tl 
	}
}

\NewEnviron{Feature}
{
	\expandafter\expandafter\expandafter\parse\expandafter{\BODY}
	\foreach \x in \l_parse_string_tl
	{
		\expandafter\expandafter\expandafter\parseOPTIONAL\expandafter{\x}
		\expandafter\envaddfeature \l_optional_string_tl 
	}
}

\newcounter{containerenvcount}
\NewEnviron{Container}[4][]
{
	\setkeys{containerenv}{#1}
	\addtocounter{containerenvcount}{1}
	\newcounter{containerenv#2volume}
	\newcounter{containerenv#2volumelimit}
	\setcounter{containerenv#2volumelimit}{#3}
	\newcounter{containerenv#2remainingvolume}
	\setcounter{containerenv#2remainingvolume}{\value{containerenv#2volumelimit}}
	\global\expandafter\edef\csname containerenv#2symbol\endcsname{\csname containerenv@symbol\endcsname}
	\expandafter\expandafter\expandafter\parse\expandafter{\BODY}
	\foreach \x in \l_parse_string_tl
	{
		\expandafter\expandafter\expandafter\parseOPTIONAL\expandafter{\x}
		\expandafter\envcontainer\l_optional_string_tl {#2}
	}
	\ifthenelse{\equal{}{}}
	{
		\addgear [type = container, symbol = \csname containerenv#2symbol\endcsname] {#2}{\arabic{containerenv#2volume}/#3 $\;$lbs.}{#4}
	}
	{
		\addgear[type = container, #1, symbol = \csname containerenv#2symbol\endcsname]{#2}{\arabic{containerenv#2volume}/#3 $\;$lbs.}{#4}
	}
	\resetkeys
}

\NewEnviron{Condition}
{
	\expandafter\expandafter\expandafter\parse\expandafter{\BODY}
	\foreach \x in \l_parse_string_tl
	{
		\expandafter\expandafter\expandafter\parseOPTIONAL\expandafter{\x}
		\expandafter\envaddcondition \l_optional_string_tl 
	}
}

\global\def\envaddacitem[#1]#2;#3;#4;#5;#6;#7;#8;;{\addacitem[#1] {#2} {#3} {#4} {#5} {#6} {\tl_trim_spaces:n{#7}} {#8}}
\def\envaddfeature[#1]#2;#3;#4;#5;#6;;{\addfeature[#1] {#2} {\tl_trim_spaces:n{#3}} {#4} {#5} {#6}}
\ExplSyntaxOff

\def\envaddweapon[#1]#2;#3;#4;#5;#6;#7;#8;;{\addweapon[#1] {#2} {#3} {#4} {#5} {#6} {#7} {#8}}
\def\envaddgear[#1]#2;#3;#4;;{\addgear[#1] {#2} {#3} {#4}}
\def\envcontainer[#1]#2;#3;#4;;#5{
	\setcounter{tmpcount}{#3*#4}
	\newcounter{containerenv#5#2weight}
	\newcounter{containerenv#5#2number}
	
	\setcounter{containerenv#5#2weight}{\value{containerenv#5remainingvolume}/#4}
	\ifnum #3 > \value{containerenv#5#2weight}
		\setcounter{containerenv#5#2number}{#3-\value{containerenv#5#2weight}}
	\else
		\setcounter{containerenv#5#2number}{0}
		\setcounter{containerenv#5#2weight}{#3}
	\fi 
	\ifthenelse{\value{containerenv#5#2number} = #3}
	{
		\ifthenelse{\boolean{\csname containerenv@weightless\endcsname}}
		{
			\expandafter\addgear\expandafter[#1, overwrite weight = true] {#2} {#3} {\value{containerenv#5#2number}*#4}
		}
		{
			\addgear[#1] {#2} {#3} {#4}
		}
	}
	{
		\ifthenelse{\boolean{\csname containerenv@weightless\endcsname}}
		{
			\expandafter\addgear\expandafter[#1, symbol = \csname containerenv#5symbol\endcsname, overwrite weight = true] {#2} {#3} {\value{containerenv#5#2number}*#4}
		}
		{
			\addgear[#1,  symbol = \csname containerenv#5symbol\endcsname] {#2} {#3} {#4}
		}
	}
	\addtocounter{containerenv#5remainingvolume}{-\value{containerenv#5#2weight}*#4}
	\addtocounter{containerenv#5volume}{\value{containerenv#5#2weight}*#4}
}
\def\envaddcondition[#1]#2;;{\addcondition[#1]{#2}}

%----------------------------------------------------------------------Settings----------------------------------------------------------------------
\newcommand\currsetting{default}
\newcommand\setting[1]{\renewcommand{\currsetting}{#1}}

\newcommand\newsetting[2]{
	\expandafter\newcommand\csname setting#1\endcsname{#2}
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
