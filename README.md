# todo-import-export version 0.1.0

A collection of tools to import and export between different task manager applications.

## Installation
There is currently no installation of todo-import-export itself. However,
todo-import-export depends on [Ruby](https://www.ruby-lang.org/en/) and the
[Hpricot](https://github.com/hpricot/hpricot) library at runtime.
To install Hpricot, try `gem install --user hpricot`

## Usage
1. Go to https://myhomeworkapp.com/home in your browser.
1. Login if necessary.
1. Press Ctrl+S or use a menu to save the document as a regular HTML. Name it myHomework.html or whatever you want.
1. Start a terminal console.
1. Type `/path/to/myhomework-exporter.rb /path/to/myHomework.html path/to/output.csv`

## Current Status
[![Code Climate](https://codeclimate.com/github/daniel-barrows/todo-import-export/badges/gpa.svg)](https://codeclimate.com/github/daniel-barrows/todo-import-export)

myhomework-exporter.rb works fine for what it does, but has some serious limitations, namely:
- no notes;
- no repeat increments, just a true/false repeat value;
- no differentiation between low priority and no priority.
None of these are going to be fixed without switching to [Mechanize](https://github.com/sparklemotion/mechanize). That's in my [future plans](#future-plans), but will take some time.

## FAQ
### When are you going to write a HiTask exporter?
You don't need to wait for me to write a HiTask exporter. Just look at the
source, run a quick Javascript snippet in a console, and you can export without
upgrading to premium. If you understand HTML and Javascript, it takes 5 minutes.

### What am I supposed to do with the CSV?
I don't expect it can be directly imported into any application; I just made
columns for the information MyHomework provided. CSVs are pretty easy to
manipulate and work with, so I can probably convert it into another format if
you [add an issue](issues/new).

### Isn't Hpricot deprecated?
Yes. I know, but it's what I'm used to and I just haven't stopped using it. I would accept commits switching to another library, especially Mechanize, since we'll need it anyway.

## Future Plans
1. Make myhomework-exporter.rb more usable for scripts
by splitting CSV writing into separate method.
1. Make myhomework-exporter.rb use the Ioify library.
1. Write Remember the Milk importer for MyHomework parsed data or CSV.
1. Make myhomework-exporter.rb use [Mechanize](https://github.com/sparklemotion/mechanize) to grab all todo item data.
1. Write HiTask exporter
1. Write Remember the Milk importer for HiTask exported XML.

## License

todo-import-export is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

todo-import-export is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
