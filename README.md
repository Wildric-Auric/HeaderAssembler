# Motivation
When a programmer wants to use a dependency in his application, it is always a relief to find out that it provides a single header file to include or even better: The implementation is in the header. 
The purpose of this mini project is to bundle multiple header files into one single header.
# Paths and API
**C++11** standard is used along with **Windows API**. **C++17** does provide a cross platform implementation for dealing with paths and file system. However, the code provided here is also implemented in another one of my projects wich uses **C++11** standard only. Also, not using newer C++ features makes a future port to **C** language easier.
# Naive *solutions*
We can first think to bundle headers in the following way, supposing we have all of them in the folder where the batch script is executed.
```bash
    type *.h > outputHeader.h
```
However, during production, headers may include each other. This *solution* does not delete the **include** directives. Deleting all **include** manually isn't good either, since the order at which headers are added to the output file is important.
A second solution is to use the preprocessor to generate the output; most compilers provide such option. This does not solve the issue either, it would suppress comments, expand macros (which we don't want if we need them to be used in an application that includes our header) and includes standard library and potential external dependencies headers.
The project purpose can be summerized in the following statement: **Preprocess relevant `include` directives only.** <br/>
By relevant, I mean only files that are present within a certain directory.
# Documentation
## Functions
`HeaderAssembler` has 5 functions:
* 3 internal for filesystem: `FileExists(...)`, `GetDirFiles(...)`, `GetFileName(...)`.
* 1 internal `Inc(...)` that adds a file content to the output stream opened in the next function.
* 1 public function: `void AssembleHeaders(const std::string& srcDir, const std::string& outDir, const std::string& outFilename)`<br/>
Parameters of the latter are:
* `srcDir` the directory that contains all headers you want to bundle, the program does not look search in subdirectories. 
* `outDir` the directory at which the resulted header will be output.
* `outFilename` the filename (extension included) of the resulted header.
## Build
The implementation `main.cpp` is a console application that calls the `AssembleHeaders` with console inputs.
In case, you have **premake5** *(less than 10MB executable)* you can build a Visual Studio solution by calling `premake5 vs2022`.
# Limitations
* Only **Windows** support for now.
* Use of Cpp features like streams and containers.
* The program can't search recusively in subfolders, so every single header that you need to be expanded should be within the same directory.
* The program does not do any preprocessing on macros, it deals only with raw `#include` directives. Something like the following won't be processed:
```cpp
#define MY_FILE "a.h"
#include MY_FILE
```
Passing that kind of file to `AssembleHeader` will just copy its content to the output.
