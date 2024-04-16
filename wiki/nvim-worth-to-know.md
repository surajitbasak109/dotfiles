# Worth to know

## Introducing the Insert Normal Mode
Imagine you're in insert mode in Vim/Neovim, and you simply need to execute a task in normal mode before returning to insert mode again.

The Insert Normal mode provides a convenient solution. It's a specialized version of Normal mode that allows us to execute a single command and then seamlessly return to insert mode. To access Insert Normal mode from Insert mode, simply press `<C-o>` (refer to :h i_CTRL-O).

|Command|Description|Short code|
|---|----|----|
|CTRL-O|execute one command, return to Insert mode|*i_CTRL-O*|

**Example**:

Sometimes, when the current line is positioned right at the top or bottom of the window, you might want to scroll the screen to view a bit more context. The `zz` command in Vim redraws the screen with the current line positioned in the middle of the window, allowing you to read half a screen above and below the line you're working on.

To trigger this action from Insert Normal mode and seamlessly return to Insert mode afterward, you can simply type `<C-o>zz`. This sequence executes the `zz` command and then immediately puts you back into Insert mode, allowing you to continue typing without interruption.

## Swap `Caps Lock` behavior by `Esc`
### Why should I?
For Vim users, the Caps Lock key can be a nuisance. When Caps Lock is engaged, pressing the k and j keys to move the cursor can inadvertently trigger the `K` and `J` commands. Briefly, `K` looks up the man page for the word under the cursor (:h K), and `J` joins the current and next lines together (:h J). It's surprising how quickly you can inadvertently modify the text in your buffer by accidentally enabling the Caps Lock key!

To mitigate this issue, many Vim users choose to remap the Caps Lock button to act as another key, such as `<Esc>` or `<Ctrl>`. On modern keyboards, the `<Esc>` key is difficult to reach, whereas the Caps Lock key is conveniently located. Mapping Caps Lock to behave as an `<Esc>` key can save a lot of effort, especially considering that the `<Esc>` key is heavily used in Vim. Alternatively, some users prefer to map the Caps Lock button to behave as a `<Ctrl>` key. The `<C-[>` mapping is synonymous with `<Esc>`, and it's easier to type when the `<Ctrl>` key is within easy reach. Additionally, the `<Ctrl>` key can be used for many other mappings, both in Vim and in other programs.

The simplest way to remap the Caps Lock key is to do it at the system level. The methods for remapping keys differ on OS X, Linux, and Windows, so instead of providing instructions here for each system, I recommend searching online for specific instructions. Keep in mind that this customization won't only affect Vim; it applies system-wide. If you choose to follow this advice, you'll effectively repurpose the Caps Lock key, and you likely won't miss its original function.

### I agree, I'm using Ubuntu how can I do this?
If your system has `Gnome tweaks` installed, open that tool.
1. Go to **Keyboard and Mouse**
1. Additional Layout Options
1. Caps Lock Behaviour
1. Swap Esc and Caps Lock



## Register
We can use register to paste from the clipboard from insert mode:
`<c-r>0` to paste from the currently copied texts.

### Use <C-r>{register} for Character-wise Registers
The `<C-r>{register}` command is convenient for pasting a few words from Insert mode. If the register contains a lot of text, you might notice a slight delay before the screen updates. That’s because Vim inserts the text from the register as if it were being typed one character at a time. If the ‘textwidth’ or ‘autoindent’ options are enabled, you might end up with unwanted line breaks or extra indentation.

The `<C-r><C-p>{register}` command is smarter. It inserts text literally and fixes any unintended indentation (see `:h i_CTRL-R_CTRL-P` ). But it’s a bit of a handful! If I want to paste a register containing multiple lines of text, I prefer to switch to Normal mode and use one of the put commands

## Use counts to do simple arithmetic
The `<C-a>` and `<C-x>` commands perform addition and subtraction on numbers. When run without a count they increment by one, but if we prefix a number, then we can add or subtract by any whole number. For example, if we positioned our cursor on a 5 character, running `10<C-a>` would modify it to read 15.

## Calculation in place
If you want to make calculations and put the result in the current cursor position you can use `<c-r>=` and it will put you in a command mode with the equals sign.

