## 前提

由于该镜像会通过ssh的方式自动部署到github，所以要注意几个点

 1.  先在github上添加自己的公钥
 2.  `~/.ssh`下存在对应的私钥
 3.  `_config.yml`中的git部署地址是ssh方式

> 如果需要更换git的name和mail，请在项目目录下的.gitconfig对应修改即可

## 使用说明

```
#创建镜像
docker build -t myhexo .

#修改脚本的写权限
chmod +x hexo

#修改脚本中的博客源码的地址
#将下面的 ~\/www\/html\/blog 替换成自己的本地地址即可
sed -i 's/YOUR_BLOG_DIR/~\/www\/html\/blog/g' hexo

#之后即可根据hexo一样使用该镜像
./hexo version
#也可建立软链接到bin目录下,全局使用hexo
ln -s /git_dir/hexo /usr/local/bin/hexo
hexo version
```

## 补充

 该镜像只是作为不想在本地搭node的替代品， 如果需要有server功能请自行修改镜像进行接口映射等等
 
请注意博客的权限，该容器内主要执行用户有`root`和`node`，其中`node`用户的uid为1000，即基本上和本地的第一个创建的用户uid一致

现脚本默认以`node`用户执行，如需修改执行用户或用户的uid，则需要自行修改脚本，建议uid和本地挂载的项目用户一致即可
