# Floss

Easily manage FLOSS repositories.

## Usage

Grab all projects locally: 

    `$ floss --grab`

Archive selected projects at `$HOME/Downloads/archived`: 

    $ floss --archive --name awesomewm,nuxt

## Configuration

`floss` looks for configuration files at `$XDG_CONFIG/floss`:

-> $XDG_CONFIG/floss/misc.csv
 
```csv
name,branch,url
awesomewm,master,https://github.com/awesomeWM/awesome
nuxt,main,https://github.com/nuxt/framework
swift_format,main,https://github.com/apple/swift-format
```

## Installation

Get all dependencies and install with:

    $ make install

## Container

## TODO

- check if error 'unable to access' repository and go on to the next one. 
- more management utilities
- provide binary

## History
The `floss` project initially was a module of a bigger package called `cejo` and
later on extracted as standalone to follow the UNIX main rule: 'do one thing, well'.


## License
Apache version 2.0
