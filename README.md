# Date Intervals
Simple function that returns date intervals without gaps from an input array

> by Vlamir Carbonari


## Install
Clone project and
```
bundle
```


## Tests
```
rspec
```


## Usage
Copy `input/dates.csv.example` to `input/dates.csv` (or `input/[whatever].csv`), and adjust it as an array of strings separated by commas

#### Input example
```
"11 Aug 2020", "29 Jan", "27 Jan", "1 Dec 2022", "28 Jan"
```

#### Allowed date formats
  - `"d m"`
  - `"d m y"`

###### Where
- `d` must be: `1` to `31`
- `m` must be: `Jan` to `Dec`
> See `Date::ABBR_MONTHNAMES` at https://ruby-doc.org/stdlib/libdoc/date/rdoc/Date.html
- `y` must be an valid year with 4 digits

#### Important rules
- First date must be in `"d m y"` format
- The dates must be in cronological order
- When the date are in `"d m"` format, then function will consider it is after previous date


## Exceptions
Exceptions will be raise if
- Date is invalid (it is impossible to convert to a `Date` Object)
- First date are not in `"d m y"` format
- It is impossible to adjust the array in a cronological order


## Run
```
ruby date_intervals input/dates.csv
```
> Tested with Ruby 3.0.1