For example:

8 bags each costing 48 dollars, total | dollars.

Let's say your cursor is at the pipe(|) symbol. Now in insert mode press `<c-r>=` (ctrl+r and =) and type 8 * 48 in command mode and press enter. It will calculate the expression and put the result in your current cursor position.

> 8 bags each costing 48 dollars, total 384 dollars.

## Meet Select mode
In a typical text editing environment, selected text is deleted when we type any printable character. Vim’s Visual mode doesn't follow this convention—but Select mode does. According to Vim’s built-in documentation, it "resembles the selection mode in Microsoft Windows" (see `:h Select-mode` ). Printable characters cause the selection to be deleted, Vim enters Insert mode, and the typed character is inserted.

We can toggle between Visual and Select modes by pressing `<C-g>` . The only visible difference is the message at the bottom of screen, which switches between **-- VISUAL --** and **-- SELECT --**. But if we type any printable character in Select mode, it will replace the selection and switch to Insert mode. Of course, from Visual mode you could just as well use the `c` key to change the selection.

If you are happy to embrace the modal nature of Vim, then you should find little use for Select mode, which holds the hand of users who want to make Vim behave more like other text editors. I can think of only one place where I consistently use Select mode: when using a plugin that emulates TextMate’s snippet functionality, Select mode highlights the active placeholder.

**Remember this**:

|Command|Effect|
|--|--|
|`v`|Enable character-wise Visual mode|
|`V`|Enable line-wise Visual mode|
|`<C-v>`|Enable block-wise Visual mode|
|`gv`|Reselect the last visual selection|

### Toggling the Free End of a Selection
The range of a Visual mode selection is marked by two ends: one end is fixed and the other moves freely with our cursor. We can use the o key to toggle the free end. This is really handy if halfway through defining a selection we realize that we started in the wrong place. Rather than leaving Visual mode and starting afresh, we can just hit o and redefine the bounds of the selection. The following demonstrates how we can use this technique:

| Keystrokes | Buffer Contents |
| -- | -- |
|{start}|Select from here to **h**ere.|
|vbb|Select from **here to h**ere.|
|o|Select from <strong>here to <ins>h</ins></strong>ere.|
|e|Select from **here to here**.|

## Edit Tabular Data with Visual-Block Mode
We can work with rows of text in any editor, but manipulating columns of text requires a more specialized tool. Vim provides this capability in the form of its Visual-Block mode, which we’ll use to transform a plain-text table.

Suppose that we have a plain-text table such as this one:

