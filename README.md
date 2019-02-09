
# Bash helpears
A set of bash helper functions (Currently only git and github specific) to make my life easier.


## Why
Im lazy af.


## Warning
This is only for linux.
I don't know if this will work on your computer. The important thing is, it works on mine.


## Installation

* Clone this repo to wherever. (Something like `~/.bash-helpers` would be cool)
```bash
git clone https://github.com/phenax/bash-helpers.git ~/.bash-helpers
```

* Add `~/.bash-helpers/bin` or your `PATH`. To do that, go to your `~/.bashrc` or `~/.zshrc` file and add the following to the bottom.
```bash
export PATH=$HOME/bash-alias/bin:$PATH;
```

* The previous step was the final step. This is just a congratulations step.



## Commands available

### Git Repository stuff

#### Open your repository in the browser

For origin
```bash
git open-repo
```

For upstream repo
```bash
git open-repo upstream
```

#### Create a new pull request

Current branch to origin/master
```bash
git open-pr
```

Current branch to origin/develop
```bash
git open-pr develop
```

Current branch to upstream/develop
```bash
git open-pr develop upstream
```

#### Create a new issue

Go to create issue page
```bash
git new-issue
```

Issue with title
```bash
git new-issue "Cant click on stuff"
```

Issue with title to be created on upstream repo
```bash
git new-issue "Cant click on stuff" upstream
```


### Git shorthands

#### Amend

```bash
git amend
```

Edit message
```bash
git amend "My message"
```

#### Sync
How dare they make me type "origin"?!

With master branch
```bash
git sync
```

With any other branch
```bash
git sync develop
```

