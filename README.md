Documentation
-------------

[![Build Status](https://travis-ci.org/agco-fuse/documentation.svg?branch=master)](https://travis-ci.org/agco-fuse/documentation) [![Code Climate](https://codeclimate.com/github/agco-fuse/documentation/badges/gpa.svg)](https://codeclimate.com/github/agco-fuse/documentation)

## Requirements

You should have the following components installed on your computer:

- Ruby 2.x
- Bundler
- Rake

Once you have these, you should execute the following command:

```
bundle install
```

## Building documentation

In order to get the latest Swagger operations and models, you should execute the following command:

```
bundle exec rake build
```

## Publishing to GitHub pages

In order to deploy to GitHub pages you should execute the following command:

```
bundle exec rake deploy
```
