# Webpage Test Package Guide

這個資料夾是一個 GitHub Pages + Jekyll 的靜態網頁測試包。它的核心想法是：

- 用 Markdown 寫內容
- 用 HTML 決定頁面骨架
- 用 CSS 控制外觀與排版
- 用 JavaScript 增加互動功能，例如計算機

推送到 GitHub 之後，GitHub Pages 會用 Jekyll 把 Markdown 轉成 HTML 網頁。

## Project Structure

```text
.
├── _config.yml
├── _layouts/
│   └── base.html
├── assets/
│   ├── css/
│   │   └── custom.css
│   └── js/
│       └── calculators.js
├── docs/
│   └── webpage-test-package.md
├── pages/
│   ├── page1.md
│   └── code_matlab.m
├── README.md
└── .github/
    └── workflows/
        └── jekyll-gh-pages.yml
```

## Markdown

Markdown 是用來寫主要內容的格式，副檔名通常是 `.md`。

在這個專案裡：

- `README.md` 是網站首頁內容
- `pages/page1.md` 是一個額外頁面
- `docs/webpage-test-package.md` 是這份說明文件

Markdown 適合用來寫：

- 標題
- 段落
- 清單
- 連結
- 表格
- 程式碼區塊
- 數學公式

常見語法：

```md
# Main Title

## Section Title

This is a paragraph.

- Item 1
- Item 2

[Go to page1](../pages/page1.md)

Inline math: $x = 5\pi$

Display math:

$$F = ma$$
```

如果要讓某個 Markdown 頁面套用自訂版型，需要在檔案最上方加入 front matter：

```md
---
layout: base
---
```

這代表 Jekyll 會用 `_layouts/base.html` 包住這個 Markdown 內容。

## HTML

HTML 負責頁面的結構。

在這個專案裡，主要 HTML 檔案是：

```text
_layouts/base.html
```

它負責：

- 建立整個頁面的基本 HTML 結構
- 載入 CSS
- 載入 MathJax
- 載入計算機 JavaScript
- 放置頁首 header
- 放置中間主內容
- 放置右側連結欄
- 放置頁尾 footer

其中最重要的是這一段：

```html
<main id="content" class="markdown-body">
  {{ content }}
</main>
```

`{{ content }}` 是 Jekyll 的 Liquid 語法，意思是「把 Markdown 轉換後的 HTML 內容放到這裡」。

所以流程是：

```text
pages/page1.md
→ Jekyll 轉成 HTML
→ 塞進 _layouts/base.html 的 {{ content }}
→ 產生完整網頁
```

## CSS

CSS 負責外觀與排版。

在這個專案裡，主要 CSS 檔案是：

```text
assets/css/custom.css
```

它負責：

- Architect 風格的頁面配色
- 頁首 header
- 主內容置中
- 右側 sidebar
- Markdown 標題、段落、表格、程式碼樣式
- 計算機輸入框與按鈕樣式
- 手機版響應式排版

例如主內容置中的設定：

```css
.markdown-body {
  width: 720px;
  max-width: 100%;
  margin: 0 auto;
}
```

右側連結欄位的設定：

```css
.sidebar {
  position: absolute;
  top: 0;
  left: calc(50% + 390px);
  width: 190px;
}
```

手機版會改成上下排列：

```css
@media (max-width: 700px) {
  .sidebar {
    position: static;
    width: auto;
  }
}
```

## JavaScript

JavaScript 負責互動功能。

在這個專案裡，主要 JavaScript 檔案是：

```text
assets/js/calculators.js
```

它負責把 Markdown 裡的計算機標記自動轉成可互動的計算機。

也就是你在 Markdown 裡只需要寫：

```html
<div
  data-calculator
  data-expression="m * a"
  data-inputs="m:kg,a:m/s^2"
  data-result="F"
  data-unit="N">
</div>
```

網頁載入後，JavaScript 會自動把它換成：

- 輸入框
- Calculate 按鈕
- 結果文字

## Calculator Usage

計算機使用 HTML 的 `data-*` 屬性做設定。

基本格式：

```html
<div
  data-calculator
  data-expression="公式"
  data-inputs="輸入變數"
  data-constants="常數"
  data-result="結果名稱"
  data-unit="單位">
</div>
```

### Common Attributes

`data-expression`

要計算的公式。

```html
data-expression="m * a"
```

`data-inputs`

使用者需要輸入的變數。冒號後面是提示文字或單位。

```html
data-inputs="m:kg,a:m/s^2"
```

`data-constants`

固定常數，使用者不用輸入。

```html
data-constants="g=9.81"
```

`data-result`

結果顯示名稱。

```html
data-result="F"
```

`data-unit`

結果單位。

```html
data-unit="N"
```

## Supported Calculator Syntax

目前支援：

- 加法：`+`
- 減法：`-`
- 乘法：`*`
- 除法：`/`
- 指數：`^`
- 括號：`()`
- 常數
- 三角函數與自然對數

支援的函數：

- `sin(x)`
- `cos(x)`
- `tan(x)`
- `arcsin(x)` or `asin(x)`
- `arccos(x)` or `acos(x)`
- `arctan(x)` or `atan(x)`
- `ln(x)`

三角函數使用弧度 `rad`。

## Examples

### Force

Markdown 公式：

```md
$$F = ma$$
```

計算機：

```html
<div
  data-calculator
  data-expression="m * a"
  data-inputs="m:kg,a:m/s^2"
  data-result="F"
  data-unit="N">
</div>
```

### Weight With Constant

Markdown 公式：

```md
$$W = mg$$
```

計算機：

```html
<div
  data-calculator
  data-expression="m * g"
  data-inputs="m:kg"
  data-constants="g=9.81"
  data-result="W"
  data-unit="N">
</div>
```

### Sine

Markdown 公式：

```md
$$a = sin b$$
```

計算機：

```html
<div
  data-calculator
  data-expression="sin(b)"
  data-inputs="b:rad"
  data-result="a">
</div>
```

## Add A New Page

在 `pages/` 裡新增一個 `.md` 檔案，例如：

```text
pages/page2.md
```

內容可以這樣寫：

```md
---
layout: base
---

# Page 2

This is another page.

$$E = mc^2$$
```

然後在 `README.md` 或其他頁面加入連結：

```md
[Go to page2](pages/page2.md)
```

## Deployment

`.github/workflows/jekyll-gh-pages.yml` 會在推送到 `main` branch 時自動執行：

1. 下載 repo
2. 設定 GitHub Pages
3. 用 Jekyll build 網站
4. 部署到 GitHub Pages

所以一般使用流程是：

```text
修改 Markdown / HTML / CSS / JavaScript
→ commit
→ push 到 GitHub
→ GitHub Actions 自動部署
```

## When To Edit Which File

想改文字內容：

```text
README.md
pages/*.md
docs/*.md
```

想改整體頁面結構：

```text
_layouts/base.html
```

想改顏色、位置、字體、間距：

```text
assets/css/custom.css
```

想改計算機功能：

```text
assets/js/calculators.js
```

想改 GitHub Pages 主題：

```text
_config.yml
```
