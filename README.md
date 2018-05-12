# crealytics_coding_challange

## Overview:

This code is an basic implementation of MapReduce algorithm in Ruby. The column wise data is read from the CSV file, grouped by key, then value sequences are 'reduced' based on business logic, specific to each field type. The results are written out to several text files with max 120,000 lines each.

It opens the last csv file obtained by sorting the files based on date. Then it sorts that file by clicks field descend and processes sorted file by multiplying some of the fields to provided values. It stores into CSV file again, but if input file contains more than 120,000 lines, we will have more output files. Combiner is not used at all. Combiner allows to process several sources and combines them by Keyword ID.

## Changes after refactoring
- The refactored code consists of three main classes: CSVFileManager, Combiner and Modifier and a CombinerConstants.
- CSVFileManager is responsible for reading and writing data from text files in CSV format
- CSVFileManager initialize a CSVInstance with the file name pattern, then calls latest_file_path() to find the path to the latest file name (by date)
- Then a Modifier instance is created and a CSVFileManager instance is passed to its modify() method to start data modification process
- The modifier uses CSVFileManager instance to read the file in CSV format, sort the data by the number of clicks and write the sorted data into a separate file
- An Enumerator is created to 'lazily' read the sorted data and returned by CSVFileManager (input_enumerator)
- Modifier#get_combiner uses Combiner class to combine data values by key
- Modifier#get_merger uses combine_hashes to generate a hashmap of values by row headers as keys
- Modifier#get_merger further used combine_values to process each array of data values based on business rules specific to each column type (header key)
- Modifier then passes an Enumerator instance with processed data to CSVFileManager#write to persist the data to output file in CSV format

## Modifications made

- Modifier class was extracted into a separate file
- CSVFileManager class was created to handle all CSV reading/writing
- All constants were put into CombinerConstants module.

# ToDo
- Specs needs to be added for CSVFileManager and newly created Modifier class.
