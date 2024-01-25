# dinamic_table_of_contents

Each line of the table of contents is an array that consists of the paragraph_name and page_number

Table of contents is an array of the lines, sorted by the respective page_numbers.

Can I sort the array of arrays?

Yes I can. So, I want to get unsorted array of inputs first - unsorted_table_of_contents

## Unsorted table of contents

It shall look like this:

u_t_c  = [ [ "name_a", 24 ], [ "name_b", 15 ]]

## Sorted table of contents

sorted_table_of_contents = u_t_c.sort{ | a,b | a[ 1 ] <=> b[ 1 ] }