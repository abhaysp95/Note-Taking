## Prelude

Java is HLL used to interact with machines

Java Features:

* OOP
* Platform independent
* Robust
* Secure
* Multi-threaded
* Great memory mgmt

## Annotations

Java annotations is a tag that represents the metadata i.e., attached with clas, interface, methods or attr to indicate some additional information which can be used by java compiler or jvm.

Ex:
class level- @Entity
method level- @Override
attr level- @Id

* @Override - basically assures that the subclass is overriding the parent class method

* @SuppressWarning - used to suppress warnings during compilation

```java
Class TestAnnotation {
	public static void main(String ...args) {
		ArrayList list = new ArrayList();  // a non-generic collection (no error, but warning)
		list.add("Jack");
		list.add("John");

		for (Object obj: list) {
			sysout(obj);
		}
	}
}
```

### Custom Annotation


* **Marker Annotation:** annotations which don't have any attr. are "Marker annotations"
* **Single Value Annotation:** are those which have single variable annotation;
* **Multi Value Annotation:** which have multiple variables


## File System in Java

### Stream

It is data sequence flowing from source to destination
* Input Streams - which reads data from a source file
* Output Streams - which writes to a destination file

These I/O operations are supported by the I/O Stream API in java from the java.io.package

### Conversion to other stream

* **Byte Stream:** works byte by byte.
* **Character Stream:** designed to work with files containing unicode character which may be represented by two or more than two bytes


### Byte Stream

1. **InputStream:**

* **FileInputStream:** enable the stream to read the data byte by byte
```java
int read();
void close();
```
* **BufferedInputStream:** works by creating buffer (of some size)


2. **OutputStream:**

`FileOutputStream` and `BufferedOutputStream` work with same principle

```java
void write(int b);
void close();
```

### Character Stream

1. **FileReader & BufferedReader**

Parent class-> Reader

2. **FileWriter & BufferedWriter**

Parent class -> Writer


### File Handler

For dealing with the stats or the metadata of the file

We need to use class File from the java.io.package. This basically allows the modification of file properties (access to file path, size, accesstime maybe, operations such as rename, delete, listing directory etc.)

Example:

```java
File file1 = new File("read.txt");

file1.createNewFile();
file1.getName();
file1.getPath();
file1.isDirectory();
file1.isFile();
```

### Random Access File

java.io.RandomAccessFile;

```java
RandomAccessFile rndm = new RandomAccessFile("Demo.txt", "r");
rndm.getFilePointer();
rndm.seek(0);
rndm.readUTF();
rndm.close();
```


## Serialization & Cloning

### Serialization

The process of writting the state of an object to a file or converting an object from Java supported form to either file supported form or the network supported form.

### Deserialization

The process of converting file supported form to object or java supported form

### Perfoming Serialization

Serializable is a `marked interface (no attr or method)` where the required implementation is provided automatically by JVM at the runtime.

```java
class ABC implements Serializable {
	int i = 1, j = 2;

	public static void main(String ...args) {
		ABC a1 = new ABC();
		FileOutputStream fos = new FileOutputStream("file.txt");
		ObjectOutputStream obj = new ObjectOutputStream(fos);
		obj.writeObject();
	}
}
```

### Performing Deserialization

under the main method from the above snippet

```java
FileInputStream foi = new FileInputStream("file.txt");
ObjectInputStream obj2 = new ObjectInputStream(foi);
Abc a2 = obj2.readObject();
```

There are `ObjectReader` and `ObjectWriter` too

### transient keyword

a modifier which can be applied only for the variables


## Cloning

* Shallow cloning
* Deep cloning
* Clone

```java
class ABC {
	int a;
	int b;

	// a parameterized constructor
	main() {
		ABC a1 = new ABC(1, 2);
		ABC a2 = a1;  // shallow copy
		a1.a = 5;  // a2.a will also be 5

		// deep copy
		ABC a3 = new ABC();
		a3.a = a1.a;
		a3.b = a1.b;
	}
}
```

Java way of cloning (deep cloning)

```java
class ABC implement Clonnable {  // marker interface
	int a;
	int b;

	// a parameterized constructor

	@Override
	public ABC clone() throws CloneNotSupportedException {
		// ....
		return super.clone();
	}

	main() {
		ABC a1 = new ABC(1, 2);
		ABC a2 = (ABC) a1.clone();  // check if type-casting is needed ?
	}
}
```

## JDBC

Types of driver:
* JDBC-ODBC bridge driver
* Native API driver
* Network Protocol driver
* Pure Java Based driver

### Steps

* **load and register the driver**
```java
// to load the jdbc class file dynamically in memory
class.forName(oracle.jdbc.driver.OracleDriver);
// or
// DriverManager class can be used to register driver
Driver drc = new oracle.jdbc.driver.OracleDriver();
DriverManager.registerDriver(drc);
```
* **make connection with database**
```
DriverManager(API) (by interacting with database) also helps in getting connection with database by different overloads of static method getConnection() which returns Connection object which will be used for interaction
```

