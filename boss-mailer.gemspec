# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boss_mailer/version'

Gem::Specification.new do |spec|
  spec.name          = "boss-mailer"
  spec.version       = BossMailer::VERSION
  spec.authors       = ["Dennis Haegler"]
  spec.email         = ["d.haegler@hotmail.de"]
  spec.licenses      = ['MIT']

  spec.summary       = %q{
    This is a gem to mail the working hours form the terminal to your boss. }
  spec.description   = %q{
    This is a gem to mail the working hours form the terminal to your boss.
    You can write email from the terminal to your boss. (Or anyone you want
    to mail your working time)
    }

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ['boss-mailer']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "mailcatcher"
end
