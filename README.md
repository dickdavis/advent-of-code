# advent-of-code
Solutions for the Advent of Code

## Table of Contents
* About
* Getting started
    * Installation
    * Usage
* Contributing
    * Code Style
    * Documentation
    * Testing
* TODO
* Changelog

## About
Solutions for the Advent of Code

Documentation can be found [here](https://dickdavis.github.io/advent-of-code/).

## License
See `LICENSE` in the project root directory for license information.

## Getting Started
### Installation
Clone the project:

```bash
git clone git@github.com:dickdavis/advent-of-code.git
```

### Usage
Generate a new solution by providing a year and day in YYYYDD format.

```bash
bin/new 202201
```

After generating the solution, drop your input file in the `assets/` directory under the appropriate year.
Use the `DD.txt` standard naming convention (example: `01.txt`)

The solution file will be generated in the `lib/solutions/` directory under the appropriate year.
Modify the `#solutions` method to return an array containing your solutions for each part.

Run the solution by providing a year and day in YYYYDD format.

```bash
bin/run 202201
```

## Contributing
### Code Style
To keep a consistent code style, it is recommended to use
[rubocop](https://github.com/bbatsov/rubocop). If you use `vim` and
[syntastic](https://github.com/vim-syntastic/syntastic), you
can use `rubocop` as a Ruby checker. To manually run `rubocop`, you
can run the following commands:

```
# Run rubocop for the entire project
bundle exec rubocop
# Run rubocop for a specific file
bundle exec rubocop foo/bar.rb
```

### Documentation
Comment any code contributions according to the existing conventions within the project.
Reference the examples listed below:

Example top-level comment:

```
##
# = ClassNameGoesHere
# Author::    [Author Information]
# Copyright:: Copyright [Year] [Author Information]
# License::   GNU Public License 3
#
# This is a class that is something and does something.
```

Example method comment:

```
##
# This is a method that does something
```

Documentation should be regenerated prior to merging any branches into master. The latest
[documentation](https://dickdavis.github.io/advent-of-code/) auto-sources off the `docs/` folder on
the master branch. For more information on RDoc, go
[here](https://rdoc.github.io/rdoc/index.html).

```
# Run custom rake task to regenerate RDoc documentation
rake rdoc
```

### Testing
Tests should be written for all classes and methods. The test suite can be run manually `bundle exec rspec`.

## TODO
* Write specs

## Changelog
### [2022.12.01]
* Initial version of project
