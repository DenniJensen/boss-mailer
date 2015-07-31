[![Gem Version](https://badge.fury.io/rb/boss-mailer.svg)](http://badge.fury.io/rb/boss-mailer)
[![Build Status](https://travis-ci.org/DenniJensen/boss-mailer.svg)](https://travis-ci.org/DenniJensen/boss-mailer)
[![Coverage Status](https://coveralls.io/repos/DenniJensen/boss-mailer/badge.svg?branch=master&service=github)](https://coveralls.io/github/DenniJensen/boss-mailer?branch=master)

# Boss::Mailer
This is a gem to mail the working hours form the terminal
to your boss.


## Installation

Just install via Rubygems

```ruby
gem 'boss-mailer'
```

```ruby
boss-mailer --init
```

In your home path you will find now a file like:

```yaml
:mail_settings:
  :from:
  :to:
  :subject:
  :options:
    :address: "smtp.gmail.com",
    :port: 587
    :user_name: '<username>',
    :password: '<password>',
    :authentication: 'plain',
    :enable_starttls_auto: true
```
Fill in your settings for you mailing hoster and the address for boss.

## Usage
The Bossmailer provides a simple CLI. The boss-mailer needs 3 arguments.
The time from the beginning of the day, from the ending and you pause time.

For example
`boss-mailer HH:MM HH:MM HH:MM`

To provide a quick usage your can just time the hour and the boss-mailer will
parse it for you.

```
boss-mailer 9 18 0055
```
will be get translated into
```
boss-mailer 09:00 18:00 00:55
```

**Pause time** needs the leading zeros in this version (0.1.0)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DenniJensen/boss-mailer.

