# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/trycourier/courier-ruby

## Local development

- Fork this repository
- Clone your fork
- Run `bundle install`
- Write code!
- Test your code using `bundle exec rspec spec`

## Releasing New Versions

To publish Courier Ruby to RUBYGEMS.ORG

- Update the CHANGELOG.md
- Bump the package version in `lib/trycourier/version.rb`
- Submit a PR to merge changes into main
- Create and push a new version tag

  ```bash
  git tag -a v<VERSION> -m v<VERSION>
  git push origin v<VERSION>
  ```

- Wait for GitHub Action to test and deploy
- Confirm you are able to successfully install the new version by running `gem install trycourier`
