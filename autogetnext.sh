git remote add -f next https://github.com/hashc/hexo-theme-next.git
git subtree add --prefix=themes/next next master --squash
git fetch next master
git subtree pull --prefix=themes/next next master --squash

