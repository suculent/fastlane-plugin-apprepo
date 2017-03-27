<p align="center">
  <img src="assets/apprepo.png" height="110">
</p>

fastlane-plugin-apprepo
============

[![Twitter: @igraczech](https://img.shields.io/badge/contact-%40igraczech-green.svg?style=flat)](https://twitter.com/igraczech)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/suculent/fastlane-plugin-apprepo/blob/master/LICENSE)
[![Build Status](https://img.shields.io/circleci/project/suculent/fastlane-plugin-apprepo.svg?style=flat)](https://circleci.com/gh/suculent/fastlane-plugin-apprepo)
[![Gem](https://img.shields.io/gem/v/fastlane-plugin-apprepo.svg?style=flat)](http://rubygems.org/gems/fastlane-plugin-apprepo)
[![Coverage Status](https://coveralls.io/repos/github/suculent/fastlane-plugin-apprepo/badge.svg?branch=master)](https://coveralls.io/github/suculent/fastlane-plugin-apprepo?branch=master)

###### Deliver IPAs, icons & manifest.json to a SFTP server using a single command.

`fastlane-plugin-apprepo` can upload ipa files, app icons and manifest.json to your Enterprise iOS distribution site from the command line. 

Get in contact with the developer on Twitter: [@igraczech](https://twitter.com/igraczech)

-------
<p align="center">
    <a href="#features">Features</a> &bull;
    <a href="#installation">Installation</a> &bull;
    <a href="#quick-start">Quick Start</a> &bull;
    <a href="#usage">Usage</a> &bull;
    <a href="#tips">Tips</a> &bull;
    <a href="#need-help">Need help?</a>
</p>

-------

<h5 align="center"><code>fastlane-plugin-apprepo</code> is a 3rd party plugin to <a href="https://fastlane.tools">fastlane</a>: The easiest way to automate building and releasing your iOS and Android apps.</h5>

# Features
- Submit IPA to SFTP server (e.g. AppRepo Server) completely automatically
- Upload a new IPA file without Xcode from any Mac
- Maintain your app manifest locally and push changes to AppRepo Server (optionally)
- Easily implement a real Continuous Deployment process using [fastlane](https://fastlane.tools)
- Store the configuration in git to easily deploy from **any** Mac, including your Continuous Integration server.

To upload builds to AppStore check out [deliver](https://github.com/fastlane/fastlane/tree/master/deliver).

To upload builds to TestFlight check out [pilot](https://github.com/fastlane/fastlane/tree/master/pilot).


# Installation

Install using fastlane

    fastlane add_plugin apprepo

Make sure, you have the latest version of the Fastlane tools installed.


# Quick Start (to be reviewed for plugin)

**Based on gem apprepo, supposed to change.**

The guide will create all the necessary files for you, [in future also] using the existing app manifest.json from AppRepo (if any). AppRepo on-premise service has nothing to do with iTunesConnect or AppStore Distribution. Its purpose is solely for Enterprise In-House distribution and can leverage your Apple Developer Account credentials to fetch currently valid applications and their bundle identifiers.

Delivery module for your custom SFTP server (e.g. AppRepo, where it specifically supports custom manifest.json format instead of default plist manifest [future todo]).

- ```cd [your_project_folder]```
- ```apprepo init```
- Enter your AppRepo Server credentials (absolute path to RSA private key for your SFTP server)
- Enter your `APPREPO` APPCODE for this application in AppRepo Server, you can omit this for own SFTP server (or expect it to be a directory at your SFTP home path as we don't want to limit your creativity).
- Enjoy a good drink, while the computer does all the work for you

From now on, you can run `apprepo` to deploy a new update, or just upload new app manifest.json and icons.


# Usage (to be reviewed for plugin)

**Based on gem apprepo, supposed to change.**

Initialize Repofile:

    fastlane apprepo init
    
Upload IPA and manifest.json based on Repofile:

    fastlane apprepo run
    
Download manifest.json from AppRepo Server:

    fastlane apprepo download_manifest
    
Upload IPA and manifest:
    
    fastlane apprepo submit


# Credentials

Matej Sychra
Felix Krause

# Fastlane Tips

## [`fastlane`](https://fastlane.tools) Toolchain

- [`fastlane`](https://fastlane.tools): The easiest way to automate building and releasing your iOS and Android apps
- [`snapshot`](https://github.com/fastlane/fastlane/tree/master/snapshot): Automate taking localized screenshots of your iOS app on every device
- [`frameit`](https://github.com/fastlane/fastlane/tree/master/frameit): Quickly put your screenshots into the right device frames
- [`pem`](https://github.com/fastlane/fastlane/tree/master/pem): Automatically generate and renew your push notification profiles
- [`sigh`](https://github.com/fastlane/fastlane/tree/master/sigh): Because you would rather spend your time building stuff than fighting provisioning
- [`produce`](https://github.com/fastlane/fastlane/tree/master/produce): Create new iOS apps on AppRepo and Dev Portal using the command line
- [`cert`](https://github.com/fastlane/fastlane/tree/master/cert): Automatically create and maintain iOS code signing certificates
- [`spaceship`](https://github.com/fastlane/fastlane/tree/master/spaceship): Ruby library to access the Apple Dev Center and AppRepo
- [`pilot`](https://github.com/fastlane/fastlane/tree/master/pilot): The best way to manage your TestFlight testers and builds from your terminal
- [`boarding`](https://github.com/fastlane/boarding): The easiest way to invite your TestFlight beta testers
- [`gym`](https://github.com/fastlane/fastlane/tree/master/gym): Building your iOS apps has never been easier
- [`scan`](https://github.com/fastlane/fastlane/tree/master/scan): The easiest way to run tests of your iOS and Mac app
- [`match`](https://github.com/fastlane/fastlane/tree/master/match): Easily sync your certificates and profiles across your team using git

##### [Like this tool? Be the first to know about updates and new fastlane tools](https://tinyletter.com/krausefx)


## Editing the ```Repofile```
Change syntax highlighting to *Ruby*.

# Need help?
Please submit an issue on GitHub and provide information about your setup

# Code of Conduct
Help us keep `apprepo` open and inclusive. Please read and follow our [Code of Conduct](https://github.com/suculent/apprepo/blob/master/CODE_OF_CONDUCT.md).

# License
This project is licensed under the terms of the MIT license. See the LICENSE file.

> This project and all fastlane tools are in no way affiliated with Apple Inc. This project is open source under the MIT license, which means you have full access to the source code and can modify it to fit your own needs. All fastlane tools run on your own computer or server, so your credentials or other sensitive information will never leave your own computer. You are responsible for how you use fastlane tools.
