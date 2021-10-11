# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - built with Sinatra
- [x] Use ActiveRecord for storing information in a database - built using Active Record
- [x] Include more than one model class (e.g. User, Post, Category) - has users, blocks, and buttons
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - user has many blocks, blocks has many buttons
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - blocks belong to a user, buttons belong to a block
- [x] Include user accounts with unique login attribute (username or email) - both email and username are unique
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - can CRUD both buttons and blcoks
- [x] Ensure that users can't modify content created by other users - authenticated? method
- [x] Include user input validations - validates input via HTML, if statements, and :validates built-in
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) -yes
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code -yes

Confirm
- [x] You have a large number of small Git commits - yes
- [x] Your commit messages are meaningful - yes, kinda
- [x] You made the changes in a commit that relate to the commit message - yes
- [x] You don't include changes in a commit that aren't related to the commit message -yes 