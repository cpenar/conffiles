# First system installation

``` 
wget https://raw.githubusercontent.com/cpenar/conffiles/master/first_sys_config.sh -O - | sh
```

# Vundle

cf https://github.com/VundleVim/Vundle.Vim

# Powerline 

* https://powerline.readthedocs.io/en/latest/
* www.tecmint.com/powerline-adds-powerful-statuslines-and-prompts-to-vim-and-bash/

##### Requirements

```
sudo apt-get install python-pip3 git
sudo pip3 install powerline-status
```

##### Fonts installation

###### The font file

To find where the fonts can be installed :
`xset q |grep -A1 'Font Path:'`

In my case :
```
sudo wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -P /usr/share/fonts/X11/misc/
sudo fc-cache -vf  /usr/share/fonts/X11/misc/
```

###### The font config file

```
sudo wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -P  /etc/fonts/conf.d/
```

###### Restart X
Save what you need and
```
sudo pkill X
```

