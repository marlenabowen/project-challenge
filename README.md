# Notes

### Completed Challenges

I really enjoyed working on this code sample. I completed the following challenges for the Back End portion:

* Add pagination to index page, to display 5 dogs per page
* Add the ability for a user to input multiple dog images on an edit form or new dog form
* Associate dogs with owners
* Allow editing only by owner
* Display the `ad.jpg` image (saved at app/assets/images/ad.jpg) after every 2 dogs in the index page, to simulate advertisements in a feed.
* Allow users to like other dogs (not their own)

Each challenge is isolated to a commit.

### Running Instructions

The running instructions for my code sample are the same as those which were provided in the original version of this README:

Run `bundle install`

Initialize the data with `rake db:reset`

Run the specs with `rspec`

Run the server with `rails s`

View the site at http://localhost:3000

### Further Optimizations

Out of respect for the time of those who will be reviewing this code, I did not want to over-engineer it or exceed the scope of the given challenges. On a future iteration, I would consider implementing any of the following:

* Add a user page where users can see their dogs and their likes
* Add the ability to "unlike" a dog (although this is an extreme edge case, because all dogs are like-worthy)
* Backfill a default value for dog's owner instead of making `user` an optional association
* General layout optimizations (specifically on the dog edit page)
* Add search functionality to search for dogs by name
* Add more elegant error handling (when liking your own dog, if you've already liked a dog, etc.)

###### I updated the Ruby version listed as required in the original README from `2.2.4` to `2.4.4` since `2.4.4` is specified in the Gemfile, and because [official support for the Ruby 2.2 series has ended](https://www.ruby-lang.org/en/news/2018/06/20/support-of-ruby-2-2-has-ended/)

_________________________________________________________________

# Welcome

This repository contains starter code for a technical assessment. The challenges can be done at home before coming in to discuss with the Bark team or can be done as a pairing exercise at the Bark office. Either way, we don't expect you to put more than an hour or two into coding. We recommend forking the repository and getting it running before starting the challenge if you choose the pairing approach.

# Set up

Fork this repository and clone locally

You'll need [ruby 2.4.4](https://rvm.io/rvm/install) and [rails 5](http://guides.rubyonrails.org/getting_started.html#installing-rails) installed.

Run `bundle install`

Initialize the data with `rake db:reset`

Run the specs with `rspec`

Run the server with `rails s`

View the site at http://localhost:3000
