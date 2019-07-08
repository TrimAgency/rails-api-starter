# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

<!-- Note: Every project begins on version 0.1.0. Clear out the log below and start anew. Remove this message once completed. -->

## [0.4.1] - 2019-07-08
### Fixed
- Fixes schema validation for swagger security requirements

## [0.4.0] - 2019-07-06
### Added
- Updated requests specs to generate documentation with Swagger
- Enable documentation in staging/develop with ENV
- Adds RswagDocumentation module to read schemas outside of the swagger_helper config
- Update ReadMe with Documentation section

### Fixed
- Small update in Dockerfile
- Yarn security vulnerability
- Missing enable delay for Sidekiq
- Removes unneeded tables (Tags, Posts ,Taggable)

## [0.3.0] - 2019-05-21
### Added
- Sample data for development
- Serializes data with Blueprinter instead of Active Model Serializer

## [0.2.0] - 2019-02-21
### Added
- Shows Rails logs in development using docker
- Rake task for csv of users in api
- Adds abillity method to user with authorization example
- Removes model keyword for params used in form objects
- Creates an erd pdf for reference

### Fixed
- Removes secrets.yml.enc
- Updates gems for security vulnerabilities
- Moves location of PR template
- Updates to README and CHANGELOG

## [0.1.0] - 2019-01-10
### Added
- fog-aws gem for image storage + configured carrierwave
- Pull request template
- Changelog
- Setup instructions to Readme
- Sample Env's
