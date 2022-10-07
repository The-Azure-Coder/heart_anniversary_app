# HEART Anniversary Registration App

## Getting Started

### Cloning the Project

To have a local copy of the project to work on clone the repository using the command `` in the terminal.

This will create a folder in the directory specified in the terminal. Use the command `cd <folder name>` to change the directory into the project folder.

### Installing the Dependencies.

node_modules which contains all the modules for this project is selected to be ignored to reduce project size. Therefore to retrieve all the dependencies of this project run the command `npm install` which will install the dependencies defined in the package.json file.

## Folder Structure

### constants

store Constants varibales like colors shadows,etc

### models

store Interfaces/Models

### screens

stores the various screens of the appliation

### services

All business logic is handled in services.

### widgets

Stores the major widgets used for encapsulation perposes

### Creating branch

To make changes to the application you must first create a branch which will house the changes you will make.
From the terminal run the command `git checkout -b <branch name>` to create a branch with the name you specify then swith from the main branch to that branch.

### Commiting Changes

Before you make a change ensure that you the most updated version of the project run the command `git pull`.
After you make the necessary changes to the project, run the command `git add .` which adds all the changes to the staging area to signal that its ready to be committed. After which run the command `git commit -m "<message that describes the changes>"` to make changes to that branch.

### Publishing the change for review.

If it is your first time making changes, you should first run the command `git pull origin develop` to retrieve the latest code from the Team.
<br>

If there is any merge conflicts you would need to first resolve them by accepting your changes or incomming changes from the Team's github branch.
After you have resolved the issues, commit the changes. This would therefore fix the merge conflict. When you have completed the merge you should then run the command `git push origin --set-upstream <your branch name here>` which will push the changes you have made to github in the branch that you defined in the command.

<br>

Any Subsequent changes that you make you just need to first pull from the Team's repository, fix any merge conflicts, then commit and push to your branch on github.

### Creating a Pull Request

Once you push to the github branch, A prompt will be shown in the repository telling you that you have changes on your branch and if you wish to create a pull request.
Additionally you could also go to the **Pull Request** Tab then select the option to create a pull request.

Once you select the branch you want to make the request to then go ahead and select the option to create pull request.

### Viewing the complete project.

Since we are using the main branch to house the complete project. You can view this by simply going to the main branch using the command `git checkout main`. After which do a git pull which will get all the updated information from the remote repository, <em>Github</em>, to your local main repository.

### Seeing all the changes in the project.

This can be done by first running the command `git checkout main` to switch to the main branch, then using `git pull main`. This will pull all the updated data from the github main branch to your local main branch. **DO NOT MAKE ANY CHANGES TO THE MAIN BRANCH**.

## Being Assigned Issues

Throughout the lifecycle of this application you may be assigned issues to have complete. These issues may or may not be assigned to individuals. If an issue is assigned to you. You would simply follow the regular procedures of making the necessary updates as per described by the issues. Then commit those changes. For each commit towards the completion of the issue, it is recommended that you specify the issue number/ID in the commit message. An example video demonstrating this can be found here **[Working with Issues](https://youtu.be/TKJ4RdhyB5Y)**

## Requesting a Review

It is good practice to request a review whenever you make a pull request. To do this, In the list of pull requests, click the pull request that you'd like to ask a specific person or a team to review. Navigate to Reviewers in the right sidebar. To request a review from a suggested person under Reviewers, next to their username, click Request.
