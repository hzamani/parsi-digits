$:.push File.expand_path('../lib', __FILE__)
require 'version'

Gem::Specification.new do |s|

  # Description Meta...
  s.name        = 'parsi-digits'
  s.version     = ParsiDigits::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Hassan Zamani'
  s.email       = 'hsn.zamani@gmail.com'
  s.homepage    = 'http://github.com/hzamani/parsi_digits'
  s.summary     = 'Some utils to support parsi digits'
  s.description = 'Some utils to support parsi digits including convertion between parsi and western digits and convertion from String to Float or Fixnum'


  # Load Paths...
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']


  # Dependencies (installed via 'bundle install')...
  s.add_development_dependency("bundler")
  s.add_development_dependency("rake")
end
