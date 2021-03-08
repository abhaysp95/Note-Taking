# JSP Engine:

To process jsp page, JSP engine is required. JSP engine is a specialized servlet which run undervision of servlet engine

JSP engine is connected with a web server.


## How JSP works:

* User sends request for jsp page
* Web server identifies the .jsp file
* Web server hands over the request to jsp engine
* JSP engine checks whether the servlet corresponding to .jsp page exist or not
	+ if corresponding servlet does not exist:
		- JSP page translate into servlet code
		- Compiler compiles the servlet code and generate class file
		- Loads the class file and create instance
		- Initialize the servlet instance by calling `jspinit()`
		- invokes the `_jspservvice()` method for the response
	+ if corresponding servlet exists:
		- if an instance is already running it simply forwards the request to this instance
		- Otherwise it loads class and create instance.

<br>

## LifeCycle of JSP:

* `jspinit()`
* `_jspservlet()`
* `jspdestroy()`

<br>

## JSP Components:

* Directives
* Declaration
* Expression
* Scriplets
* Action

### Directives:

**For including resources**

**Page directive** - Can be used for importing another packages
```jsp
<%@ page import = "java.io.*" %>
```

**Include directive** - This directive inserts the content of a file in jsp page during the translation phase. The files can be:
	+ another jsp file
	+ test file
	+ html file etc.

```jsp
<%@ include file = "filename.jsp" %>
```

### Declaration:

Declaration can be used to declare on or more variables methods or class which can be used later in the jsp page
```jsp
<%! int a = 0; %>
```

### Expression:

```jsp
<%! int a = 2; %>
```

### Scriplets:

```jsp
<%= a%> <%--< will print a >--%>
```


### Action:

We can use `XML` to excecute _jsp code_ known as **JSP Action**. Jsp Actions are specialized action code built of XML tags that can be used in jsp page to perform some functions.

* **include**:

This is also the alternate for _include directive_ to addup(include) files/pages.

* **forward**:

This jsp action hand over the current request to the specific page internally at the server side.

```jsp
<jsp:forward page="page1.jsp"></jsp:forward>
```

```jsp
<jsp.include page="page1.jsp"></jsp:include>
<%--< or >--%>
<jsp:include page="page1.jsp"/>
```

* **plugin**:

```jsp
<jsp:plugin type="applet" code="classname"/> <%--< applet's classname >--%>
```


## Send data to another page

JSP provides inbuilt object for sending and receiving values as `request` and `response`.


## Scope in JSP:

* Page Scope
* Request Scope
* Session Scope
* Application Scope


### Page Scope:

Object having page scope can be accessed only withing a page in which it is defined.

**E.g.,**: out, exception, response

### Request Scope:

A request can be served by more than one page objects. It's implicit object is known as `request`.

### Session Scope:

Objects having session scope are accessible from pages that belongs to the same session where they were created. It's implicit object is `session`

### Application Scope:

Implicit object is `application`.



## Database Integration:

You can integrate database with java and using database(taking relational database). Java uses `jdbc` driver for connection with database and installed sql tool will provided another connection driver which will interact with _jdbc_.

**Type1 driver**: Like _jdbc-odbc_ provided operating system for open database connectivity. Negative point is that there are several tyypes of database and its not possible to have _odbc_ driver provided by OS.

**Type2 driver**: Driver is provided by database company technology(or other third party), written in languages like C.

**Type3 driver**: Also can be called as _java driver_. We use some kind of middleware to communicate with database.

**Type4 driver**: Also known as _pure java driver_. So, this driver is written in java too, and there's minimum compatibility issue.
