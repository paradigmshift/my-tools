## my-tools

A collection of everyday common functions that I use but are not found in most Common Lisp implementations. Some functions may use SBCL specific features.

As the library grows, some functions may be moved and separated into
more specific packages like command-line tools, http-tools, etc.

[![endorse](https://api.coderwall.com/paradigmshift/endorsecount.png)](https://coderwall.com/paradigmshift)

### Downloading

Code is hosted at [github](https://github.com/paradigmshift/my-tools), you can clone or fork the repo there.

### Installation

Quicklisp's quickload is the best way to load the library once you've told ASDF2 where the code lives. This can be done by either putting the code in ASDF2's default search path: `~/.local/share/common-lisp/source/` or by specifying it in the configuration file (create it if it doesn't already exist): `~/.config/common-lisp/source-registry.conf.d/projects.conf`.

In the configuration file, add the directory that you wish to use as the main storage point for lisp source files. For example, if you want to place the lisp source in `~/src/lisp`, then `projects.conf` would contain:

    (:tree (:home "src/lisp"))

After that, initialize ASDF2's source registry with `(asdf:initialize-source-registry)`, asdf files will now be loadable from the specified directory.

If for some reason you prefer not to use Quicklisp, you can still load the files manually with ASDF2:

    (asdf:load-system :my-tools)

### Exported functions

`l-swap` - switches elements at defined positions with each other
`a-swap` - same as list-switch but for arrays
`permutations` - returns a list of all possible permutations of a passed list
`p-factors` - lists prime factors

Comments, Criticisms, Extensions, etc are very welcome.

Mozart Reina
mozart@mozartreina.com
