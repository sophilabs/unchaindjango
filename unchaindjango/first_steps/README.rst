In this adventure you will create a new django project.

HINTS
-----

First of all you need to make sure that you have Django installed. Now install Django with the help of pip:

.. sourcecode:: bash

    $ pip install django

Once you have installed Django you need to create a new project. Lets start a new project by running:

.. sourcecode:: bash

    $ django-admin startproject unchaindjango

Running the previous command should have created a folder structure like this:
    .
    └── unchaindjango
         ├── manage.py
         └── unchaindjango
              ├── __init__.py
              ├── settings.py
              ├── urls.py
              └── wsgi.py

To start your web server you can run:

.. sourcecode:: bash

    $ python manage.py runserver

Now, if you open http://localhost:8000 in a web browser, you'll see the app that you just created.


You can submit your progress now by running:

.. sourcecode:: bash

    $ unchaindjango verify manage.py
