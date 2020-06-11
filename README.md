# VSCode-C51
VSCode Keil C51工程模板
![VSCode-C51](https://s2.ax1x.com/2020/01/30/1lLvTg.png)

[视频教程](https://www.bilibili.com/video/BV1g7411B7vY/)

# 文件夹说明
- src\ 存放代码文件
- output\ 编译过程生成的文件
- environment\ 51启动文件和LIB静态连编文件

# 修改说明
**若出现路径报错的情况，请注意，不要直接在原路径上进行修改，建议删掉原报错路径后手动重新输入**

## 1、修改c_cpp_properties.json
```json
  "includePath": [
  "${workspaceFolder}/**",
  "‪D:/Program Files/Keil5/C51/INC/**",
],
```
将includePath中的Keil的路径修改为你自己的

## 2、修改tasks.json
```json
  "args": [
    "\"${workspaceFolder}\"",
    "\"${workspaceFolder}\\src\"",
    "\"${workspaceFolder}\\environment\"",
    "main" 
],
```
主要修改第四个参数"main"，这个相当于Keil中的工程名

## 3、修改compile.bat
```bash
@echo off
set KEIL_BIN_FOLDER=D:\Program Files\Keil5\C51\BIN
```
将KEIL_BIN_FOLDER修改为你的C51\BIN的地址

# 注意事项
所有的代码文件必须放到src根目录下面，
编译时，点击终端-运行生成任务

