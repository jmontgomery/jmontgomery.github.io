# Run this code to compile the book! Make sure you set the correct working directory (should be the same wd with all the Rmd files)
# NOTE: there will be a warning about one Rmd file missing a first-level heading, ignore it as it is for the index

library("bookdown")
setwd("~/Github/jmontgomery.github.io")
setwd("~/Documents/jmontgomery.github.io/MarkdownFiles")

?render_book
bookdown::render_book(input="index.Rmd", output_dir="~/Github/jmontgomery.github.io/PS363Coursebook")

