#import "@preview/physica:0.9.8": *

#let fonts = (
  math: "CMU Serif",
  mono: ("JetBrains Mono", "Courier New", "Monospace"),
)

// Some shorthands
#let pm = sym.plus.minus
#let mp = sym.minus.plus
#let int = sym.integral
#let oint = sym.integral.cont
#let iint = sym.integral.double
#let oiint = sym.integral.surf
#let iiint = sym.integral.triple
#let oiiint = sym.integral.vol
#let detmat(..args) = math.mat(delim: "|", ..args)
#let ee = $bold(upright(e))$
#let dang = sym.angle.arc
#let hl = highlight

// Custom math operators
#let cosec = math.op("cosec")
#let cosech = math.op("cosech")
#let arcsinh = math.op("arcsinh")
#let arccosh = math.op("arccosh")
#let arctanh = math.op("arctanh")

// Colors
#let cherryblossom = rgb("#FFB7C5")
#let pastelblue = rgb("#92c1d3")
#let lightgreen = rgb("#77DD77")
#let lavender = rgb("#E6E6FA")

// Custom macros
#let hr = line(length: 100%)
#let url(s) = {
  link(s, text(font: fonts.mono, s))
}

// Position vector notation
#let utilde(body) = math.accent(body, "\u{330}")

#let conf(
  header: "",
  author: "",
  column_count: 2,
  font_size: 10pt,
  doc,
) = {
  // Set document title and page header:
  set document(title: header, author: author)

  // Set fonts:
  set text(
    size: font_size,
    fallback: false,
  )

  set columns(gutter: 0.5em)
  
  set page(
    footer: "",
    columns: column_count,
    margin: (
      top: 0.7cm,
      x: 0.2cm,
			bottom: 0cm,
    ),
    header: context [
      #text(size: 8pt)[
        #header *by #author*
        #h(1fr)
        Page #counter(page).display() of #counter(page).final().first()
        #v(-6pt)
        #line(length: 100%, stroke: 0.5pt + black)
      ]
    ],
  )


  doc
}
