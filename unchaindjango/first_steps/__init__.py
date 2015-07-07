import os
import sys

from story.adventures import BaseAdventure

from ..data import _


class Adventure(BaseAdventure):

    title = _('First Steps')

    def test(self, file):
        import django
        from django.test import Client

        sys.path.insert(0, os.getcwd())
        os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'unchained.settings')

        django.setup()

        c = Client()
        response = c.get('/')
        assert(response.status_code == 200)
