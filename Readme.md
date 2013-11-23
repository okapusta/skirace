Skirace
=======

Application for my BS degree in Computer Engineering.

How to run
----------

1. Install Ruby
2. Install gem Bundler ``gem install bundler``
3. Install gems from Gemfile ``bundle`` (from application folder)
4. Migrate DB ``rake db:migrate``
4b. (optional) Seed database ``rake db:seed``
5. Compile assets ``rake assets:precompile``
6. Start application ``rackup``

Application should be available on port 9292.

How to access application console
---------------------------------

From application folder run ``./console``