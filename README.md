# tdcli
A simple Ruby Command Line Interface for Todoist

## Purpose
I am building this to integrate Todoist into my operating system and learn Ruby. Most existing implementations of Todoist CLI's are in Python as well as add extra formmating that prevent me from running things like `tdcli tasks | wc -l` to get a count of my tasks.

## Installation
TdCLI can be installed with Ruby Gems.
`gem install tdcli`

## Usage
### Update
tdcli caches Todoist information and to update information you must run
```
$ tdcli update
```

### View Tasks
```
$ tdcli tasks
- Checkout repo
- Install tdcli
- Manage Todoist from the CLI
```

### View Projects
```
$ tdcli projects
Inbox
Hobby
School
 Bio
 Math
 Art
Work
```
