# Webpage Test Area
## 123

111

[link](pages/page1.md)

[Webpage test package guide](docs/webpage-test-package.md)

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

Supported functions:

- `sin(x)`
- `cos(x)`
- `tan(x)`
- `arcsin(x)` or `asin(x)`
- `arccos(x)` or `acos(x)`
- `arctan(x)` or `atan(x)`
- `ln(x)`

Trigonometric functions use radians.

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

Example with a trigonometric function:

```html
<div
  data-calculator
  data-expression="L * sin(theta)"
  data-inputs="L:m,theta:rad"
  data-result="height"
  data-unit="m">
</div>
```

Example with `ln`:

```html
<div
  data-calculator
  data-expression="ln(x)"
  data-inputs="x"
  data-result="ln(x)">
</div>
```
