# lgtm-emacs

A lgtm.in client for emacs.
Show a LGTM image from lgtm.in at random.

## Installation

### Via Cask
Add this your Cask file:

```
(depends-on "lgtm" :git "https://github.com/kumabook/lgtm-emacs.git")
```


### Via el-get
```
  (el-get-bundle lgtm
    :url "https://github.com/kumabook/lgtm-emacs.git"
    :features lgtm)
```

### Load lgtm in your init.el

`(require 'lgtm)`

## Usage

` M-x lgtm`


## Requirements
- [request.el](https://github.com/tkf/emacs-request)

## Special Thanks:
- [LGTM.in/g](http://www.lgtm.in/)
- [request.el](https://github.com/tkf/emacs-request)

