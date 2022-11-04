#!/bin/bash

# This script takes all svg files in the folder, and tests whether a similar .eps_tex file exists
# If not it converts converts the file to eps figures, using inkscapes export-latex tool,
# i.e. two files are created:
# drawing.svg -> drawing.eps
#	      -> drawing.eps_tex
# Afterwards, the fontsize of all text is changed to a specified latex value.
# This is handled through search-replace operations, by use of sed.
#
# If a *.eps_tex already exists, the timestamps of last modification of *.svg and *.eps_tex
# are compared, and if *.eps_tex has been modifed earliest, then a new conversion is made, and the
# font is modified as described above. 
# 
# The echo commands below can be commented in for debugging.
#
# Contact: Morten Juelsgaard, mju@es.aau.dk
# 
# In inkscape you draw your figure, and insert text as you would usually do with the text writing tool (F8 in my shortcut configuration). When writing math, you include $$ as you would in latex. You can write latex math as you like, use greek letters, math-functions etc. and use any custom-defined command you may have defined in latex.
# When the figure is done, you save it as .svg (or inkscape svg - it doesn't matter but dont save as .eps, .pdf or anything else). You must save the .svg relative to the inkscapeAid file, at the path
# Open a terminal and run inkscapeAid. This automatically saves the corresponding .eps and .eps_tex with the latex formatting, in the same location as the .svg file.
# In latex you include the figure as
# 
# \begin{figure}[ht]
#    \begin{center}$
# 	 \def \svgwidth{6cm}
#          \import{<figurePath>}{<fileName>.eps_tex}
#    \end{center}
#    \caption{}
#    \label{}
# \end{figure}
# 
# where you write the proper substitution for <figurePath> and <fileName>.
# The script inkscapeAid treats any .svg file where no .eps file with the same name exists, or alternatively, any .svg file, with a newer time-stamp than the corresponding .eps file.
# The script inkscapeAid takes optional arguments -s [number] and -f. The optional argument -s, followed by an integer number sets the latex fontsize of the text in your figure. The argument -f forces a conversion of all .svg figures, not only those with a newer time stamp than their corresponding .eps files. This can be used for instance in global fontsize replacement.
# 
######### SCRIPT START ####################

# echo 'Converting all files'

# Default settings
fontSize='8' # Define latex font-size - 8 should correspond to \footnotesize{}
force='0' # default: do not convert all figures, only those with changes

# Check for passed options
while getopts ":fs:" option;
do
  case $option in
    f ) 
	force='1';;
    s ) 
	fontSize=$OPTARG;;
    * ) 
	echo 'Invalid argument'
	exit;;
  esac
done	      
shift $(($OPTIND - 1))

# Convert figures
cd figures/inkscape/	
for i in *.svg # check for necessary conversion for all svg's
do
	
	fileEps="${i%.*}.eps" # Define file names
	fileSvg="$i"
	fileTex="${i%.*}.eps_tex"
	if [ ! -s $fileTex ]; # check for *.eps_tex existence

	then
		echo $fileSvg

		###
		## The following is a hack in order for latex to recognize figure borders
		## This hack is only performed the first time a figure is converted, ie if the *.eps_tex file do not exist

		# Define indicator string in *.svg file
		string="label"

		# Find line number of indicator string
		numberCorrupt="$(grep -n $string $fileSvg)"

		# Reformat line nuber
		IFS=":"
		numberCorrect=($numberCorrupt)


		# Get dimensions of drawed area 
		xX="$(inkscape -X $fileSvg)"
		yY="$(inkscape -Y $fileSvg)"
		wW="$(inkscape -W $fileSvg)"
		hH="$(inkscape -H $fileSvg)"

		# Insert a white regtangle as background to svg
		# The rectangle is inserted after first occurent of '>' after line number of indicator string
		sed -i ''$numberCorrect',/</ s|>|>\n <rect \n x="'$xX'" \n y= "'$yY'" \n width="'$wW'" \n height="'$hH'" \n style="fill:#ffffff;stroke:#ffffff;stroke-width:1" id="rectIfy" />|' $fileSvg
		
		## Hack end
		###
	
		inkscape $fileSvg -z -D --export-eps=$fileEps --export-latex # convert *.svg to *.eps and *.eps_tex
		# echo 'Current file: '$i

		# font is changed below
		sed -i 's|%%   http://tug.ctan.org/tex-archive/info/svg-inkscape| \\providecommand\\inkText{\\fontsize{'$fontSize'}{'$fontSize'} \\selectfont\\strut}|' $fileTex
		sed -i 's|smash{|smash{\\inkText |' $fileTex

	else	# if *.eps_tex already exists
		
		#echo 'Current file: '$i '- ALREADY CONVERTED'
		#echo 'Checking for changed file time-stamp'
		
		svgChange=$(stat -c %Y $fileSvg) # Retrieve time-stamps
		svgChangeHR=$(stat -c %y $fileSvg)
		texChange=$(stat -c %Y $fileTex)
		texChangeHR=$(stat -c %y $fileTex)

		#echo $fileSvg 'changed:' $svgChangeHR
		#echo $fileTex 'changed:' $texChangeHR
		
		if [[ $texChange -lt $svgChange || $force -eq '1' ]]; # if svg-file has been modified since last conversion, or conversion should be forced
		then
		
		echo $fileSvg	

		###
		## The following is a hack in order for latex to recognize figure borders
		## This hack is only performed the first time a figure is converted, ie if the *.eps_tex file do not exist

		# Define indicator string in *.svg file
		string="label"

		# Find line number of indicator string
		numberCorrupt="$(grep -n $string $fileSvg)"

		# Reformat line nuber
		IFS=":"
		numberCorrect=($numberCorrupt)


		# Get dimensions of drawed area 
		xX="$(inkscape -X $fileSvg)"
		yY="$(inkscape -Y $fileSvg)"
		wW="$(inkscape -W $fileSvg)"
		hH="$(inkscape -H $fileSvg)"

		# Insert a white regtangle as background to svg
		# The rectangle is inserted after first occurent of '>' after line number of indicator string
		sed -i ''$numberCorrect',/</ s|>|>\n <rect \n x="'$xX'" \n y= "'$yY'" \n width="'$wW'" \n height="'$hH'" \n style="fill:#ffffff;stroke:#ffffff;stroke-width:1" id="rectIfy" />|' $fileSvg
		
		## Hack end
		###
			#echo $fileSvg 'changed since last conversion'
			#echo 'performing new conversion'	
			
			inkscape $fileSvg -z -D --export-eps=$fileEps --export-latex # Perform new conversion
			
			# Font is altered below
			sed -i 's|%%   http://tug.ctan.org/tex-archive/info/svg-inkscape| \\providecommand\\inkText{\\fontsize{'$fontSize'}{'$fontSize'} \\selectfont\\strut}|' $fileTex
			sed -i 's|smash{|smash{\\inkText |' $fileTex
			
			texChangeNewHR=$(stat -c %y $fileTex)
			# echo $fileTex 'changed:' $texChangeNewHR
		fi
	fi
done
cd ../..
exit 0
