# Test Creator
A simple Ruby script that generates print-ready PDF files with tests. This is something like flashcards that are used to remember expressions, e.g. words and phrases to be translated, mathematical tasks, etc. It was designed for my son, who needs this for exams preparation in elementary school.  

Pdf is generated from a CSV file with specified structure placed in `source` directory.
Each row of CSV file must contain two columns separated by a semicolon that correspond to the original *Question* and *Answer*.

Example csv file:

```csv
Question1;Answer1
Question2;Answer2
Question3;Answer3
```

The script takes the following arguments:

| argument | default value | description |
| --------------- | --------------- | --------------- |
| `source_file_name` | - | path to file in source directory |
| `with_answers` | true | boolean value that specifies whether answers should be displayed |
| `shuffle` | true | boolean value that specifies whether rows should be shuffled |
| `landscape_layout` | false | boolean value to set pdf page layout as landscape. For `false` value portrait mode will be set up |

Example execution. 
```ruby
TestCreator.new('example.csv', with_answers: true, shuffle: true).call
```
