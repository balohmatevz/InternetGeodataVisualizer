# INFORMATION AND INSTRUCTIONS

This visualization tool is intended to be used with geographic data copied from tables from the Internet. 
For example, Wikipedia has many "lists of countries by X" lists, available here:
https://en.wikipedia.org/wiki/Lists_of_countries_and_territories
Some of these don't have proper visualizations. What you can do is go to a page
https://en.wikipedia.org/wiki/Education_Index
and just copy-paste the table there (just start selection at Afghanistan and end at
the end of the last line. Copy and paste it as-is at the end of this file. The table, 
as seen in April 2015, is the example provided with this program.)

Next you need to tell the program which column contains the country and which column contains
the data. In this case, the 0th column contains the country and the 14th contains the data. 
Remember that the left-most column is the 0th, the next one is the 1st, etc. So the last column
in a table with 15 columns is the 14th column.

Now you can run the program. You can however tweak it too. You can set the scale for the 
visualization with the MINVAL and MAXVAL parameters (can also be set to AUTO), and the colour
at the minimum and maximum value - IE if you want it to go from red at minimum to green at maximum
or from green at minimum to red at maximum or any other colour combination.

This visualization program was developed by Liam :D as part of a university course. Upgrades
and bugfixes are accepted at https://github.com/balohmatevz/InternetGeodataVisualizer

![The probram with default data](http://ss13.eu/dump/laptop/2015-04-30/2015-04-30_16-21-38.png)
