# Floss

Easily manage FLOSS repositories.

## Usage

Grab all projects locally: 

    `$ floss --grab`

Archive selected projects at `$HOME/Downloads/archived`: 

    $ floss --archive --name awesomewm,nuxt

## Configuration

`floss` looks for configuration files at `$XDG_CONFIG/floss`:


$XDG_CONFIG/floss/misc.csv
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
The `floss` project initially was a module of a bigger package called `cejo`
later on extracted as standalone to follow UNIX main rule: 'do one thing, well'.


## License
Apache version 2.0
