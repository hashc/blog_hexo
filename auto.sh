sudo git add .
sudo git commit -m "some new"
sudo git subtree push --prefix=themes/next next master --squash
sudo git push origin master
sudo hexo generate
sudo hexo deploy
