#!/bin/bash
#this is a script to make blog entries for GINAW.NET

#define what editor we should use
echo "type your editor:"
read BLOGEDITOR
echo "your editor is $BLOGEDITOR"

#Generates a time string , YYYY-MM-DD_24HH:MM
THETIMENOW=$(/usr/bin/date +%F_%H:%M)

#creates a directory as the current time
mkdir $THETIMENOW

#appends link to blog index file
sed -i "25i '\n''<li><a href="$THETIMENOW/">$THETIMENOW</a></li>'" /home/simcye/ownCloud/simcye/Documents/ginaw-www/blog/index.html

#changes directory to new blog entry
cd $THETIMENOW

#copies blog template to new time directory
cp /home/simcye/ownCloud/simcye/Documents/ginaw-www/blog-template.html index.html

#appends blog timestamp title to file
sed -i "24i <h2>Blog At $THETIMENOW</h2>" index.html

#opens blog timestamp file in editor
$BLOGEDITOR index.html
