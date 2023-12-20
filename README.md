# YLLoadingHUD

鸿蒙原生加载动画，包含各种加载动画和提示弹窗


<img width="250" alt="demoimg" src="https://github.com/ChanggnahC/YLLoadingHUD/assets/20789312/50c58bc2-60f9-456a-810b-ca4414d34258">


本项目基于ArkTs语言，api9

使用方法：

1、将ets文件夹下的YLLoadingHUD文件夹拖入项目

2、在需要使用的文件引入
```
import YLHud, { HUDClass, HUDMode } from '../YLLoadingHUD/YLLoadingHUD'
```
3、定义变量
```
@State hudItem:HUDClass = {
    show:false,
    mode:HUDMode.loading,
    string:'loading'
  }
```
4、添加组件
```
YLHud({hudItem:$hudItem})

```
<img width="250" alt="demoimg" src="https://open.weixin.qq.com/qr/code?username=gh_e192fb294d82">
更多鸿蒙开发教程，欢迎关注【幽蓝计划】公众号




