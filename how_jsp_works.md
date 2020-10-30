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
