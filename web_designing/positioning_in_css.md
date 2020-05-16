# Notes on Positioning in CSS

There are four types of positioning css:
* static
* relative
*
*

## static

`static` position is just like _html_ works. If some element is above some another element then in static positioning it'll be above another element.

## relative

`relative` positioning is just like static with slight difference. It changes the position of element relative to where it would normally be if it was _statically_ positioned.

It provides for different provides to change position relatively:

	top: 20px;
	bottom: 10px;
	left: 15px;
	right: 5px;

## absolute

`absolute` element positions the element acc. to parent which is either _relative, absolute, sticky, fixed_. Otherwise, the element will position itself absolute to _html_ element.

`absolute` positioning also gives us the four properties **top, left, bottom, right** for positioning of element.
This `absolute` element is completely rendered outside of document flow and everything else behaves like if this absolute element doesn't exist at all.

## fixed

`fixed` position element are always fixed positioned based on the entire html element, it has nothing to do with parent and the thing about fixed positioning element is that they stay in place when you scroll

## sticky

`sticky` position is the combination of _relative_ and _fixed_ positioning into one. It also have _top, left, bottom, right_ for positioning of element.

`sticky` position is only fixed inside of it's parent element.
