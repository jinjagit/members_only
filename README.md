# Members Only Rails app:

Simon Tharby's solution to [Project 2: Members Only!](https://www.theodinproject.com/courses/ruby-on-rails/lessons/authentication?ref=lnav), Authentication, Ruby on Rails, Odin Project.

## Assignment instructions:

"In this project, you’ll be building an exclusive clubhouse where your members can write embarrassing posts about non-members. Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it."

+ [more explicit guidance](https://www.theodinproject.com/courses/ruby-on-rails/lessons/authentication?ref=lnav).

In summary, the exercise requires the construction of a login page, an index of user posts where only logged-in users can see the name of the post authors, and the respective routes, models and controllers these require (including session cookies to 'remember' a logged-in user).

## Getting started:

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
