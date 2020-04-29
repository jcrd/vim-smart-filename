# vim-smart-filename

vim-smart-filename provides a single function `SmartFilename` that returns the
path to the current file formatted as follows:

* if present in the path, `$HOME` is shortened to `~`
* if the path is too long, directory names are abbreviated
* if in a git repository, the filename is relative to the repo root, and the
  repo name and branch are shown

In this way it attempts to emulate the filename formatting of the Emacs package
[smart-mode-line](https://github.com/Malabarba/smart-mode-line/).

## Dependencies

* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-rooter](https://github.com/airblade/vim-rooter)

## License

This project is licensed under the MIT License (see [LICENSE](LICENSE)).
