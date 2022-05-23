# Qas

Easily manage FLOSS repositories.

## Usage

Grab all projects locally: 

    `$ qas --grab`

Archive selected projects at `$HOME/Downloads/archived`: 

    $ qas --archive --name awesomewm,nuxt

## Configuration

`qas` looks for configuration files at `$XDG_CONFIG/qas`:


$XDG_CONFIG/qas/misc.csv
```csv
name,branch,url
awesomewm,master,https://github.com/awesomeWM/awesome
nuxt,main,https://github.com/nuxt/framework
swift_format,main,https://github.com/apple/swift-format
```

## Installation

Get all dependencies and install with:

    $ bin/setup && bin/install

## Container

## TODO

- more management utilities

## History
The `qas` project initially was a module of a bigger package called `cejo`
later on extracted as standalone to follow UNIX main rule: 'do one thing, well'.


## License
[GNU General Public License, Version 3](https://www.gnu.org/licenses/gpl-3.0.en.html)
