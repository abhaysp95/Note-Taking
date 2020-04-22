# JavaScript with HTML

We can use js code under `script` tag. This `script` tag could be used inside `head` as well as `body` tag.

## External JavaScript File

* We can create external JavaScript file.
* Embed it in many html pages.
* It provides **code re-usability** because single JavaScript file can be used in several html pages.
* An external JavaScript file must be saved by .js extension
> It is recommended to embed all JavaScript files into a single file. It increases the speed of the webpage.
> See nhtml/practice/js_lecture2 folder for examples.

## Advantages of External JavaScript
* It helps in the reusability of code in more than one HTML file.
* It allows easy code readability.
* It is time-effiecient as web browsers cache the external js files,
	which further reduces the page loading time.
* It enables both web designers and coders to work with html and js files parallelly and separately i.e., without facing any code confilictions
* The length of the code  reduces as only we need to specify the location of the js file.

## Disadvantages of External JavaScript
* If two js files are dependent on one another, then a failure in one file may affect the execution of the other dependent file.
* The web browser needs to make an additional http request to get the js code.
* A tiny to a large change in the js code may cause unexpected results in all its dependent files.
* We need to check each file that depends on the commonly created external JavaScript file.
* If it is a few lines of code then better to implement the internal JavaScript code.

## Variables in Java Script

A `JavaScript variable` is simply a name of storage location. `var` keyword is used to declare variable. Example:
```javascript
var x = 10
var y = 20
var z = x+y;
```
### Rules:
* Name must start with a letter *a to z or A to Z, underscore(_) or dollar($)* sign.
* After first letter we can use digits (0 to 9), for example `value1`.
* JavaScript variables are case sensitive, for example x and X are different variables.

## Local and Global Variables in JS:

### Local
* A JavaScript local variable is declared inside block or function.
* It is accessible within the function or block only.
* Preference of local variable is high.
### Global
* A JavaScript global variable is declared outside of block or function.
* It is accessible within or outside the function or block.
* Preference of global variable is low.

**Example:**
```html
<script>
var data=200; // global variable
function a() {
	document.writeln("inside a"+data+"<br>");
}
function b(){
var data=250; // local variable
document.writeln("inside b"+data);
}
a();	// calling JavaScript function
b();
</script>
```
## JavaScript Data Types:

JavaScript provides different data types to hold different types of values.

### Primitive data type
This type could not be further converted into more composite form.
* **String** represents sequence of characters e.g., "hello"
* **Number** represents numeric values e.g. 100
* **Boolean** represents boolean value either false or true
* **Undefined** represents undefined value
* **Null** represents null i.e. no value at all

### Non-primitive (reference) data type
* **Object** represents instance through which we can access members
* **Array** represents group of similar values
* **RegExp** represents regular expression

## Operators in JavaScript

* Airthmetic Operators
	+ +
	+ -
	+ *
	+ /
	+ %
	+ ++
	+ --
* Comparison (Relational) Operators
	+ == (is equal to)
	+ === (identical(equal and of same type))
	+ != (not equal to)
	+ !== (not identical)
	+ >
	+ >=
	+ <
* Bitwise Operators
	+ &
	+ |
	+ ^
	+ ~
* Logical Operators
* Assignment Operators
	+ =
	+ +=
	+ -=
	+ *=
	+ /=
	+ %=
* Special Operators
	+ (?;)
	+ ,
	+ DELETE
	+ new

## Conditional Statements

Check this example:
```javascript
var age = prompt("Please enter your age");
if (age >= 18)
	document.write("You're an adult <br/>");
else
	document.write("You're NOT an adult <br/>")
```
