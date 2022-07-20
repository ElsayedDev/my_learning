#

## _Questions!_

### What is mean of `these objects are created by the runtime`?

Technically, no object creation ever occurs at compile time, though object initialization/state may be computed (see the 'constexpr' keyword). Typically, objects will be created at runtime. However, there are special cases for precomputable immutable objects, which are typically copied into memory alongside program data, and mutable objects with file or global scope, which are created during program loading, prior to entry into the main program flow.

_Object in java is created **during** runtime. The **“new” keyword is used to create an objects.** At the time of class loading object memory is created inside heap memory._

**What is runtime** [more](https://www.techtarget.com/searchsoftwarequality/definition/runtime)
`It can refer to the state of a program, a certain type of program or the time at which a program runs.`
`When written as two words, run time refers to how long the execution of a program takes`

Runtime is a piece of code that implements portions of a programming language's execution model. In doing this, it allows the program to interact with the computing resources it needs to work. **Runtimes** are often integral parts of the programming language and don't need to be installed separately.

Runtime is also when a program is running. That is, when you start a program running in a computer, it is runtime for that program. In some programming languages, certain reusable programs or "routines" are built and packaged as a "runtime library." These routines can be linked to and used by any program when it is running.

Programmers sometimes distinguish between what gets embedded in a program when it is compiled and what gets embedded or used at runtime. The former is sometimes called **compile time**.

**How does runtime work?**
Runtime is a stage of the **programming lifecycle**.

![programming lifecycle](https://cdn.ttgtmedia.com/rms/onlineimages/programming_lifecycle-f.png)

**Runtime errors**
**Insufficient system resources.** Lack of available system resources can cause a runtime error. For instance, if there is not enough memory for a program to run, the runtime environment cannot do its job. The program will likely abort and return an error message.
**Coding error.** A bug in the software can cause a runtime error.
**Broken dependency.** If there is a break in a connection to another application that the program requires to execute, an error can result.

![runtime error](https://cdn.ttgtmedia.com/rms/onlineimages/where_the_runtime_system_fits_in-h.png)

**Memory Heap**
Heap is just an area where memory is allocated or deallocated **without any order.** This happens when one creates an object using the new operator or something similar.
Unlike the stack where memory is allocated and released in a very defined order , individual data elements allocated on the heap are typically released in ways which is asynchronous from one another.
