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

![The program with default data](http://ss13.eu/dump/laptop/2015-04-30/2015-04-30_16-21-38.png)
The program with default data

# Identifying countries

The program attempts to map coutnry names with their ISO codes. There are however many ways to write each country's name, and while I attempted to put as many in the list as possible (See: Macedonia, Congo, the Koreas...), I am sure I did not include all of them. So what happens if your visualization has a grey hole, which looks like this: (In this example the data for Albania is missing):

![Missing data for Albania](http://ss13.eu/dump/laptop/2015-05-02/2015-05-02_11-24-30.png)

Missing data for Albania

This means that the data for Albania is missing, or the word for Albania in the list was not identified. In such a case you can look at the data you copied and check for Albania. Suppose you find the term "Nation of Albania" in the list. What you can do at this point is open the countries.csv file, find the etnry for Albania in the list and copy-paste it, ensuring that the first column "AL" remains the same. The last column is the country name, which is mapped. So duplicate the row for Albania and change the name to "NATION OF ALBANIA". Save the file and re-run the visualization program. Albania will not have its data applied. 

![Missing country entry fixed](http://ss13.eu/dump/laptop/2015-05-02/2015-05-02_11-30-20.png)

Missing country entry fixed

Note: Only the letter (alpha) representation is applied and upper/lower case does not matter. only English alphabet characters are used in matching. So "ALBANIA" == "ALB#ANIA" == "Albania" == "Alba nia" == "albaŠŠŠŠnia" == "alba,;nia". Also note that the program expects 5 columns in the coutnries.csv file, all of which begin and end with a quote (") character with no whitespaces on either side. If you are adding a completely new coutnry, the row should look like this:

"XK","","","","KOSOVO"

All of the following WILL NOT work:
"XK",,,,"KOSOVO"
"XK","KOSOVO"
XK,"","","","KOSOVO"
"XK","","","",KOSOVO
"XK", "", "", "", "KOSOVO"
"XK" ,"" , "" , "" , "KOSOVO"

Note 2: The leftmost column must contain the coutnry's ISO code, as those are the names of the elements in the SVG (scalable vector graphic), which makes up the background. If you are editing the SVG, make sure each graphic or layer, which represents a country, is named with the ISO code for that country in lower case. 

![Example: Republic of Ireland's id](http://ss13.eu/dump/laptop/2015-05-02/2015-05-02_11-43-35.png)

Example: Republic of Ireland's id.


