# Yxyfer's Dotfiles 🚀 

1.  [Intro - Quick Install](#intro)
2.  [Terminal Profile](#terminal)  
  2.1 [config.sh](#config_sh)  
  2.2 [custom prompt](#prompt)  
  2.3 [git integration](#termi_git)  
3.  [Vim Profile](#vim)
  3.1 [Vim Installation](#vim_install)
5.  [Git Profile](#git)
5.  [About the Purple Themes](#purple_themes)

---

## <a name="intro"></a> How to setup yxyfer's dotfiles easily?

0. You don't need anything! --> Installs everything including Oh-my-zsh and the necessary plugins. ( you can add some by modifying the `install` file.
1. go in the `dotfiles` folder.
  ```sh
    cd ~/dotfiles # if dotfiles is at your root. 
  ```
2. source install
  ```sh
    source install
  ```
3. multiple options: 
  ```sh
    termi # to Install terminal profile
    vimi  # to Install vim profile (includes custom purple_theme)
    giti  # to Install git
  ```
4. if you're on a mac (with original terminal)
   
   you can import the purple_theme.terminal in the terminal configurations and set it to default
5. You're Done :) enjoy 



## <a name="terminal"></a>About the Terminal Profile ✍️ 

[ ] TODO: Explain the different plugins


#### <a name="config_sh"></a>Configs.sh
- This is essentially the .zshrc.
- Has some

### Custom folder
#### <a name="prompt"></a>Prompt.sh
![alt text](https://github.com/yxyfer/dotfiles/blob/main/images/prompt_term.png "Prompt Image")

  - This is a fully custom prompt
  - It's designed to be extremely fast and simple without any useless functionality

```
format: user.name dir-1/dir >   [...]   [git-branch] // Git branch on the right
```

#### <a name="termi_git"></a>Git integration:
![alt text](https://github.com/yxyfer/dotfiles/blob/main/images/git_integration_prompt.png "Git integration Prompt Image")

What everything means:
  - new file red dot.
  - Modified file orange dot.
  - added file green dot.
  - pull red down arrow
  - Committed file blue up arrow
   

## <a name="vim"></a> About the Vim Profile
![alt text](https://github.com/yxyfer/dotfiles/blob/main/images/purple_vim.png "Purple Vim")

- My personal Vim profile
- adds quite a lot of features.
- Includes a custom and fast status line

### <a name="vim_install"></a> Install Vim Profile
```sh
cd ~/dotfiles
source install
vimi

vim # Inside vim 
:PlugInstall
```

  - If you code in C you might want to run the following command as well:
```sh 
c_completion # installs C completion for YMC
```



[ ] TODO add features

## <a name="git"></a> About Git profile
  - Installation:
```sh
    giti "John Appleseed" john@hello.com johnyyyyy
```

## <a name="purple_themes"></a> About the purple_theme themes 💜
![alt text](https://github.com/yxyfer/dotfiles/blob/main/images/purple_theme_term.png "Terminal Theme Image")

- Two versions:
   - Vim
   - Mac terminal
- This two themes have been thought and made to work together.
- You will notice that the terminal theme is a bit darker than the vim theme because otherwise I had trouble differentiating them...
- they are easy on the eyes :).

