Skirace
=======

Application for my BS degree in Computer Engineering.

How to run
----------

1. Install Ruby
2. Install gem Bundler ``gem install bundler``
3. Install gems from Gemfile ``bundle`` from application folder
4. Migrate DB ``bundle exec sequel -m db/migrations/ sqlite://db/database.sqlite``
4b. Seed database ``rake db:seed`` (optional)
5. Compile assets ``rake assets:precompile``
6. Start application``rackup``

Application should be available on port 9292.

How to access application console
---------------------------------

From application folder run ``./console``