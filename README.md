# Test Creator
A simple Ruby script that generates tests in ready to print PDF format. It was designed for my son, who needs this for exams preparation in elementary school.  

Pdf is generated from a CSV file with specified structure placed in `source` directory.
Each row of CSV file must contain two columns separated by a semicolon that correspond to the original *Question* and *Answer*.

Example csv file:

```csv
Question1;Answer1
Question2;Answer2
Question3;Answer3
```

Script takes 3 arguments:

| argument | default value | description |
| --------------- | --------------- | --------------- |
| `source_file_name` | - | a path to file in source directory |
| `with_answers` | true | a boolean that specifies whether answers should be displayed |
| `shuffle` | true | a boolean that specifies whether rows should be shuffled

Example execution. 
```ruby
TestCreator.new('example.csv', with_answers: true, shuffle: true).call
```
