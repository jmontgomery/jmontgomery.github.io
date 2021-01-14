
## Install from CRAN
install.packages('blogdown') 
blogdown::install_hugo()


#blogdown::new_site(theme = 'gcushen/hugo-academic')
blogdown::serve_site()

blogdown::new_post("Test Post")
