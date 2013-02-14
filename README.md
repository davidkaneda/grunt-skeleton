Grunt Skeleton
==============
A personal starting point for web prototypes. To take any credit for this would be ridiculous, as it's really just a collection of great grunt plugins and a simple, opinionated directory structure.

What does it come with?
-----------------------
It currently supports [CoffeeScript](http://coffeescript.org), [Stylus](http://learnboost.github.com/stylus/) (with [Nib](http://visionmedia.github.com/nib/)), and automatic [CommonJS](http://www.commonjs.org)-style wrapping, so JS classes can be written like they would be in Node. Also, I really just dislike the [AMD syntax](http://requirejs.org/docs/whyamd.html).

Some other clever defaults:
* scripts/vendor and style/vendor are automatically combined with your CSS/JS

Requirements
------------

You'll need [Node.js & NPM](http://nodejs.org). I'll let you figure that out, since people like all sorts of wacky package managers.

This project uses the upcoming Grunt .4. Install this by running:

```bash
npm install -g grunt-cli
```

Now just enter the directory and install the local dependencies:

```bash
npm install
```

Available Commands
------------------
**`grunt`** (default)
Build and concatenate files, but don't minify anything.

**`grunt minify`**
Build and concatenate files, minified. Also strips all console.* messages from JavaScript.

**`grunt server`**
Run default `grunt` command, start a server at [localhost:8000](http://localhost:8000/), then watch for any changes and call LiveReload if there's an update. You'll need [a LiveReload browser extension](http://feedback.livereload.com/knowledgebase/articles/86242-how-do-i-install-and-use-the-browser-extensions-) installed and turned on. I *might* remove this extension dependency in the future by injecting it automatically with Connect.

Of course, you can view *all* the available commands by running:

```bash
grunt -h
```

Next Steps
----------
This is just a boilerplate for myself, so I won't be making any grand feature promises. I will likely add Handlebars support soon, just haven't needed it yet. I would consider making the Gruntfile more extensible (using more config variables, etc.) if there's enough interest.