# just

This project uses quite a few different tools - hell, you're in the `Tools` section of the documentation right now! While being able to use multiple specialized tools in tandem is great, they all come with their own interfaces that are difficult to remember.  
Ideally, we would like to configure regularly used commands once and then have them under a unified, well-defined interface; this is where `just` comes in. `just` is a command runner, and a very good one at that. Over the next few chapters, we will set up a few different commands for all of our tools, creating a unified command line interface for our little project, all specified in our one `justfile`.

## Why not `make`?

`make` is a battle-tested and well-known tool, and could be used here as well. I am choosing `just` because it is a much leaner piece of software, without its own build system and much nicer error messages in case something goes wrong. 
