---
title: MacOS Neovim setup
tags: [NeoVim]

---

# MacOS Neovim setup

## Requirement
- Neovim >= **0.9.0**
- Git >= **2.19.0**
- [Nerd font](https://www.nerdfonts.com/font-downloads) => **CodeNewRoman nerd font**
- Make (for ```nvim-treesitter```)
- Terminal => [iterm2](https://iterm2.com/)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
  - fzf: **fzf (>= 0.25)**
  - live grep: **ripgrep**
  - find files: **fd**
- [Lazygit](https://github.com/jesseduffield/lazygit) **(optional)**
- [Yazi](https://yazi-rs.github.io/) **(optional)**
  - [fish shell](https://fishshell.com/)
  - [tfm](https://github.com/Rolv-Apneseth/tfm.nvim)
## Install neovim
本文章是使用[Homebrew](https://brew.sh/)安裝neovim，如果還Homebrew沒安裝的話，請先行安裝。
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
完成後，再用下方指令安裝neovim
```
brew install neovim
```
確認是否安裝成功
```
nvim --version
```
有出現版本號就代表有成功安裝，就可以進到設定neovim的流程了。
##### Note: Requirement 提到的工具，也都可以透過Homebrew下載。

## Setup your neovim
#### Lazyvim starter
起手式可以參考[lazyvim install 官網](https://www.lazyvim.org/installation)進行安裝。
如果不是重新設定，可以跳過第1步的備份及刪除暫存檔的步驟。
完成後，就可以得到一個功能完整的neovim。
<img src="https://user-images.githubusercontent.com/292349/211285846-0b7bb3bf-0462-4029-b64c-4ee1d037fc1c.png"></img>
快捷鍵的部份可以參考官網的[keymap 設定](https://www.lazyvim.org/keymaps)
##### Note: 如果是初次使用neovim，可以先用lazyvim的原  設定去習慣neovim的開發。
#### fzf-lua setup
fzf-lua是lazyvim內建的，需要下載 **fzf** **live grep** **find file** 等工具才能正常使用。
###### 安裝fzf
```
brew install fzf
```
###### 安裝live grep
```
brew install ripgrep
```
###### 安裝live grep
```
brew install fd
```
都下載完成後，在neovim用 ```<leader><space>``` ```<leader>ff``` ```<leader>fF``` 來確認**fzf-lua**的功能是否正常。
#### LSP setup
lazyvim 的 LSP 現在不用特別設定，只需要輸入指令```:LazyExtras```把想要使用的plugin enable就可以直接使用了，非常方便。
<img src="https://github.com/LazyVim/lazyvim.github.io/assets/292349/e02f4a72-97bc-46cd-ab30-92127b1bbe4d"></img>
想要下載其他的plugin可以到[lazyvim extras](https://www.lazyvim.org/extras)去找有沒有想要使用的plugin，或是依照程式語言及推薦的plugin使用就可以。

#### Telescope setup
Telescope的設定是參考YTr [devaslife](https://www.youtube.com/@devaslife)的影片[link](https://www.youtube.com/watch?v=fFHlfbKVi30&t=2703s)來做設定的，裡面有蠻多實用的功能，像是list functions variable diagnostics等等的實用功能。
#### Tfm setup
[Tfm plugin](https://github.com/Rolv-Apneseth/tfm.nvim) 是將termianl file manager整合到neovim裡面，非常推薦使用的一個plugin。
安裝Tfm之前，要先安裝terminal file manager [yazi](https://yazi-rs.github.io/)，這個工具也一樣可以使用Homebrew安裝，可以參考[yazi installation](https://yazi-rs.github.io/docs/installation)進行安裝以及其他輔助yazi的工具。
安裝完yazi後，還要再安裝[fish shell](https://fishshell.com/)。
雖然GitHub上沒提，但在neovim啟動yazi是使用fish shell啟動的，所以必須得裝。（如果有同好知道怎麼修改啟動預設的shell，也請不吝指教。）
```
brew install fish
```
安裝完後，再依Tfm README.md安裝插件，就可以在neovim裡開啟yazi了。



## My source config lua
**[GitHub](https://github.com/SZL741023/lazyvim-config)**
## Reference source
- Video
  - [daveslife](https://www.youtube.com/watch?v=fFHlfbKVi30&t=2702s)
- Website
  - [lazyvim](https://www.lazyvim.org/)
  - [Homebrew](https://brew.sh/)
- Images
  - [lazyvim GitHub](https://github.com/LazyVim/LazyVim?tab=readme-ov-file) 

## Thanks for watching# MacOS Neovim setup

## Requirement
- Neovim >= **0.9.0**
- Git >= **2.19.0**
- [Nerd font](https://www.nerdfonts.com/font-downloads) => **CodeNewRoman nerd font**
- Make (for ```nvim-treesitter```)
- Terminal => [iterm2](https://iterm2.com/)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
  - fzf: **fzf (>= 0.25)**
  - live grep: **ripgrep**
  - find files: **fd**
- [Lazygit](https://github.com/jesseduffield/lazygit) **(optional)**
- [Yazi](https://yazi-rs.github.io/) **(optional)**
  - [fish shell](https://fishshell.com/)
  - [tfm](https://github.com/Rolv-Apneseth/tfm.nvim)
## Install neovim
本文章是使用[Homebrew](https://brew.sh/)安裝neovim，如果還Homebrew沒安裝的話，請先行安裝。
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
完成後，再用下方指令安裝neovim
```
brew install neovim
```
確認是否安裝成功
```
nvim --version
```
有出現版本號就代表有成功安裝，就可以進到設定neovim的流程了。
##### Note: Requirement 提到的工具，也都可以透過Homebrew下載。

## Setup your neovim
#### Lazyvim starter
起手式可以參考[lazyvim install 官網](https://www.lazyvim.org/installation)進行安裝。
如果不是重新設定，可以跳過第1步的備份及刪除暫存檔的步驟。
完成後，就可以得到一個功能完整的neovim。
<img src="https://user-images.githubusercontent.com/292349/211285846-0b7bb3bf-0462-4029-b64c-4ee1d037fc1c.png"></img>
快捷鍵的部份可以參考官網的[keymap 設定](https://www.lazyvim.org/keymaps)
##### Note: 如果是初次使用neovim，可以先用lazyvim的原  設定去習慣neovim的開發。
#### fzf-lua setup
fzf-lua是lazyvim內建的，需要下載 **fzf** **live grep** **find file** 等工具才能正常使用。
###### 安裝fzf
```
brew install fzf
```
###### 安裝live grep
```
brew install ripgrep
```
###### 安裝live grep
```
brew install fd
```
都下載完成後，在neovim用 ```<leader><space>``` ```<leader>ff``` ```<leader>fF``` 來確認**fzf-lua**的功能是否正常。
#### LSP setup
lazyvim 的 LSP 現在不用特別設定，只需要輸入指令```:LazyExtras```把想要使用的plugin enable就可以直接使用了，非常方便。
<img src="https://github.com/LazyVim/lazyvim.github.io/assets/292349/e02f4a72-97bc-46cd-ab30-92127b1bbe4d"></img>
想要下載其他的plugin可以到[lazyvim extras](https://www.lazyvim.org/extras)去找有沒有想要使用的plugin，或是依照程式語言及推薦的plugin使用就可以。

#### Telescope setup
Telescope的設定是參考YTr [devaslife](https://www.youtube.com/@devaslife)的影片[link](https://www.youtube.com/watch?v=fFHlfbKVi30&t=2703s)來做設定的，裡面有蠻多實用的功能，像是list functions variable diagnostics等等的實用功能。
#### Tfm setup
[Tfm plugin](https://github.com/Rolv-Apneseth/tfm.nvim) 是將termianl file manager整合到neovim裡面，非常推薦使用的一個plugin。
安裝Tfm之前，要先安裝terminal file manager [yazi](https://yazi-rs.github.io/)，這個工具也一樣可以使用Homebrew安裝，可以參考[yazi installation](https://yazi-rs.github.io/docs/installation)進行安裝以及其他輔助yazi的工具。
安裝完yazi後，還要再安裝[fish shell](https://fishshell.com/)。
雖然GitHub上沒提，但在neovim啟動yazi是使用fish shell啟動的，所以必須得裝。（如果有同好知道怎麼修改啟動預設的shell，也請不吝指教。）
```
brew install fish
```
安裝完後，再依Tfm README.md安裝插件，就可以在neovim裡開啟yazi了。



## My source config lua
**[GitHub](https://github.com/SZL741023/lazyvim-config)**
## Reference source
- Video
  - [daveslife](https://www.youtube.com/watch?v=fFHlfbKVi30&t=2702s)
- Website
  - [lazyvim](https://www.lazyvim.org/)
  - [Homebrew](https://brew.sh/)
- Images
  - [lazyvim GitHub](https://github.com/LazyVim/LazyVim?tab=readme-ov-file) 

## Thanks for watching