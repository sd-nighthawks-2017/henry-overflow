> **Note**: This branch (master) contains a skeleton without any app code, perfect for creating a _new_ application or challenge. If you're looking for an example app built with this skeleton, take a look at the [example](/../..//tree/example) branch which includes basic CRUD and RSpec tests.

### Team Name: Henry :package:

### Team Members:
1. Daniel Way
2. David Keller
3. Michael McDonald

### User Stories:
1. Users can post questions. Other users can answer them.
2. Users can comment on both questions and answers. Like StackOverflow, the comments should just be displayed in a flat list.
3. The user who posted a question can declare one of the user-submitted answers to be the best answer.
4. Users can upvote and downvote questions, answers, and comments—only one vote per user for each question, answer, and comment.
5. Users cannot add a question, answer, or comment or vote unless they're logged in, but they can view all of the above when logged out.
- *Stretch*: Sort answers with the answer selected as the best answer first, followed by the most highly voted. Sort comments chronologically with oldest first.
- *Stretch*: Users can see questions sorted three ways: highest-voted, most recent, and "trending".

### Purpose
The Sinatra Skeleton:

1. Provides a foundation for building challenges or creating a new Sinatra application.
2. Demonstrates a reasonable set of practices around building Sinatra applications.
3. Eases the transition to Rails for Dev Bootcamp students

### Quickstart

1.  `bundle install`
2.  `shotgun config.ru`

As needed, create models & migrations with the `rake` tasks:

```
rake generate:migration  # Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks
rake generate:model      # Create an empty model in app/models, e.g., rake generate:model NAME=User
```

### Contributing

We would love for you to help make the skeleton more awesome, There are three ways to contribute:

1. Ask for a bug fix or enhancement!
2. Submit a pull request for a bug fix or enhancement!
3. Code review an open pull request!

Be prepared to give and receive specific, actionable, and kind feedback!
