# CheatCompletions
Clink argument completion for [Cheat](https://github.com/cheat/cheat).

Automatically generates arguments from all available cheatsheets via `cheat -l` and supplies them for autocompletion.
Also supplies all flags for autocompletion. 

## Installation
Simply place `cheat.lua` in any of the directories listed under 'scripts' when you run `clink info`, then start a new CMD session.

## Usage
Type `cheat` then press your argument completion keybind (for me, `Tab` or `Ctrl-Enter`). A list of all installed cheatsheets will be suggested.

Type `cheat -` then press your argument completion keybind. A list of all available flags will be suggested. Flag descriptions can be listed if you press `Alt-=` rather than your argument completion keybind.

This can be combined with [fzf](https://github.com/junegunn/fzf) and [fzf.lua](https://github.com/chrisant996/clink-gizmos) to create a pretty list of autosuggestions:

https://github.com/HeyItsJono/CheatCompletions/blob/main/demo.webm?raw=true