Gem::Specification.new do |s|
  s.name    = "scrooge"
  s.version = "0.1"
  s.date    = "2010-01-19"

  s.description = "Class to serialize money into the database, works out of the box with ActiveRecord"
  s.summary     = "Scrooge will keep all your money safe. Or at least in the database."
  s.homepage    = "http://github.com/foca/centipede"

  s.authors = ["Nicolás Sanguinetti"]
  s.email   = "contacto@nicolassanguinetti.info"

  s.require_paths     = ["lib"]
  s.has_rdoc          = true

  s.files = %w[
.gitignore
README
scrooge.gemspec
lib/scrooge.rb
lib/scrooge/active_record.rb
rails/init.rb
spec/scrooge_spec.rb
]
end

