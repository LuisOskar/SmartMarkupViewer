# Swift Programming Language

Swift is a high-performance system programming language.  It has a clean
and modern syntax, offers seamless access to existing C and Objective-C code
and frameworks, and is memory safe by default.



# Documentation

Many of the docs are out of date, but you can see some historical design
documents in the `docs` directory.

Another source of documentation is the standard library itself, located in
`stdlib`. Much of the language is actually implemented in the library
(including `Int`), and the standard library gives some examples of what can be
expressed today.


# Getting Started

These instructions give the most direct path to a working Swift
development environment. Options for doing things differently are
discussed below.


## System Requirements

macOS, Ubuntu Linux LTS, and the latest Ubuntu Linux release are the current
supported host development operating systems.

Build instructions for Ubuntu 14.04 LTS can be found [here](docs/Ubuntu14.md)

### Getting Sources for Swift and Related Projects

First create a directory for all of the Swift sources:

**Via SSH**  For those who plan on regularly making direct commits,
cloning over SSH may provide a better experience (which requires
uploading SSH keys to GitHub):

    git clone git@github.com:apple/swift.git
    ./swift/utils/update-checkout --clone-with-ssh


## Contributing to Swift

Contributions to Swift are welcomed and encouraged! Please see the [Contributing to Swift guide](https://swift.org/contributing/).

To be a truly great community, [Swift.org](https://swift.org/) needs to welcome developers from all
walks of life, with different backgrounds, and with a wide range of experience.
A diverse and friendly community will have more great ideas, more unique
perspectives, and produce more great code. We will work diligently to make the
Swift community welcoming to everyone.

To give clarity of what is expected of our members, Swift has adopted the
code of conduct defined by the Contributor Covenant. This document is used
across many open source communities, and we think it articulates our values
well. For more, see the [Code of Conduct](https://swift.org/community/#code-of-conduct).
