from story.story import BaseStory
from . import first_steps


class Story(BaseStory):

    name = 'unchaindjango'
    title = 'Unchain Django'
    adventures = [
        first_steps
    ]
