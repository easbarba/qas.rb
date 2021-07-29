# Floss

Manage FLOSS repositories in `$HOME/Projects`.

## archive
`archive` option will compression desired projects at `$HOME/Downloads/archived` 


## Installation

Install dependencies with:

    $ bundle install

and install in your system with:    

    $ rake install

## Usage

    $ floss grab

    $ floss archive zip --archive awesome,lua

## Configuration

Floss will look for cvs files containing repositories to be managed at XDG_CONFIG/floss

eg: 

``` shell
ls $XDG_CONFIG/floss

lua.csv 

```

```csv
name,repository

awesome,https://github.com/awesomeWM/awesome
luarocks,https://github.com/luarocks/luarocks
lua,https://github.com/lua/lua

```


## License
[GPL version 3](https://www.gnu.org/licenses/gpl-3.0.en.html)
