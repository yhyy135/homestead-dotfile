# homestead-dotfile
Some scripts and config files about Laravel Homestead

* `Homestead.yaml`: 
    1. Set homestead name: `laravel`
    2. Set homestead IP: `192.168.10.10`
    3. Use local vagrant box which name is `laravel/homestead` and `version` is `0` to initial homestead, you can delete this config to use official homestead vagrant box, it will be download when you initial homestead first time.
* `after.sh`: 
    1. Replace `apt-get`, `NPM`, `Composer` source to China mirror.
    2. Install Software: `vim`, `git`, `wget`, `curl`, `screen`, `unzip`, `mlocate`, `net-tools`, `htop`
    3. Copy SSH keys of the `vagrant` user to `root` user in order to login SSH with the same SSH key instead of password.
    4. Set default shell of `vagrant` user to Oh my zsh, and theme is `ys`
* `aliases`: Some useful aliases.
* `user-customizations.sh`: git command completion.