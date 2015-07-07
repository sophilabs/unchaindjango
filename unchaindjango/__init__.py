"""
Unchain Django - PySchool
"""

__author__ = 'Sophilabs'
__version__ = '0.0.1'
__licence__ = 'MIT'

from story.story import BaseStory
from . import first_steps


class Story(BaseStory):

    name = 'unchaindjango'
    title = 'Unchain Django'
    adventures = [
        first_steps
    ]
