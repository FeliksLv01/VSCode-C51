# VSCode-C51
VSCode Keil C51工程模板

![VSCode-C51](https://ly-object-1259106193.cos.ap-chengdu.myqcloud.com/github/C51.png)

# 文件夹说明
- src\ 存放代码文件
- output\ 编译过程生成的文件
- environment\ 51启动文件和LIB静态连编文件

# 修改说明
## 1、修改tasks.json
```json
  "args": [
    "\"${workspaceFolder}\"",
    "\"${workspaceFolder}\\src\"",
    "\"${workspaceFolder}\\environment\"",
    "main" 
],
```
主要修改第四个参数"main"，这个相当于Keil中的工程名

## 2、修改compile.bat
```bash
@echo off
color 87
set KEIL_BIN_FOLDER=D:\Program Files\Keil5\C51\BIN
```
将KEIL_BIN_FOLDER修改为你的C51\BIN的地址

# 注意事项
所有的代码文件必须放到src根目录下面，
编译时，点击终端-运行生成任务

# 参考项目
https://github.com/kenvix/VSCode-Keil-C51-Environment
