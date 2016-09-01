name             'deluge-torrent'
maintainer       ''
maintainer_email ''
license          'All rights reserved'
description      'Installs/Configures deluge-torrent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
issues_url       'https://github.com/som3guy/deluge-torrent/issues' if respond_to?(:issues_url)
source_url       'https://github.com/som3guy/deluge-torrent/releases' if respond_to?(:source_url)


depends 'yum', '~> 3.12.0'
depends 'yum-epel', '~> 0.7.1'