# Floss

Manage FLOSS repositories in `$HOME/Projects`.

## archive
`archive` option will compression desired projects at `$HOME/Downloads/archived` 


## Installation

All dependencies are pulled with:

    $ bundle install

PS: `$ gem install bundler`

To install Floss in your system make use of: 

    $ make install

## Usage

grab: 

    `$ floss grab`

archive: 

    $ floss archive zip --archive awesome,lua

## Configuration

Floss will look for cvs files containing repositories to be managed at XDG_CONFIG/floss

$XDG_CONFIG/floss/lua.csv 
 
```csv
name,repository

awesome,https://github.com/awesomeWM/awesome
luarocks,https://github.com/luarocks/luarocks
lua,https://github.com/lua/lua

```

## History
`floss` began as a module of a super package called `cejo` and extracted as standalone to follow the UNIX main rule: 'do one thing, well'.


## License
[GPL version 3](https://www.gnu.org/licenses/gpl-3.0.en.html)
