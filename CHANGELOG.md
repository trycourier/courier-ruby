# Change Log

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased][unreleased]

## [v1.1.0]
### Added
- Support for Basic Auth
  - ENV variables `COURIER_AUTH_USERNAME` and `COURIER_AUTH_PASSWORD` OR set with params
- Token Auth using ENV variables
  - `COURIER_AUTH_TOKEN`
- Base URL parameter (with default of api.courier.com)
  - ENV variable `COURIER_BASE_URL`
- Support for Lists API by @jrweingart
  - `POST /send/list` with `client.lists.send` method
  - `GET /lists` with `client.lists.list` method
  - `GET /lists/{list_id}` with `client.lists.get` method
  - `PUT /lists/{list_id}` with `client.lists.put` method
  - `DELETE /lists/{list_id}` with `client.lists.delete` method
  - `PUT /lists/{list_id}/restore` with `client.lists.restore` method
  - `GET /lists/{list_id}/subscriptions` with `client.lists.get_subscriptions` method
  - `PUT /lists/{list_id}/subscriptions` with `client.lists.put_subscriptions` method
  - `PUT /lists/{list_id}/subscriptions/{recipient_id}` with `client.lists.subscribe` method
  - `DELETE /lists/{list_id}/subscriptions/{recipient_id}` with `client.lists.unsubscribe` method

- Support for Profiles API by @jrweingart
  - `GET /profiles/{recipient_id}` with `client.profiles.get` method
  - `GET /profiles/{recipient_id}/lists` with `client.profiles.get_subscriptions` method
  - `PUT /profiles/{recipient_id}` with `client.profiles.replace` and `client.profiles.add` methods
  - `PATCH /profiles/{recipient_id}` with `client.profiles.patch` method
  - `POST /profiles/{recipient_id}` with `client.profiles.merge` method

- Support for Messages API by @jrweingart
  - `GET /messages` with `client.messages.list` method
  - `GET /messages/{message_id}` with `client.messages.get` method
  - `GET /messages/{message_id}/history` with `client.messages.get_history` method

- Support for Events API by @jrweingart
  - `GET /events` with `client.events.list` method
  - `GET /events/{event_id}` with `client.event.get` method
  - `PUT /events/{event_id}` with `client.events.replace` and `client.events.add` methods

- Support for Brands API by @jrweingart
  - `GET /brands` with `client.brands.list` method
  - `GET /brands/brand_id` with `client.brands.get` method
  - `POST /brands` with `client.brands.create` method
  - `PUT /brands/brand_id` with `client.brands.replace` method
  - `DELETE /brands/brand_id` with `client.brands.delete` method

## [v1.0.2] - 2021-1-6
### Added
- Minor bug fixes to ensure proper SSL certification by @scarney81

## [v1.0.1] - 2020-3-4
### Added
- Support for Send API by @troy

## v1.0.0 - 2020-3-3
Initial release by @troygoode

[unreleased]: https://github.com/trycourier/courier-ruby/compare/v1.1.0...HEAD
[v1.1.0]: https://github.com/trycourier/courier-ruby/compare/v1.0.2...v1.1.0
[v1.0.2]: https://github.com/trycourier/courier-ruby/compare/v1.0.1...v1.0.2
[v1.0.1]: https://github.com/trycourier/courier-ruby/compare/v1.0.0...v1.0.1
