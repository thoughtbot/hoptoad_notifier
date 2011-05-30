RAILS_VERSIONS = IO.read('SUPPORTED_RAILS_VERSIONS').strip.split("\n")

RAILS_VERSIONS.each do |version|
  appraise version do
    gem 'rails', version
    # Override the 2.3.8 version in the main Gemfile
    gem 'activesupport', version, :require => 'active_support'
    gem 'activerecord', version, :require => 'active_record'
    gem 'actionpack', version, :require => 'action_pack'
    # Expanded before the appraisal gemfile is created, so it points to the
    # toplevel dir
    gem 'hoptoad_notifier', :path => ::File.expand_path(Dir.pwd)
  end
end
