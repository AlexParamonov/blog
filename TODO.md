v0.2.0
======
* Pages
* Tagging
* MD post formatting or visual html editor

v0.3.0
======
* Simple design (bootstrap or self-created)

v1.0.0
======
* Cleanup

v1.0.0-review
=============
* Refactoring and extraction to modules/gems

v1.1.0
======
* User registration (visitor role)
* Comments

v1.2.0
======
* Integrate with 3rd party accounting
* Public richtext editor (MD?)

v2.0.0
======
* Cleanup

v2.0.0-review
=============
* Refactoring and extraction to modules/gems

v2.1.0
======
* Embedded images, video

v2.x
====
* File import (xml, md, docx)
* Viewable links to external resources (images, video preview)
* Search by 3rd party (Google?)

v3.0.0
======
* Cleanup

v3.0.0-review
=============
* Refactoring and extraction to modules/gems

Ongoing
=======
* I18n of an interface
* Design (responsive, modular and nice)

Future
======
* Raiting, vouting
* Top authors
* Top posts (views and raiting)
* application should be decouped at this stage and have a port for web part
* Search on demand
* Posts i18n
* Introduce library that contains articles

Refactoring
===========
Disconnect persistence  
    simple mapper or datamapper  
    PORO  

Disconnect web part  
    unmutable data structure passed to input port (ports, iteractors)  

Add modules  
Extract web app to an engine  
Extract pages to engine  
Extract search to engine  

New features (release unknown)
==============================
* RSS feed
