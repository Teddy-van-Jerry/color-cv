# `color-cv`: LaTeX Template for Colorful CV
A modern and colorful LaTeX template for CV.

- [x] Modern and colorful design
- [x] Optional contact information
- [x] Theme color can be easily customized
- [x] Ready-to-use example CV
- [x] Fully open-source (LPPL license)

## Demo
Different header styles are available based on whether a photo is included.

<table>
  <tr>
    <th style="text-align:center;">With Photo</th>
    <th style="text-align:center;">Without Photo</th>
  </tr>
  <tr>
    <td style="text-align:center;" width=50%><img src="demo/w-photo.png" alt="With Photo"></td>
    <td style="text-align:center;" width=50%><img src="demo/wo-photo.png" alt="Without Photo"></td>
  </tr>
</table>

View [PDF on *wqzhao.org*](https://go.wqzhao.org/cv).

## Usage
The LaTeX engine for `color-cv` is **LuaLaTeX**.
It can also work with XeLaTeX.

[`color-cv.tex`](color-cv.tex) is an example CV of [Wuqiong Zhao](https://wqzhao.org),
which can be used as a template for your own CV.

### Contact Information
The contact information can be optionally included in the CV, including:
- Phone (`\phone`)
- Email (`\email`)
- Website (`\website`)
- LinkedIn (`\linkedin`)

You can also set a brief introduction about yourself using `\brief`.

### Customization
The theme color can be easily customized by changing the color definition in the preamble.
For example:
```latex
\renewcommand \ThemeColor     {brown}
\renewcommand \ThemeColorDark {brown!50!black}
\renewcommand \CiteColor      {blue}
```

## License
This project is open-source under the [LPPL license](LICENSE).
