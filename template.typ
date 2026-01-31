#let apply-settings(content) = {
	set text(
		size: 15pt
	)

	set line(
		length: 100%,
		stroke: stroke(color.green) 
	)

	show heading: it => {
		it
		v(0.5em)
	}
	
	content
}