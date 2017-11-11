# Nilang Compiler V2.1
Not really v2 just internal versioning.

This is the repository for the NiLang Compiler.  
Before we dig in here are some handy repository to check out:
* [Nilang Specification](https://github.com/tompinn23/NI-Spec) Still not fully fleshed out, writing it is boring
* [Nilang V1](https://github.com/tompinn23/NiLang) OG NiLang Compiler built in C# and pretty poor imo.
* [Nilang Standard Library](https://github.com/tompinn23/NiLang-Standard-Library) So thats the standard library its pretty thin 

## Introduction

Right so here we are and you wanna build NiLang well ngl it kinda takes the piss and is only tested on Windows 7/ 10 Visual Studio 2017 Community Edition 64bit.

### Dependencies
* LLVM 5.0.0
* Bison 3.0.4+
* Flex 2.6.3+

## Building

##### Windows

To obtain LLVM 5.0.0 go [here](https://llvm.org/docs/GettingStartedVS.html) and follow said guide.  
To obtain flex and bison I recommend installing chocolatey from [here](https://chocolatey.org/install).  
Then run ```choco install winflexbison3```

You don't need to install flex or bison if you don't plan on making any changes to the lexer or parser.

You should then be able to compile lexer.ll and grammar.y before building in visual studio.

###### Warning!
LLVM takes a really long time and uses about 15gb of space on your hardrive to compile. I just added all the libs to my libs folder which on my machine is C:\LLVM\libs and \include for the include. But you can set it up your favourite way if you prefer.

##### Linux

Currently linux support is sketchy / non-existent. I currently don't have a linus os running so I can't test whether it works. Im 67% sure it should work as long as you have LLVM, Bison and Flex installed/built. But it is untested.

Theres also no build system set up other than visual studio. I do plan to setup a cross platform build tool but it hasn't occured yet. Therefore your gonna have to compile everything manually. It should be straight forward as the only thing you need to link is LLVM so have a go if you want.

CMAKE COMING SOON!

## License

Nilang V2.1 is released under the GNU GPL V3 license. Which can be found [here](https://www.gnu.org/licenses/gpl-3.0.en.html)

