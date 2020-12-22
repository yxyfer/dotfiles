# Dotfiles

## Installation Process
----
0. You don't need anything! --> Installs everything including Oh-my-zsh and the necessary plugins. ( you can add some by modifying the `install` file.
1. go in the CodingSetUp folder.
2. source install
3. multiple options: 
```
termi // to Install terminal profile
vimi  // to Install vim profile (includes custom purple_theme)
giti  // to Install git
```
4. if you're on a mac (with original terminal)
   
   you can import the purple_theme.terminal in the terminal configurations and set it to default
5. You're Done :) enjoy 

---
## About the purple_theme themes:
-----
![alt text](https://github.com/yxyfer/CodingSetUp/blob/master/images/purple_theme_term.png "Terminal Theme Image")

- Two versions:
   - Vim
   - Mac terminal
- This two themes have been thought and made to work together.
- You will notice that the terminal theme is a bit darker than the vim theme because otherwise I had trouble differentiating them...
- they are easy on the eyes :).

## About the Terminal Profile
----
#### Configs.sh
- This is essentially the .zshrc.
- Has some

### Custom folder
#### Prompt.sh
- This contains my custom prompt :)
```
format: user.name dir-1/dir >   [...]   [git-branch] // Git branch on the right
```
![alt text](https://github.com/yxyfer/CodingSetUp/blob/master/images/prompt_term.png "Prompt Image")

#### Git integration:
   - new file red dot.
   - Modified file orange dot.
   - added file green dot.
   - pull red down arrow
   - Committed file blue up arrow
   
![alt text](https://github.com/yxyfer/CodingSetUp/blob/master/images/git_integration_prompt.png "Git integration Prompt Image")

#### VM - Only works with vm_ware
---
This is a very neet integration that allows you to start / stop / suspend your vm_ware vm's from the command line and without needing to ever leave the command line :). Even connects to ssh on its own.
- USAGE of vm_ware:
```
format: vm_ware you_vm_name [ACTION]
[ACTIONS]:
   - start
   - suspend
   - stop
```
- USAGE of vm_connect:
```
format: vm_connect
```
![alt text](https://github.com/yxyfer/CodingSetUp/blob/master/images/vm_demo.png "VM Demo")

   - Connects your to the vm automatically.

## About the Vim Profile
---
- My personal Vim profile
- adds quite a lot of features.
- Includes a custom and fast status line
[ ] Add Picture
