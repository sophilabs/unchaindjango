import os
import sys

import django
from django.test import Client
from story.adventures import BaseAdventure


class Adventure(BaseAdventure):

    title = 'Hello World'

    def test(self, file):
        sys.path.insert(0, os.getcwd())
        os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'unchained.settings')

        django.setup()

        c = Client()
        response = c.get('/')
        assert(response.status_code == 200)
