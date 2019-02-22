# The Game of Life

The Game of Life is the brainchild of John Conway. As a cellular automaton, the idea is that we start with a grid ("the world") with spaces that are either “alive” or “dead.” In order for a dead space to become alive (or “born”), exactly three out of eight of its neighbors must be alive. In order for a space that is already alive to stay alive, it must have either exactly two or exactly three neighbors alive. Otherwise, it “dies” of either “loneliness” or “overcrowding.”

In other words, the rule set is B3/S23 (for “birth” with 3 neighbors and “survival” with 2 or 3 neighbors). The rule set can be changed with many other weird behaviors.

In addition, if you want your cellular automaton to actually care which of its neighbors are alive (as opposed to just counting them), you can get [even more interesting structures](http://mathworld.wolfram.com/Rule30.html) with even more [crazy rules](http://www.stephenwolfram.com/publications/academic/cellular-automaton-properties.pdf).

These decisions are made step-wise, all at once in something that in this [Julia](https://julialang.org/) implementation I called a *generation*. Interestingly, while the rules of this “game” are extremely simple, there is a lot of very complex behavior.

## Convolutions

In this context, convolutions are operations that take two arrays of numbers and return another array of numbers that quantifies, in some way, how much the arrays overlap. Another way of thinking about this is that a convolution takes an array and adds to each point the value of its neighbors, modulated by (possibly negative) weights.

In the computation of the next generation from the actual one, all I do is convolve the actual generation matrix with the following set of weights (also called a "kernel"):

![Kernel for Game of Life](/img/kernel.png "Kernel")

It's easy to prove mathematically that the convolution with such a kernel gives
for each cell the number of its neighbors. This way is very easy to apply
a given rule set and determine the next generation state.

## Image and video creations

For a better visualization of the process, for each generation the program produces a screenshot in PNG format and stores it in the *Worldpics* folder.

A Video module is also provided to generate an animation putting together all the
PNGs generated. This video modules requires the **ffmpeg** library to be installed on the system since the Julia package Images requires it as a dependency.

## Usage

To launch the program it's sufficient to call the main module specifying the dimensions of the World matrix and the number of desired generations, ie:

main (100,100,100)

simulates a 100x100 World matrix with 100 a generations' simulation.

![Game of Life](/img/gol.gif "GOL")