URL formats for some databases

* oracle.jdbc.driver.OracleDriver: jdbc:oracle:thin@hostname:port:dbname
* org.apache.derby.jdbc.ClientDriver: jdbc:derby://hostname:port//dbname
* com.mysql.jdbc.Driver: jdbc:mysql://hostname:port//dbname

* **send SQL statements**

Types of Statement

* Statement (conn.createStatement();)
* PreparedStatement (conn.prepareStatement();)  // better to use it if statement is to be used multiple times (accepts input at runtime)
* CallableStatement (conn.prepareCall();)  // to store procedure also accepts runtime input

Statement interface methods:

* executeQuery
* executeUpdate
* execute
* getResultSet

* **process result**

```java
ResultSet rs = preSmt.execute();
// some methods
rs.next();  // returns boolean
rs.previous();  // returns boolean
rs.first();  // returns boolean
rs.last();  // returns boolean

conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
// ResultSet.TYPE_FORWARD_ONLY  // this is default
// ResultSet.TYPE_SCROLL_SENSITIVE  // is sensitive to changes done in database
// ResultSet.TYPE_SCROLL_INSENSITIVE
```

## Lambda Expr (and functional interface)

Interface: it can have abstract, static, default methods

Functional Interface: single abstract method, @FunctionalInterface (confirms that an interface is functioncal interface)
Functional Interface can have any number of default and static methods.
Functional Interface is the target type for any lambda expr.
Eg., Runnable and Comparator interface etc.

We can have default method in functional interface.

FunctionalInterface helps with lambda expressions, so lambda is basicall an instance of functional interface

lambda expr is kind of anonymous method with compact syntax
```java
() -> sysout();
() -> 4 * 4;
(String str) -> sysout(str);
(Integer i1, Integer i1) -> i1 > i2;
```

If lambda expr is one line that no need for curly braces or return statement.

```java
(Integer i, Integer j) -> {
	sysout(i);
	sysout(str);
	return i + 4;
}
```

How compiler matches lambda expr:

1. is parameter functional interface
2. does return type match
3. does parameter (count) match

Functional interface can be of 4 types:

* Function<T, R>
	R apply(T)
* Boolean Predicate<T>
	boolean test(T)
* void Consumer<T>
	void accept(T)
* Supply<T>, 0 input and 1 return type
	T get()

Bi-functional interface:
* BiFunction<T, U, R>
	R apply(T, U)
* BiPredicate<T, U>
	boolean test(T, U)
* BiConsumer<T, U>
	void accpet(T, U)

Since primitive type arguments can't be passed as generic type arguments. So, there are version of functional interface for most used primitive types:
* IntFunction<R>
	R apply(int value)
* DoublePredicate<T>
	boolean test(double value)
* IntConsumer
	void accept(int)
* LongSupplier
	getAsLong()
If same datatype, you need not to put the datatypes if the argument's data type are all same

Best practices for lambda expression:

* Use standard functional interfaces
* Prefer lambda expression
* Avoid overloading
* Lambda expr shouldn't be treated as inner class
* Effective final
* use method reference
* omit return statement

### method reference

We use :: operators which we use to call methods. Method reference can be used as constructor too.
Method reference can be seen as shorthand for lambda, to improve the readability of the code

Method referencing can be only applied on terminal methods.


## Streams

	Java8 has introduced Lambda expressions and Collections. To process the data from colllections we use lambda expressions and stream. Streams can only be used on the collections.

When applied streams on any collection, then the processed data must be stored in a new collection.

Stream is lazy and only evaluates when required. Source of stream can be collections, arrays, IO resources.
Lazy loading in stream: computation on source data is only performed when terminal operation is initiated and source elements are only consumed as needed. All intermediate operations are lazy too, so they are not executed until the result is actually needed.

### Building Stream

* Values: `Stream<Integer> stream = Stream.of(1, 2, 3)`
* Arrays: `int[] i = {1, 2, 3}; Arrays.stream(i);`
* Collections: `List<Integer> lst; lst.stream();`
* File: `Stream<String> stream = Files.lines(Paths.get(filename))`

* filter()  // accepts Predicate<T>
* map()  // accepts Function<T, R>
* flat map: used to convert complex collections into sub streams.
* anyMatch
* allMatch
* noneMatch
* takeWhile()  // take all until predicate return false
* dropWhile() // until predicate return true, don't accept
* iterate()  // takes seed and unary operator to return stream
* ofNullable()  // deal with null pointer exception in stream
* peek()  // peform consumer operation on stream
* sorted()  // takes Comparator
* distinct()
* limit()

