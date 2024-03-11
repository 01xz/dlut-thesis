# dlut-thesis

LaTeX Template for Master Thesis of Dalian University of Technology

大连理工大学硕士毕业论文LaTeX模版

> why this repo?
>
> * 大连理工大学2024年发布了新的学位论文格式规范：
[大连理工大学学位论文格式规范 (2024-02-26)](https://gs.dlut.edu.cn/info/1210/13916.htm)，
其中充斥着各种自相矛盾的、冗余的设置；
更离谱的是模板说明居然提示作者通过修改 LaTeX class 文件来补充题目、姓名、学号等信息，
属实让人难以接受；
> * 新的所谓“规范”的出现使得之前的一些优秀的模板，如：
[大连理工大学硕士毕业论文模板 XeLaTex V1.0](https://cn.overleaf.com/latex/templates/da-lian-li-gong-da-xue-shuo-shi-bi-ye-lun-wen-mo-ban-xelatex-v1-dot-0/mswbqtxykdff)，
难以被继续使用；
> * 规范的制定者们对“规范”二字缺乏足够的敬意。

此模板以“内容与样式分离”为主要目标，对原模板中不能忍受的地方大致进行了如下修改，尽可能保持与 Word 模板的视觉一致性。

* 封面字体、字重；
* 页码样式；
* 英文目录编号与标题间距；
* 独立的 `.tex` 文件来设置题目、姓名等信息；
* 参考文献格式；
* 使用宏包插入 pdf 页，用于插入签字扫描后的版权声明页；
* 打包了常用的字体，对 Linux 用户更友好。(p.s. 可能有版权问题，但我也管不了这么多了)

### TODO

* 进一步的测试、精调；
* 对学士学位、博士学位模板的支持。
