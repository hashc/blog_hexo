sudo hexo generate
sudo hexo deploy
sudo git add .
sudo git commit -m "some new"
sudo git subtree push --prefix=themes/next next master
sudo git push origin master
