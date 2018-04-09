User stories:

As a user,
So that I can find a saved page,
I want to be able to see a list of my bookmarks

As a user,
So that I can save a page,
I want to be able to add an item to my list of bookmarks

As a user,
So that my list remains relevant,
I want to be able to delete a bookmark from the list

As a user,
So that I can change obsolete information
I want to be able to update a bookmark


Domain model:

Our starter model has two classes:

Bookmark:
  - Create
  - Update
  @url
  @description

Bookmark_list
  - delete
  - view
  - add(bookmark)
  Contains a data collector to contain the bookmarks
