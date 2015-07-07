#!/usr/bin/env python

import codecs

from setuptools import setup, find_packages

import unchaindjango


def long_description():
    with codecs.open('README.rst', encoding='utf8') as f:
        readme = f.read()
    return readme


setup(
    name='unchaindjango',
    version=unchaindjango.__version__,
    description=unchaindjango.__doc__.strip(),
    long_description=long_description(),
    url='http://pyschool.github.io',
    download_url='https://github.com/sophilabs/unchaindjango',
    author=unchaindjango.__author__,
    license=unchaindjango.__licence__,
    packages=find_packages(),
    install_requires=[
        'story',
    ],
    entry_points={
        'console_scripts': [
            'unchaindjango = unchaindjango.story:Story.begin',
        ]
    },
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Intended Audience :: Developers',
        'Natural Language :: English',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Environment :: Console'
    ]
)
