# mdTeX

This gem provides some functions making LaTeX document with Markdown.


## Installation

Add this line to your application's Gemfile:

    gem 'mdtex'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mdtex


## Usage

### Create a new LaTeX document

```
$ mdtex init mydocument
$ cd mydocument
```

where "mydocument" is the document name.


### Build your document

```
$ rake build
```


## Directory Structure

```

|- src:     Source directory
|   |- document.tex:    Root document
|   |- foo.md
|   |- bar.md
|   ...
|
|- tmp
|- dist
|- Rakefile
|- settings.yml:        Setting file
```


## Contributing

* izumin5210 ([Twitter](http://twitter.com/izumin5210/), [GitHub](http://github.com/izumin5210/))

1. Fork it ( http://github.com/izumin5210/mdtex/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

mdTeX is released under the [MIT License](http://www.opensource.org/licenses/MIT).