[visual_mode/chapter-table.txt](https://media.pragprog.com/titles/dnvim2/code/visual_mode/chapter-table.txt)

Chapter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Page<br />
Normal mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15<br />
Insert mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;31<br />
Visual mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;44<br />

We want to draw a vertical line out of pipe characters to separate the two columns of text and make it look more like a table. But first, we’ll reduce the spacing between the two columns, which are farther apart than they need be. We can make both of these changes using Visual-Block mode.

[![Visual block mode](https://i3.ytimg.com/vi/12mJHHvNTSE/maxresdefault.jpg)](https://www.youtube.com/watch?v=12mJHHvNTSE)

## Command Line Mode

**Table: Ex Commands that operates on the text in a buffer**

|Command                                        |    Effect |
|-----------------------------------------------|-----------|
| :[range]delete [x]                             |    Delete specified lines [into register x] |
| :[range]yank [x]                               |    Yank specified lines [into register x] |
| :[line]put [x]                                 |    Put the text from register x after the specified line |
| :[range]copy {address}                         |    Copy the specified lines to below the line specified by {address} |
| :[range]move {address}                         |    Move the specified lines to below the line specified by {address} |
| :[range]join                                   |    Join the specified lines |
| :[range]normal {commands}                      |    Execute Normal mode {commands} on each specified line |
| :[range]substitute/{pattern}/{string}/[flags]  |    Replace occurrences of {pattern} with {string} on each specified line |
| :[range]global/{pattern}/[cmd]                 |    Execute the Ex command [cmd] on all specified lines where the {pattern} matches |

## Putting Vim in the Background
The :shell command is a feature provided by Vim, which lets us switch to an interactive shell. But if we’re already running Vim in a terminal, then we also have access to built-in shell commands. For example, the bash shell supports job control, which allows us to suspend a job by putting it into the background and then lets us resume it later by bringing it back into the foreground.

Suppose that we’re running Vim inside a bash shell and we want to execute a series of shell commands. Pressing Ctrl - z suspends the process that’s running Vim and returns control to bash. The Vim process sits idle in the background, allowing us to interact with our bash session as normal. We can inspect the list of jobs by running this command:

```
➾ $ jobs
❮ [1]+ Stopped                vim
```
In bash, we can use the `fg` command to resume a suspended job, bringing it back into the foreground. That brings Vim back to life exactly as we left it. The `Ctrl-z` and `fg` commands are quicker and easier to use than Vim’s equivalent `:shell` and exit commands. For more information, run `man bash` and read the section on job control.
zsh:1: no such file or directory: wiki/nvim-worth-to-know.mdp

**Note:**

When we use the `:!{cmd}` syntax, Vim echoes output from the `{cmd}`. This works fine if the command produces little or no output, but it’s not very helpful if the command produces many lines of output. As an alternative, we can use the `:read !{cmd}` command, which puts the output from the `{cmd}` into our current buffer (see `:h :read!`).

## Creating Split Windows
When Vim starts up, it contains a single window. We can divide this window horizontally with the `<C-w>s` command, which creates two windows of equal height. Or we can use the `<C-w>v` command to split the window vertically, producing two windows of equal width. We can repeat these commands as often as we like, splitting our workspace again and again in a process that resembles cell division.

Each time we use the `<C-w>s` and `<C-w>v` commands, the two resulting split windows will contain the same buffer as the original window that was divided. Having the same buffer displayed in separate windows can be useful, especially if we’re working on a long file. For example, we could scroll in one of the windows to show a part of the buffer that we want to refer to while making changes to another part of the buffer in the other window.

## Changing the Focus Between Windows
Vim provides a handful of commands for switching the focus between split windows. This table summarizes some of the highlights (for the complete list, see :h window-move-cursor ):

| Command   |                                  Effect    |
|-----------|--------------------------------------------|
| `<C-w>w`  |              Cycle between open windows    |
| `<C-w>h`  |              Focus the window to the left  |
| `<C-w>j`  |              Focus the window below        |
| `<C-w>k`  |              Focus the window above        |
| `<C-w>l`  |              Focus the window to the right |

In fact, `<C-w><C-w>` does the same thing as `<C-w>w` . That means we can press the `<Ctrl>` key and hold it while typing `ww` (or `wj` or any of the others from the table) to change the active window. It’s easier to type `<C-w><C-w>` than `<C-w>w` , even though it looks nastier when written down. Still, if you use split windows heavily, you might want to consider mapping these commands to something even more convenient.

## Closing Windows
If we want to reduce the number of windows in our workspace, we can take one of two strategies. We could use the `:close` command to close the active window, or if we want to close all windows except the active one, we can instead use the :only command. This table summarizes the options and shows the normal mode equivalents:

| Ex Command | Normal Command |  Effect                                          |
|------------|----------------|--------------------------------------------------|
| `:clo[se]` | `<C-w>c`       |  Close the active window                         |
| `:on[ly]`  | `<C-w>o`       |  Keep only the active window, closing all others |

## Resizing and Rearranging Windows
Vim provides several key mappings for resizing windows. For the full list, look up :h window-resize . This table summarizes a handful of the most useful commands:

| Keystrokes    |   Buffer Contents                          |
|---------------|--------------------------------------------|
| `<C-w>=`      |   Equalize width and height of all windows |
| `<C-w>_`      |   Maximize height of the active window     |
| `<C-w>pipe`      |   Maximize width of the active window      |
| `[N]<C-w>_`   |   Set active window height to [N] rows     |
| `[N]<C-w>pipe`   |   Set active window width to [N] columns   |

**NOTE**: Here pipe means | symbol

## How to Use Tabs
Vim’s tab pages can be used to partition work into different workspaces. They have more in common with the virtual desktops in Linux than they do with the tabbed interface of most other text editors.

Suppose that we’re at work on a project, with our workspace divided into a few split windows. Out of the blue, something urgent comes up and we have to switch contexts. Rather than opening new files in our current tab page, which would mess up our carefully assembled workspace, we can create a new tab page and do the work there. When we’re ready to resume our previous work, we just have to switch back to the original tab page where all of our windows will have been preserved as we left them.

The `:lcd {path}` command lets us set the working directory locally for the current window. If we create a new tab page and then use the `:lcd` command to switch to another directory, we can then comfortably scope each tab page to a different project. Note that `:lcd` applies locally to the current window, not to the current tab page. If we have a tab page containing two or more split windows, we could set the local working directory for all of them by running `:windo lcd {path}`. Check out episode 9 of Vimcasts for more information.

**Table: Tab operations**

| Command                     |      Effect                                            |
|-----------------------------|--------------------------------------------------------|
| `:tabe[dit] {filename}`     |      Open {filename} in a new tab                      |
| `<C-w>T`                    |      Move the current window into its own tab          |
| `:tabc[lose]`               |      Close the current tab page and all of its windows |
| `:tabo[nly]`                |      Keep the active tab page, closing all others      |

## Switching Between Tabs
Tabs are numbered starting from 1. We can switch between tabs with the {N}gt command, which can be remembered as goto tab {N}. When this com- mand is prefixed with a number, Vim jumps to the specified tab, but if the number is omitted, Vim advances to the next tab. The gT command does the same but in reverse.

| Ex Command         |   Normal Command     | Effect                          |
|--------------------|----------------------|---------------------------------|
| `:tabn[ext] {N}`   |   `{N}gt`            | Switch to tab page number {N}   |
| `:tabn[ext]`       |   `gt`               | Switch to the next tab page     |
| `:tabp[revious]`   |   `gT`               | Switch to the previous tab page |

## Character Searches Can Include or Exclude the Target
The `f{char}`, `;` , and `,` commands are part of a set of character-search commands. This table lists them all:

| Command   |  Effect                                                            |
|-----------|--------------------------------------------------------------------|
| `f{char}` |  Forward to the next occurrence of {char}                          |
| `F{char}` |  Backward to the previous occurrence of {char}                     |
| `t{char}` |  Forward to the character before the next occurrence of {char}     |
| `T{char}` |  Backward to the character after the previous occurrence of {char} |
| `;`       |  Repeat the last character-search command                          |
| `,`       |  Reverse the last character-search command                         |

## Text Objects
A partial list of Vim’s built-in text objects is summarized in the following table. In the interests of neatness, some duplicates have been omitted. For example, i( and i) are equivalent to each other, and so too are a[ and a] . Use whichever style you find most comfortable.

| Text Object    |   Selection                    |    Text Object      |  Selection                  |
|----------------|--------------------------------|---------------------|-----------------------------|
| `a) or ab`     |   A pair of (parentheses)      |    `i) or ib`       |  Inside of (parentheses)    |
| `a} or aB`     |   A pair of {braces}           |    `i} or iB`       |  Inside of {braces}         |
| `a]`           |   A pair of [brackets]         |    `i]`             |  Inside of [brackets]       |
| `a>`           |   A pair of <angle brackets>   |    `i>`             |  Inside of <angle brackets> |
| `a'`           |   A pair of 'single quotes'    |    `i'`             |  Inside of 'single quotes'  |
| `a"`           |   A pair of "double quotes"    |    `i"`             |  Inside of "double quotes"  |
| a`             |   A pair of `backticks`        |    i`               |  Inside of `backticks`      |
| `at`           |   A pair of <xml>tags</xml>    |    `it`             |  Inside of <xml>tags</xml>  |

## Mark Your Place and Snap Back to It
> Vim’s marks allow us to jump quickly to locations of interest within a document. We can set marks manually, but Vim also keeps track of certain points of interest for us automatically.

The `m{a-zA-Z}` command marks the current cursor location with the designated letter `(:h m )`. Lowercase marks are local to each individual buffer, whereas uppercase marks are globally accessible. Vim does nothing to indicate that a mark has been set, but if you’ve done it right, then you should be able to jump directly to your mark with only two keystrokes from anywhere in the file.

Vim provides two Normal mode commands for jumping to a mark. (Pay attention they look similar!) `'{mark}` moves to the line where a mark was set, positioning the cursor on the first non-whitespace character. The `` `{mark} `` command moves the cursor to the exact position where a mark was set, restoring the line and the column at once (see :h mark-motions).

If you commit only one of these commands to memory, go with `` `{mark} ``. Whether you care about restoring the exact position or just getting to the right line, this command will get you there. The only time you have to use the `'{mark}` form is in the context of an Ex command.

The `mm` and `` `m `` commands make a handy pair. Respectively, they set the mark m and jump to it.

### Automatic Marks
We can set up to twenty-six lowercase marks per buffer. That’s one mark for each letter of the alphabet, and it’s way more than you’re ever likely to need! In Vim’s predecessor, `vi`, there was no such thing as Visual mode. Back then, marks would have been a much more important feature than they are now. Many of the tasks that would have required a mark in `vi` can be done in Vim using Visual mode.

But marks have not become obsolete in Vim; they still have their uses. In particular, the marks that Vim sets for us automatically can be really handy. They include the marks shown in Table:

| Keystrokes       |   Buffer Contents                                   |
|------------------|-----------------------------------------------------|
| &#96;&#96;       |   Position before the last jump within current file |
| `` `. ``         |   Location of last change                           |
| `` `^ ``         |   Location of last insertion                        |
| `` `[ ``         |   Start of last change or yank                      |
| `` `] ``         |   End of last change or yank                        |
| `` `< ``         |   Start of last visual selection                    |
| `` `> ``         |   End of last visual selection                      |

## Traverse the Jump List
Vim records our location before and after making a jump and provides a couple of commands for retracing our steps.

In web browsers, we’re used to using the back button to return to pages that we visited earlier. Vim provides a similar feature by way of the jump list: the `<C-o>` command is like the back button, while the complementary `<C-i>` command is like the forward button. These commands allow us to traverse Vim’s jump list, but what exactly is a jump?

Motions move around within a file, whereas jumps can move between files. Any command that changes the active file for the current window can be described as a jump. In the jump list, Vim records the cursor location before and after running such a command. We can use the <C-o> and <C-i> commands to jump back and forth between the two files.

Moving directly to a line number with [count]G counts as a jump, but moving up or down one line at a time does not. The sentence-wise and paragraph-wise motions are jumps, but the character-wise and word-wise motions are not. As a rule of thumb, we could say that long-range motions may be classified as a jump, but short-range motions are just motions.

 This table summarizes a selection of jumps:

| Command                                          | Effect                                         |
|--------------------------------------------------|------------------------------------------------|
| `[count]G`                                       | Jump to line number                            |
| `/pattern <CR> /?pattern <CR> / n / N`           | Jump to next/previous occurrence of pattern    |
| `%`                                              | Jump to matching parenthesis                   |
| `(/)`                                            | Jump to start of previous/next sentence        |
| `{/}`                                            | Jump to start of previous/next paragraph       |
| `H/M/L`                                          | Jump to top/middle/bottom of screen            |
| `gf`                                             | Jump to file name under the cursor             |
| `<C-]>`                                          | Jump to definition of keyword under the cursor |
| ``'{mark}`` / `` `{mark} ``                      | Jump to a mark                                 |

**Beware of Mapping the Tab Key**

Try pressing `<C-i>` in Insert mode, and you should find that it has the same effect as pressing the `<Tab>` key. That’s because Vim sees `<C-i>` and `<Tab>` as the same thing.

Beware that if you attempt to create a mapping for the `<Tab>` key, it will also be triggered when you press `<C-i>` (and vice versa). That may not seem like a problem, but consider this: if you map the `<Tab>` key to something else, it will overwrite the default behavior of the `<C-i>` command. Think carefully about whether that’s a worthwhile trade-off. The jump list is much less useful if you can only traverse it in one direction.

## Traverse the Change List
Using the `g;` and `g,` commands, we can traverse backward and forward through the change list. As a memory aid for `g;` and `g,`, it may help to remember that the `;` and `,` commands can be used to repeat or reverse the `f{char}` command

The `` `^ `` mark references the last insertion, which is slightly more specific than the last change. If we leave Insert mode and then scroll around the document, we can quickly carry on where we left off by pressing `gi (:h gi )`. In a single move, that uses the `` `^ `` mark to restore the cursor position and then switches back into Insert mode. It’s a great little time saver!

## Snap Between Files Using Global Marks
A global mark is a kind of bookmark that allows us to jump between files. Marks can be especially useful for snapping back to a file after exploring a codebase.

The `m{letter}` command allows us to create a mark at the current cursor position `(:h m )`. Lowercase letters create marks that are local to a buffer, whereas uppercase letters create global marks. Having set a mark, we can snap our cursor back to it with the `` `{letter} `` command (:h `` ` `` ).

Try this: open up your `vimrc` file and press `mV` to set a global mark (mnemonic: V for `vimrc`). Switch to another file and then press `` `V ``, and you should snap back to the global mark you set in the `vimrc` file. By default, global marks are persisted between editing sessions (although this behavior can be configured; see :h 'viminfo' ). Now you can always open up your `vimrc` file with two keystrokes that is, unless you set the global V mark to another location.

### Set a Global Mark Before Going Code Diving
Global marks can be especially useful when we need to browse through a set of files and then quickly snap back to where we started. Suppose that we’re working on some code, and we want to find all occurrences of a method called `fooBar()` in our codebase. We could use the `:vimgrep` command.

```vim
:vimgrep /fooBar/ **
```

By default, `:vimgrep` jumps directly to the first match that it finds, which could mean switching to another file. At this point, we can use the `<C-o>` command to get back to where we were prior to running `:vimgrep`.

Let's say that our codebase contains dozens of matches for the pattern `fooBar`. For each match `:vimgrep` finds, it creates a record in the **quickfix** list. Now suppose that we spend a minute or two traversing that list until eventually we find what we are looking for. Now we want to get back to where we were before we ran the `:vimgrep` command. How do we do it?

We could get there using the `<C-o>` command to reverse through the jump list, but it might take a while. This is a scenario where a global mark would come in handy. If we had run the `mM` command before invoking `:vimgrep`, then we could snap back in one move with the `` `M `` command.

Advice is rarely welcome when it goes "You should have started by doing X." Global marks are only useful if we have the forethought to set them up correctly in advance. With practice, you’ll learn to recognize the scenarios where it would be useful to set a global mark.

Try to get into a habit of setting a global mark before using any commands that interact with the `quickfix` list, such as `:grep`, `:vimgrep`, and `:make`. The same goes for the commands that interact with the buffer and argument lists, such as `:args {arglist}` and `:argdo`

Remember, you can set up to twenty-six global marks, which is more than you'll ever need. Use them liberally; set a global mark any time you see something that you might want to snap back to later.

## Grok Vim’s Registers
Rather than using a single clipboard for all cut, copy, and paste operations, Vim provides multiple registers. When we use the delete, yank, and put commands, we can specify which register we want to interact with.

### Addressing a Register
The delete, yank, and put commands all interact with one of Vim's registers. We can specify which register we want to use by prefixing the command with `"{register}` . If we don’t specify a register, then Vim will use the unnamed register.

For example, if we wanted to yank the current word into register a, we could run `"ayiw`. Or if we wanted to cut the current line into register b, we could run "bdd . Then we could paste the word from register a by typing `"ap`, or we could paste the line from register b by typing `"bp`.

In addition to the Normal mode commands, Vim also provides Ex commands for delete, yank, and put operations. We could cut the current line into register c by running `:delete c`, and then we could paste it below the current line with the `:put c` command. These may seem verbose in comparison with the Normal mode commands, but they’re useful in combination with other Ex commands and in Vim scripts.

### The Unnamed Register ("")
If we don’t specify which register we want to interact with, then Vim will use the unnamed register, which is addressed by the `"` symbol (see :h quote_quote ). To address this register explicitly, we have to use two double quote marks: for example, `""p`, which is effectively equivalent to p by itself.

The `x`, `s` , `d{motion}`, `c{motion}`, and `y{motion}` commands (and their uppercase equivalents) all set the contents of the unnamed register. In each case, we can prefix `"{register}` to specify another register, but the unnamed register is the default. The fact that it’s so easy to overwrite the contents of the unnamed register can cause problems if we’re not careful.

### The Yank Register ("0)
When we use the `y{motion}` command, the specified text is copied not only into the unnamed register but also into the yank register, which is addressed by the 0 symbol (see :h quote0 ).

As the name suggests, the yank register is set only when we use the y{motion} command. To put it another way: it’s not set by the x , s , c{motion} , and d{motion} commands. If we yank some text, we can be sure that it will stick around in register 0 until we explicitly overwrite it by yanking something else. The yank register is reliable, whereas the unnamed register is volatile.

If we inspect the contents of the unnamed and yank registers, we’ll see that they contain the text that we deleted and yanked, respectively:
```vim
:reg "0
❮ --- Registers ---
"" somethingInTheWay
"0 collection
```

### The Named Registers ("a–"z)
Vim has one named register for each letter of the alphabet (see :h quote_alpha ). That means that we can cut ( "ad{motion} ), copy ( "ay{motion} ), or paste ( "ap ) up to twenty-six pieces of text.

Using a named register requires extra keystrokes, so for a simple example like this we're better off using the yank register ("0). Named registers can become really useful when we've got one or more pieces of text that we want to paste in several places.

### The Black Hole Register ("_)
The black hole register is a place from which nothing returns. It’s addressed by the underscore symbol (see :h quote_ ). If we run the command "_d{motion} , then Vim deletes the specified text without saving a copy of it. This can be useful if we want to delete text without overwriting the contents of the unnamed register.

### The System Clipboard ("+) and Selection ("*) Registers
All of the registers that we've discussed so far are internal to Vim. If we want to copy some text from inside of Vim and paste it into an external program (or vice versa), then we have to use one of the system clipboards.

Vim’s plus register references the system clipboard and is addressed by the + symbol (see :h quote+ ).

If we use the cut or copy command to capture text in an external application, then we can paste it inside Vim using "+p command (or <C-r>+ from the Insert mode). Conversely, if we prefix Vim’s yank or delete commands with "+ , the specified text will be captured in the system clipboard. That means we can easily paste it inside other applications.

The X11 windowing system has a second kind of clipboard called the primary. This represents the most recently selected text, and we can use the middle mouse button (if we have one) to paste from it. Vim’s quotestar register maps to the primary clipboard and is addressed by the * symbol (:h quotestar ).

| Keystrokes | Buffer Contents                                   |
|------------|---------------------------------------------------|
| "+         | The X11 clipboard, used with cut, copy, and paste |
| "*         | The X11 primary, used with middle mouse button    |

In Windows and Mac OS X, there is no primary clipboard, so we can use the "+ and "* registers interchangeably: they both represent the system clipboard.

Vim can be compiled with or without support for X11 clipboard integration. To find out whether your version of Vim has the feature enabled, run the :version command and look for xterm_clipboard. If it’s prefixed with a minus sign, then your version of Vim does not support this feature. A plus sign means that the feature is available.

### The Expression Register ("=)
Vim’s registers can be thought of simply as containers that hold a block of text. The expression register, referenced by the = symbol (:h quote= ), is an exception. When we fetch the contents of the expression register, Vim drops into Command-Line mode, showing an = prompt. We can enter a Vim script expression and then press <CR> to execute it. If the expression returns a string (or a value that can be easily coerced into a string), then Vim uses it.

### More Registers
We can set the contents of the named, unnamed, and yank registers explicitly using the delete and yank commands. In addition, Vim provides a handful of registers whose values are set implicitly. These are known collectively as the read-only registers (:h quote. ). The following table summarizes them:

| Register | Contents                   |
|----------|----------------------------|
| "%       | Name of the current file   |
| "#       | Name of the alternate file |
| ".       | Last inserted text         |
| ":       | Last Ex command            |
| "/       | Last search pattern        |

