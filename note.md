###Config true colors:
As a Neovim master, I'm here to save thousands of folks who want to use beautiful true color Alacritty with tmux. I've confirmed that this will work on both macOS and ubuntu VM. Follow me!

In alacritty / INSTALL.md from the official Alacritty GitHub.

If you build alacritty yourself
great! Make sure you're in the alacritty/ folder you cloned and run one command:

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
then go to your rc file (In my case .zshrc) and add:

export TERM=alacritty
If you install alacritty via Homebrew
Great! I'm on the same side as you! Instead of cloning the entire alacritty/ folder, run this anywhere in your computer:

mkdir alacritty
and then download the alacritty/extra/ folder and copy it into the alacritty/ you just create, then (the following steps the same as bulid step above) run:

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
then go to your rc file (In my case .zshrc) and add:

export TERM=alacritty
