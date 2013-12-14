Skirace
=======

Application for my BS degree in Computer Engineering.

How to run
----------

1. Install Ruby
2. Install Memcached

  ```
  wget http://www.memcached.org/files/memcached-1.4.16.tar.gz
    
   tar -xzf memcached-1.4.16.tar.gz
  
   cd memcached-1.4.16
  
   ./configure
    
   make & sudo make install
  
  memcached &
  ```

3. Install gem Bundler 

 ``gem install bundler``
4. Install gems from Gemfile 

 ``bundle install``
5. Migrate DB 

 ``rake db:migrate``

6. (optional) Seed database 

 ``rake db:seed``

7. Create default admin user (admin//password) 

 ``rake application:create_admin_user``

8. Start application 
 
 ``script/server`` or ``rackup``

App should be available on port 9292.


How to access application console
---------------------------------

From application folder run ``script/console``