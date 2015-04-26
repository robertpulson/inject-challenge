# Inject Challenge

The goal of this challenge was to re-write the Ruby method `.inject`. 

# What does it do?

The inject method is performed on an Array and is passed either a block or a symbol. It can also be passed an initial value.
It uses the block or symbol on each element of the array and accumulates the value as it iterates.

# Examples

* [1,2,3].inject(:+)                         => 6
* [1,2,3].inject(1, :+)                      => 7
* [1,2,3].inject { |sum, num| sum + num }    => 6
* [1,2,3].inject(1) { |sum, num| sum + num } => 7

# Solution

Enjict is now providing functionality for all 4 cases of the inject method, although the code used is exhaustive, even after refactoring. 
The method also catches arguement errors, ensuring that only appropriate values are passed.

# Getting Started

To clone this repository:

`git clone https://github.com/robertpulson/inject-challenge.git`

Then `cd inject-challenge` to naviagte into it.

If you have rspec installed use `rspec` to check tests, if not run `gem install rspec` first.

To try `.enjict` out for yourself, ensure your in the main directory and open `irb`. Then copy and paste the following line:

`require './lib/enjict.rb'`

This is your life and its ending one moment at a time...
