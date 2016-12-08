### README
- 如果想到另一台机器上写博客，运行如下代码做准备工作：
  mkdir hexo 建立一个文件夹hexo
  cd hexo
  git init
  git remote add origin https://github.com/hashc/blog_hexo.git
  git fetch --all
  git reset --hard origin/master

- 搭建hexo平台，运行bash buildhexo.sh

- auto.sh是自动实现部署博客到github，，每次写博客就可以直接 bash auto.sh

  ```shell
  sudo hexo generate
  sudo hexo deploy
  sudo hexo server
  ```

- pushall.sh 是自动实现把hexo所有的文件上传到远程的blog_hexo仓库

  ```bash
  sudo git add .
  sudo git commit -m "some new"
  #sudo git subtree push --prefix=themes/next next master
  sudo git push origin master

  ```

- autofirst.sh 拉回博客文件

  ```shell
  #git remote add origin https://github.com/hashc/blog_hexo.git
  git fetch --all
  git reset --hard origin/master
  ```

- autogetnext.sh 拉回主题

  ```shell
  #git remote add -f next https://github.com/hashc/hexo-theme-next.git
  #git subtree add --prefix=themes/next next master --squash
  git fetch next master
  git subtree pull --prefix=themes/next next master --squash
  ```

