Blog
=====================
[![Build Status](https://secure.travis-ci.org/AlexParamonov/blog.png)](http://travis-ci.org/AlexParamonov/blog)
[![Gemnasium Build Status](https://gemnasium.com/AlexParamonov/blog.png)](http://gemnasium.com/AlexParamonov/blog)

This is snowball application.
I am using it to try new things.

The goal is to get working application ASAP and try ideas, refactoring in branch and if they succeed, merge them into master.  
First deploys are going to be ugly :)

Please [let me know](https://github.com/inbox/new/AlexParamonov) if you plan to use this app for your site.  

Contents
---------
1. Installation
1. Contributing
1. FAQ
1. Requirements
1. Compatibility
1. Copyright

Installation
------------
Сlone a project:

    git clone git://github.com/AlexParamonov/blog.git

Cd into it and run:

    cd blog
    tee config/environments/test.yml config/environments/development.yml < config/environments/environment.sample.yml > /dev/null
    cp config/database.sample.yml config/database.yml
    bundle install --without production

Contributing
-------------
It is a test project, so feel free to contribute if you like.  


FAQ
---
__Q: Where i can get more information?__  
A: See test specs for more details.  
__How?__  
Install project (see Installation chapter) and then run rake  

    rake

docs will be printed to your console :)  

Requirements
------------

* Ruby 1.9.3
* Rails 3.2

Compatibility
-------------
tested with Ruby

* 1.9.3
* ruby-head

see [build history](http://travis-ci.org/#!/AlexParamonov/blog/builds)

Copyright
---------
Copyright ©2012 Alexander N Paramonov.
Released under the MIT License. See the LICENSE file for further details.
