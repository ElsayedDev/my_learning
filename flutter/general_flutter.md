#

## _

### `@macro`

[check]((https://stackoverflow.com/a/64602659/11989529))

A @macro is a way to insert some dartdoc documentation that has been written somewhere else. That way you don't have duplicate docs that you have to maintain.

The string that follows @macro is the name of a template, which includes the documentation you'll insert. So in the TextField example:

/// {@macro flutter.widgets.editableText.keyboardType}
final TextInputType keyboardType;
the template name is flutter.widgets.editableText.keyboardType. If you go to the source code for EditableText, you'll find the template with it's documentation text:

/// {@template flutter.widgets.editableText.keyboardType}
/// The type of keyboard to use for editing the text.
///
/// Defaults to [TextInputType.text] if [maxLines] is one and
/// [TextInputType.multiline] otherwise.
/// {@endtemplate}
final TextInputType keyboardType;
The annotation @template starts the template and is followed by its name. @endtemplate finishes it.
