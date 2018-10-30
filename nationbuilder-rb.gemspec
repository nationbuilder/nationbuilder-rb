require './lib/nationbuilder/version'

Gem::Specification.new do |s|
  s.name = "nationbuilder-rb"
  s.version = NationBuilder::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Huie", "Alexandre Schmitt"]
  s.date = "2017-11-22"
  s.description = "A Ruby client to the NationBuilder API"
  s.email = "api@nationbuilder.com"
  s.executables = ["nbdoc"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".ruby-gemset",
    ".ruby-version",
    ".travis.yml",
    "CHANGELOG.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "bin/nbdoc",
    "lib/api_spec/.ruby-gemset",
    "lib/api_spec/.ruby-version",
    "lib/api_spec/Gemfile",
    "lib/api_spec/Gemfile.lock",
    "lib/api_spec/LICENSE.txt",
    "lib/api_spec/README.md",
    "lib/api_spec/Rakefile",
    "lib/api_spec/lib/api_spec.rb",
    "lib/api_spec/lib/api_spec/generator.rb",
    "lib/api_spec/lib/api_spec/specs/basic_pages.rb",
    "lib/api_spec/lib/api_spec/specs/blog_posts.rb",
    "lib/api_spec/lib/api_spec/specs/blogs.rb",
    "lib/api_spec/lib/api_spec/specs/calendars.rb",
    "lib/api_spec/lib/api_spec/specs/campaign_data.rb",
    "lib/api_spec/lib/api_spec/specs/contacts.rb",
    "lib/api_spec/lib/api_spec/specs/donations.rb",
    "lib/api_spec/lib/api_spec/specs/events.rb",
    "lib/api_spec/lib/api_spec/specs/exports.rb",
    "lib/api_spec/lib/api_spec/specs/imports.rb",
    "lib/api_spec/lib/api_spec/specs/lists.rb",
    "lib/api_spec/lib/api_spec/specs/memberships.rb",
    "lib/api_spec/lib/api_spec/specs/page_attachments.rb",
    "lib/api_spec/lib/api_spec/specs/paths.rb",
    "lib/api_spec/lib/api_spec/specs/people.rb",
    "lib/api_spec/lib/api_spec/specs/people_tags.rb",
    "lib/api_spec/lib/api_spec/specs/precincts.rb",
    "lib/api_spec/lib/api_spec/specs/sites.rb",
    "lib/api_spec/lib/api_spec/specs/survey_responses.rb",
    "lib/api_spec/lib/api_spec/specs/surveys.rb",
    "lib/api_spec/lib/api_spec/specs/webhooks.rb",
    "lib/api_spec/spec.json",
    "lib/nationbuilder.rb",
    "lib/nationbuilder/client.rb",
    "lib/nationbuilder/endpoint.rb",
    "lib/nationbuilder/errors.rb",
    "lib/nationbuilder/method.rb",
    "lib/nationbuilder/paginator.rb",
    "lib/nationbuilder/parameter.rb",
    "lib/nationbuilder/spec_parser.rb",
    "lib/nationbuilder/url.rb",
    "lib/nationbuilder/utils.rb",
    "lib/nationbuilder/version.rb",
    "nationbuilder-rb.gemspec",
    "spec/fixtures/delete.yml",
    "spec/fixtures/errored_get.yml",
    "spec/fixtures/paginated_get.yml",
    "spec/fixtures/paginated_get_page2.yml",
    "spec/fixtures/paginated_get_page2_with_limit.yml",
    "spec/fixtures/paginated_get_page3.yml",
    "spec/fixtures/parametered_get.yml",
    "spec/fixtures/parametered_post.yml",
    "spec/lib/nationbuilder/client_spec.rb",
    "spec/lib/nationbuilder/paginator_spec.rb",
    "spec/lib/nationbuilder/utils_spec.rb",
    "spec/spec_helper.rb",
    "update_subtree.sh"
  ]
  s.homepage = "http://github.com/nationbuilder/nationbuilder-rb"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "A Ruby client to the NationBuilder API"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httpclient>, ["~> 2.7"])
      s.add_development_dependency(%q<rake>, ["~> 12.3"])
      s.add_development_dependency(%q<rspec>, ["~> 3.8"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.16"])
      s.add_development_dependency(%q<vcr>, ["~> 4.0"])
      s.add_development_dependency(%q<webmock>, ["~> 3.4"])
    else
      s.add_dependency(%q<httpclient>, ["~> 2.7"])
      s.add_dependency(%q<rake>, ["~> 12.3"])
      s.add_dependency(%q<rspec>, ["~> 3.8"])
      s.add_dependency(%q<simplecov>, ["~> 0.16"])
      s.add_dependency(%q<vcr>, ["~> 4.0"])
      s.add_dependency(%q<webmock>, ["~> 3.4"])
    end
  else
    s.add_dependency(%q<httpclient>, ["~> 2.7"])
    s.add_dependency(%q<rake>, ["~> 12.3"])
    s.add_dependency(%q<rspec>, ["~> 3.8"])
    s.add_dependency(%q<simplecov>, ["~> 0.16"])
    s.add_dependency(%q<vcr>, ["~> 4.0"])
    s.add_dependency(%q<webmock>, ["~> 3.4"])
  end
end
