Skirace
=======

Application for my BSc degree in Computer Engineering.

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

The MIT License (MIT)
-------------------------

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
