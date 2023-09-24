# JavaWeb based online exam management system



## Environment

- **system**：Windows 11
- **jdk**：jdk1.8.0_151_x64
- **Maven**：apache-maven-3.6.3
- **IDEA**：ideaIC-2021.2.3 community
- **jquery**：jquery-3.4.1



## Quick start

**配置ideaIC-2021.2.3社区版Java环境**

1. IDEA主页面选择Customize，点击Configure，查询到maven，在左侧菜单点击选择Maven，填写外部maven的路径，填写自己的`settings.xml`文件，会自动填写本地仓库的路径（注意把2个Override的复选框勾选上）。
2. new project，选择Maven ，选择`jdk1.8.0_151_x64`，点击Next按钮，工程路径（会自动带出工程名），填写`GroupId`为`com.shixun`。

**配置数据库**

在本地或者服务器搭建MySQL数据库，修改项目中的`src\main\resources\application.yml`中的：

- `url: jdbc:mysql://localhost:3306/==db1==?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8&useSSL=true`
- `username: ==root==`
- `password:"==1234=="`

将`url`中部的`db1`改为实际的数据库名称，将`username、password`修改为实际的数据库用户名和密码。