Terminal methods (don't return a stream):
* count()
* collect()  // <R, A> R collect(Collector<? super T, A, R> collector)
* forEach()
* min() and max()
* reduce()  // Optional<T> reduce(BinaryOperator<T> accumulator)

## Parallel Stream

Fork/Join framework in Java7 was introduced for parallelism

Fork: divides the task using divide & conquer principle
Join: Subtask's results are combined into single result
Use a pool of threads that has its own deque to store the tass
Clases: ExecutorService, ForkJoinTak, ForkJoinPool etc.

Parallel Stream internally uses fork-join framework

### Building parallel stream

* from existing stream: `Stream<Integer> stream = Stream.of(1, 2, 3).parallel();`
* from collection: `List<Integer> lst; Stream<Integer> stream = lst.parallelStream()`

Overhead of splitting the task and joining the result. Also, have to consider the cache miss scenario

**When to Use**

* Order Independent
* Aggregate Functions
* Large size collection
* Performance Implification
* Multi-threaded env.

NQ Model (Brain Gats) for measuring parallelism.

Parallel stream will not work on stateful methods like: sorted, limit, distinct, skip
Also consider decomposibility of stream source

* forEachOrdered: for ordered execution in parallelStream
* sequential: for converting parallel stream into sequential stream

## Optional Class

Container type for optional value (to deal with null and NullPointerException)

**Creating optional object**

* Empty optional object:
```java
Optional<String> opt = Optional.empty()
```

* Optional with a non null value
```java
Product p = new Product{4, "cd", null};
Optional<String> opt = Optional.of(p.getProductName());

// of() method throws NullPointerException if null is passed
```

* With null or non null value
```java
Product p = new Product{4, "cd", null};
Optional<String> opt = Optional.ofNullable(p.getProductName());

// if null, returns empty Optional object
```

* Access the value
```java
Optional<String> opt = Optional.of(p.getProductName());
sysout(opt.get());

// better is to use
Optional<String> opt = Optional.ofNullable(p.getProductName());
if (opt.isPresent())
	sysout(opt.get());
```

**Some method, to check value presence**

* ifPresent(): if ifPresent(Consmer<? super T> consumer), consumer is executed if value is present, does nothing otherwise
* orElse(): orElse(T other), pass other value if Optional is empty
* orElseGet(): orElseGet(Supplier<? extends T> other), envoked when the Optional is empty, the result of Supplier becomes default if Optional is empty
* orElseThrow(): orElseThrow(<? extends X> exceptionSupplier), throws exception if value is not present

**Filter, Transform Optional methods**

* filter(): filter(Predicate<? super T> predicate), if value is present and Predicate is true, then filter returns that optional value
* map(): map(Function<? super T, ? extends U> mapper), use Function if value is present and if result is not null, return Optional describing the result
* flatMap(): flatMap(Function<? super T, ? Option<U>>mapper), if mapping results returns an optional, use flatMap instead of map to get the flattened result from your Optional

## Modularity

public - only to friend modules (exports, requires relation)

Base modules is accessible to all

Circular dependency is not possible: A -> B, B -> A

transient:
A -> B
B -> C
then A -> C if while declaring "requires" we use transient

**Adv. of Modularity:**

* Dependency Management
* Security
* Portability
* code resuablitliy/management
* deployment
* easy maintainance and upgrade

## Multi-threading

Multi-threading in java is a process of executing multiple threads simultaneoulsy or at a time.
Multiprocessing: At an OS level when multiple application run at a time we call it as multiprocessing.
Multitasking: At an application level when multiple process are done it is called multi-tasking
Multithreading: To initiate multi-tasking in an application we use multiple threads. And this process is called multithreading.

### Creating the threads

* Using Runnable interface (functional interface, run() method)
* Using the thread class

```java
class ThreadDemo implements Runnable {
	@Override
	public void run() {
		for (int i = 0; i < 10; i++)
			sysout(i);
	}

	main() {
		ThreadDemo t1 = new ThreadDemo();  // new state
		Thread thread = new Thread(t1);
		thread.start();
	}
}

// or

public class ThreadDemo extends Thread {
	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			System.out.println("i: " + i);;
		}
	}

	public static void main(String[] args) {
		ThreadDemo t1 = new ThreadDemo();
		t1.start();
	}
}
```

### LifeCycle

* New -  As soon as the object is created of the class
* Runnable - as soon as you call the start method
	Non-runnable state
* Running
* Terminated

### Thread operations

methods to perform operations on thre thread itself (thread operation)

**Imp thread operations**

* getName()
* setName()
* run()
* start()
* getPriority(): between 1-10, 1 is least priority, 5 is neutral and 10 is highest
* setPriority()
* sleep()

### Thread safe operation

`synchronized` keyword is used for thread safety such that at a time only one thread will be albe to access the method

**locks**, **concurrent data structure**


### CountDownLatch and cyclic barrier

CountDownLatch: is a thread(eg., main thread) waiting for multiple threads to finish. When all the threads have called the countDownLatch() then awaiting thread continues execution.
Cyclic barrier: it is when different threads hang tight for one another and when all have finished their execution then the result need to be combined in the parent thread.
