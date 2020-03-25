# [poses](https://github.com/alexcurylo/poses)
[![CI](https://github.com/alexcurylo/poses/workflows/CI/badge.svg)](https://github.com/alexcurylo/poses/actions?workflow=CI)
[![coverage](https://codecov.io/gh/alexcurylo/poses/branch/develop/graphs/badge.svg)](https://codecov.io/gh/alexcurylo/poses)
[![codebeat](https://codebeat.co/badges/f01be6f5-7a79-4d58-94ce-08ce7a4948a7)](https://codebeat.co/projects/github-com-alexcurylo-poses-develop)
[![issues](https://img.shields.io/github/issues/alexcurylo/poses.svg)](https://github.com/alexcurylo/poses/issues)
[![docs](https://alexcurylo.github.io/poses/badge.svg)](https://alexcurylo.github.io/poses)
[![chat](https://badges.gitter.im/alexcurylo/poses.svg)](https://gitter.im/alexcurylo/poses) 


Table of Contents
-----------------

1. [Purpose](#purpose)
2. [Requirements](#requirements)
3. [Usage](#usage)
4. [Documentation](#documentation)
5. [Roadmap](#roadmap)
6. [Author](#author)
7. [License](#license)

Purpose
-------

SwiftUI pose image catalog app engine for [Poses Professional 3.0](https://apps.apple.com/app/id357099619).

Requirements
------------

- Xcode 11.4 or later
- iOS 13.0, tvOS 13.0, macOS 15.0, or later

### Tools:

- [Bundler](https://bundler.io/) for Ruby dependency management
- [Codebeat](https://codebeat.co/projects/github-com-alexcurylo-poses-develop) for automated code review
- [Codecov](https://codecov.io/gh/alexcurylo/poses) for test coverage statistics
- [Fastlane](https://fastlane.tools) for release management
- [Github Actions](https://github.com/alexcurylo/poses/actions?workflow=CI) for CI testing
- [Gitter](https://gitter.im/alexcurylo/poses?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) for chat
- [Jazzy](https://github.com/realm/jazzy) for generating documentation
- [LicensePlist](https://github.com/mono0926/LicensePlist) for generating acknowledgements
- [Mint](https://github.com/yonaskolb/mint) for tool dependency management
- [SwiftLint](https://github.com/realm/SwiftLint) for opinionated coding style enforcement
- [SwiftMockGeneratorForXcode](https://github.com/seanhenry/SwiftMockGeneratorForXcode) for generating mocks

### Libraries:

#### Swift Package Manager:
- [Grid](https://github.com/spacenation/swiftui-grid) for SwiftUI scrollable grid views
- [Nuke](https://github.com/kean/Nuke) for networked image loading
- [R.swift](https://github.com/mac-cain13/R.swift/) for typed resource identifiers
- [SFSafeSymbols](https://github.com/piknotech/SFSafeSymbols) for statically typed SF Symbols 
- [Siren](https://github.com/ArtSabintsev/Siren) for update notifications
- [SwiftUI-Introspect](https://github.com/siteline/SwiftUI-Introspect) for UIKit implementation access
- [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver) for logging

#### Development release _pending SPM .xcframework support:_
- [Flurry](https://github.com/flurry/flurry-ios-sdk/issues/164) for analytics and crash reporting

Usage
-----

- Install Ruby + Bundler + Mint as system tools, [Homebrew](https://brew.sh) is a good start
- `bundle install` to install the versioned tools in `Gemfile`
- `mint bootstrap` to install the versioned tools in `Mintfile`
- Build the app with the 'Poses' target.

Documentation
-------------

Read the [docs](http://alexcurylo.github.io/poses/). Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com).

Generate for local branch with  `bundle exec jazzy` and open with `open ./docs/index.html`

Roadmap
-------

[Open an issue](https://github.com/alexcurylo/poses/issues/new) if there's something in particular you'd like to see here.

Author
------

[![web: trollwerks.com](http://img.shields.io/badge/web-www.trollwerks.com-blue.svg)](http://trollwerks.com) 
[![twitter: @trollwerks](http://img.shields.io/badge/twitter-%40trollwerks-blue.svg)](https://twitter.com/trollwerks) 
[![email: alex@trollwerks.com](http://img.shields.io/badge/email-alex%40trollwerks.com-blue.svg)](mailto:alex@trollwerks.com)

License
-------

The [MIT License](http://opensource.org/licenses/MIT). See the [LICENSE.md](LICENSE.md) file for details.

_Copyright &copy;2008-2020 Trollwerks Inc._
