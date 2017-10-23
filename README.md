# Giphit

Yup ... it's _another_ Giphy client!! This project was mostly a skill-sharpening exercise since Ruby hasn't been my primary language in awhile. So, I chose the always fun and suprisingly easy to use Giphy API to base this project on.

## TODO

* [X] DRY up the search path construction
* [X] Add specs
  * [ ] Implement mocking for HTTP requests & JSON responses
* [ ] Finish & publish documentation
* [ ] Add URL encoding to search queries
* [ ] Implement optional query parameters where applicable
* [ ] **Optional**: Implement CLI version?
* [ ] **Optional**: Run some code quality tools once this gets close

## Before using

* Install `ruby` :smiley:
* Clone this repository
* Get your API key from Giphy

## Using

* Initialize the class with your API key:
  * `client = Giphit.new('YOUR KEY HERE')`
* **`Giphit#random`**
  * Returns an `OpenStruct`:
    * `#page_url`
    * `#image_url`
* **`Giphit#search(q)`** (where `q` is your search term)
  * Returns a Hash of JSON objects representing your search results.