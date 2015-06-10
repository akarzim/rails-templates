git rm: 'README.rdoc'
template 'docs/README.md.tt', 'README.md'

git add: '.', commit: '-m "Added README"'
