Gem::Specification.new do |s|
    s.name        = 'tdcli'
    s.version     = '0.0.0'
    s.date        = '2016-02-27'
    s.summary     = "Todoist CLI"
    s.description = "A CLI for Todoist"
    s.authors     = ["Aaron Gunderson"]
    s.email       = 'aaron@agundy.com'
    s.executables << 'tdcli'
    s.files       = [
        "lib/tdcli.rb",
        "lib/todoist/cache.rb",
        "lib/todoist/client.rb"
    ]
    s.homepage    = 'https://www.agundy.com/tdcli/'
    s.license     = 'MIT'
    s.add_runtime_dependency "thor", "~>0.19.1", ">=0.19.1"
    s.add_runtime_dependency "json", "~>1.8.3", ">=1.8.3"
end
