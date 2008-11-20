Gem::Specification.new do |s|
  s.name = %q{jekyll}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Preston-Werner"]
  s.date = %q{2008-11-19}
  s.default_executable = %q{jekyll}
  s.email = ["tom@mojombo.com"]
  s.executables = ["jekyll"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.textile", "Rakefile", "bin/jekyll", "lib/jekyll.rb", "lib/jekyll/convertible.rb", "lib/jekyll/filters.rb", "lib/jekyll/layout.rb", "lib/jekyll/page.rb", "lib/jekyll/post.rb", "lib/jekyll/site.rb", "test/helper.rb", "test/suite.rb", "test/test_jekyll.rb", "test/test_post.rb", "test/test_site.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{jekyll}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Jekyll is a simple, blog aware, static site generator.}
  s.test_files = ["test/test_jekyll.rb", "test/test_post.rb", "test/test_site.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<RedCloth>, [">= 0"])
      s.add_runtime_dependency(%q<liquid>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<RedCloth>, [">= 0"])
      s.add_dependency(%q<liquid>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<RedCloth>, [">= 0"])
    s.add_dependency(%q<liquid>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
