# Presentation Notes — Image Widget

## Opening
"Today I am demonstrating Flutter's Image widget using a student profile as a real-world example."

## Property 1 — width
Start at the current value, then move the width slider.
Say:
"`width` controls how wide the image is. I can reduce it for a smaller profile photo or increase it when the design needs a larger image."

## Property 2 — height
Move the height slider.
Say:
"`height` controls the image height. Developers can change it to fit the vertical space of a card or screen."

## Property 3 — fit
Change `BoxFit.cover` to `BoxFit.contain`.
Say:
"`fit` controls how the image is placed inside its allocated box. `cover` fills the box and may crop part of the image, while `contain` keeps the whole image visible and may leave empty space."

## Code
The important part is:

Image.asset(
  'assets/student_profile.png',
  width: _width,
  height: _height,
  fit: _fit,
)

The sliders and dropdown update the state, so the image changes immediately.

## Possible questions

### Why did you use Image.asset instead of Image.network?
I used a local asset so the classroom demo does not depend on internet access.

### What happens if width or height is not provided?
The image can use its intrinsic size and the constraints from its parent. The final size depends on the layout.

### What is the difference between cover and contain?
`cover` fills the available box and can crop. `contain` keeps the whole image visible and can leave empty space.

### Why is Image useful in a real application?
Images are common in profiles, product cards, news articles, social apps, and many other interfaces.
