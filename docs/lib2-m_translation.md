# m_translation

The dir changed since 2.0. 

Generate a 4x4 transformation matrix which can pass into `multmatrix` to translates (moves) its child elements along the specified vector.

**Since:** 1.1

## Parameters

- `v` : Elements will be translated along the vector.

## Examples

	include <matrix/m_translation.scad>;

	cube(2, center = true); 
	multmatrix(m_translation([5, 0, 0]))
	    sphere(1);

![m_translation](images/lib-m_translation-1.JPG)

