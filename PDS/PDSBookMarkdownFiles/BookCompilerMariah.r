# Run this code to compile the book! Make sure you set the correct working directory (should be the same wd with all the Rmd files)
# NOTE: there will be a warning about one Rmd file missing a first-level heading, ignore it as it is for the index

library("bookdown")
setwd("C:/Users/maria/OneDrive/WUSTL/2019-20/PDS/jmontgomery.github.io/PDS/PDSBookMarkdownFiles")

bookdown::render_book(input="index.Rmd", output_dir="C:/Users/maria/OneDrive/WUSTL/2019-20/PDS/jmontgomery.github.io/PDS/PoliticalDataScience")
