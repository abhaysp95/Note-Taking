## Access Specifier:

- public
- private
- protected
- default


The top 3 of them are `java keyword`.


### public access specifier:

Usage of `public` with class:
- current class
- another class(exist in current package)
- another class(exist in different package)
- inheritance
- association


### private access specifier

If class is used with `private` keyword then that field/method is only accessible in that same class.


### protected access specifier

If `protected` is used then that class's element is only accessible in current class and current package.


### default access specifier

If `no access specifier` is given then default is considered.


## Modifier:

- static
- final
- abstract
- synchronize

Above are some examples of modifier. Modifier is not mendatory to use.


## Things to check out

A new method to me for taking user input

```java
BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
int x = Integer.parseInt(br.readline());
```

Now, this also says to use excepton handler, so:
```java
try {
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	int x = Integer.parseInt(br.readline());
}
catch(Exception E) {
	System.out.println(E);
}
```

There are two types of inputstream:
- wide stream
- char stream


BufferedReader used `char stream` input stream. But bydefault `wide stream` is used. Just like `System.out` refers std. output buffer. and `System.in` refers std. input buffer which will be bydefault in `wide stream` and then InputStreamReader will covert ths data in `char stream` and then is read in bulk by `BufferedReader`.



### Java lang exception class hierarchy


* Throwable
	+ Error
		- AssertionError
		- LinkageError
			- BootstrapMethodError
			- ClassCircularityError
			- ClassFormatError
				- UnsupportedClassVersionError
			- ExceptionInInitializerError
			- IncompatibleClassChangeError
				- AbstractMethodError
				- IllegalAccessError
				- InstantiationError
				- NoSuchFieldError
				- NoSuchMethodError
			- NoClassDefFoundError
			- UnsatisfiedLinkError
			- VerifyError
		- ThreadDeath
		- VirtualMachineError
			- InternalError
			- OutOfMemoryError
			- StackOverflowError
			- UnknownError
	+ Exception
		- CloneNotSupportedException
		- InterruptedException
		- IOException
			- FileNotFoundException
			- SocketException
				- ConnectException
			- UnknownHostException
		- ReflectiveOperationException
			- ClassNotFoundException
			- IllegalAccessException
			- InstantiationException
			- InvocationTargetException
			- NoSuchFieldException
			- NoSuchMethodException
		- RuntimeException
			- ArithmeticException
			- ArrayStoreException
			- ClassCastException
			- ConcurrentModificationException
			- EnumConstantNotPresentException
			- IllegalArgumentException
				- IllegalThreadStateException
				- NumberFormatException
			- IllegalMonitorStateException
			- IllegalStateException
			- IndexOutOfBoundsException
				- ArrayIndexOutOfBoundsException
				- StringIndexOutOfBoundsException
			- NegativeArraySizeException
			- NullPointerException
			- SecurityException
			- TypeNotPresentException
			- UnsupportedOperationException


## Checked vs. Unchecked Exception:

* **Checked** - are the exceptions that are checked at compile time. If some code within a method throws checked exception, then the method must either handle the exception or it must specify the exception using _throws_ keyword.

_Eg._: _FileNotFoundException_, _IOException_ etc.

* **Unchecked**: are the exceptions that are not checked at compiled time. In C++, all excpetions are unchecked, so it is not forced by compiler to handle or specify exception but in Java that's not the case.

_Eg._: Exceptions under _Error_ and _RuntimeException_ classes are unchecked exceptions. Everything else under _Throwable_ is checked.


## A closer look at Throwable

A catch clause specifies an exception type and a parameter. The parameter receives the exception object. Since all exceptions are subclasses of Throwable, all exceptions support the methods defined by Throwable. Several commonly used ones are shown here:


<table>
	<tr>
		<th>Method</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>Throwable fillInStackTrace()</td>
		<td>Returns a <b>Throwable</b> object that contains a completed stack trace. This object can be retrhown.</td>
	</tr>
	<tr>
		<td>String getLocalizedMessage()</td>
		<td>Returns a localized description of the exception</td>
	</tr>
	<tr>
		<td>String getMessage()</td>
		<td>Returns the description of the exception</td>
	</tr>
	<tr>
		<td>void printStackTrace()</td>
		<td>Display the stack trace</td>
	</tr>
	<tr>
		<td>void printStackTrace(PrintStream <i>stream</i>)</td>
		<td>Sends the stack trace to the specified stream</td>
	</tr>
	<tr>
		<td>void printStackTrace(PrintWriter <i>stream</i>)</td>
		<td>Sends the stack trace to the specified stream</td>
	</tr>
	<tr>
		<td>String toString()</td>
		<td>Returns a <b>String</b> object containing a complete description of the exception. This method is called by <b>println()</b> when outputting a <b>Throwable</b> object.</td>
	</tr>
</table>
