# Webpage Test Area
## 123

111

[link](pages/page1.md)

## Calculator usage

Use this marker in any Markdown page:

```html
<div
  data-calculator
  data-expression="m * a"
  data-inputs="m:kg,a:m/s^2"
  data-result="F"
  data-unit="N">
</div>
```

Supported expression operators:

- `+`
- `-`
- `*`
- `/`
- `^`
- `()`

Example with a constant:

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

Example with an exponent:

```html
<div
  data-calculator
  data-expression="0.5 * k * x^2"
  data-inputs="k:N/m,x:m"
  data-result="E"
  data-unit="J">
</div>
```
