## 前提

由于该镜像会通过ssh的方式自动部署到github，所以要注意几个点

 1.  先在github上添加自己的公钥
 2.  `~/.ssh`下存在对应的私钥
 3.  `~/.ssh/konwn_hosts`中存在github的`host key`
 4.  `~/.gitconfig`中存在自己的git信息
 5.  `_config.yml`中的git部署地址是ssh方式

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

 该镜像只是作为我不想在本地搭node的替代品
 如果需要有server功能请自行修改镜像进行接口映射等
 