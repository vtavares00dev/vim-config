
YouCompleteMe: a code-completion engine for Vim
===============================================

YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for
Vim. It has several completion engines: an identifier-based engine that
works with every programming language, a semantic, Clang-based engine that
provides native semantic code completion for C/C++/Objective-C/Objective-C++
(from now on referred to as "the C-family languages"), a Jedi-based
completion engine for Python, an OmniSharp-based completion engine for C#
and an omnifunc-based completer that uses data from Vim's omnicomplete system to
provide semantic completions for many other languages (Ruby, PHP etc.).


Mac OS X super-quick installation
---------------------------------

Please refer to the full Installation Guide below; the following commands are
provided on a best-effort basis and may not work for you.

Compiling YCM **with** semantic support for C-family languages:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

Compiling YCM **without** semantic support for C-family languages:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh


That's it. You're done. Refer to the _User Guide_ section on how to use YCM.
Don't forget that if you want the C-family semantic completion engine to work,
you will need to provide the compilation flags for your project to YCM. It's all
in the User Guide.

YCM comes with sane defaults for its options, but you still may want to take a
look at what's available for configuration. There are a few interesting options
that are conservatively turned off by default that you may want to turn on.

