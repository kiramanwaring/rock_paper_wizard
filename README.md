# Rock . Paper . Scissors . WIZARDS! ![alt text](http://cdn.wikimg.net/strategywiki/images/2/2c/FFI_white_mage_(8-bit).gif "Light Wizard")

### About
  - RPSW is a game of Rock, Paper, Scissors with the addition of Dark and Light Wizards
     - The Dark and Light Wizards modify the game rules, see below
  - The user creates a wizard and uses that wizard to battle our NPC wizards
     - In the future we will have the ability to have two users face off, the websocket function allows for this expansion but the current battle model needs to be altered to allow this.

### Rules
  - Standard Rock, Paper, Scissors rules apply when:
     - Dark vs. Dark
     - Light vs. Light
  - The win condition is changed when:
     - Light vs. Dark
     - Dark vs. Light
  - You'll have to play to figure out the conditions of LvD

### Gameplay
  - After signing up/in, you will be directed to create a Wizard. 
  - You can give it any name you like, and choose whether it is a light wizard or a dark wizard. If you do not give the Wizard a name, it will be called "Unnamed Wizard"
  - from there you will see two lists of wizards: yours, and leaderboard of all wizards sorted by level
  - Click on the name of one of your wizards to enter that wizards battles page
  - Once on the battles page you can select opponents on the left, and select a battle to fight on the right. clicking a battle will take you to the arena for the high stakes game of Rock, Paper, Scissors (WIZARD!)

### The Project
  - Built on Rails
  - Seedfile contains many opponent wizards, be sure to `rake db:seed` before playing
  - This uses Websockets and Puma so you must have both servers running
    - run `gem install puma` to get the puma gem
    - when you run `rails s` to get the rails server up, you should also run `puma faye.ru`
    - failure to run the puma server will prevent the websocket from running the battle animations

### Done by:
  - Michael Manwaring
  - Kyle McCloskey
