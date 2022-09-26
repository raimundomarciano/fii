require(rvest)
require(httr)
require(dplyr)
require(stringr)

# each of the urls below was manually collected from CVM Open Data Portal
# https://dados.cvm.gov.br/dataset/?groups=fundos-de-investimento-imobiliarios
fii_df_url <- "https://dados.cvm.gov.br/dados/FII/DOC/DFIN/DADOS/" 
fii_ifanual_url <- "https://dados.cvm.gov.br/dados/FII/DOC/INF_ANUAL/DADOS/"
fii_ifmensal_url <- "https://dados.cvm.gov.br/dados/FII/DOC/INF_MENSAL/DADOS/"
fii_iftrim_url <- "https://dados.cvm.gov.br/dados/FII/DOC/INF_TRIMESTRAL/DADOS/"

# vector will all urls
url <-    c(fii_df_url, fii_ifanual_url, fii_iftrim_url, fii_ifmensal_url)

# create downloads folder if it does not exist
if (!"./downloads" %in% list.dirs()) dir.create('downloads')


# scrape each url, getting its html info
for (url in url){
  txt <- httr::GET(url)
  html <- read_html(txt)
  # what matters is the content of the 'href' attribute
  links <- html %>% html_nodes("a") %>% html_attr("href")
  # corce into a dataframe
  links <- as.data.frame(links, stringsAsFactors=FALSE)
  
  # determine the kind of download to do
  links2 <- unlist(c(links))  # easier to stringr-r
  # identify lines with years
  links2 <- str_extract(string = links2, pattern = '.+[0-9]+')
  # get rid of NA's, then get the first row
  links2 <- links2[!is.na(links2)][1]
  # get only the first characteres
  links2 <- substr(links2, 1,7)
  # remove rows that do not contain 'links2'
  links <- dplyr::filter(links, grepl(links2, links, ignore.case = TRUE))
  
  # construct the full url
  full_url = paste0(url, links$links)
  
  # the loop goes through each link, verifies if the file is in the
  # folder and if it is not, then it begins the download
  cache <- list.files('downloads/')
  for (i in 1:length(full_url)){
    if (basename(full_url[i]) %in% cache){next
    } else {
      print(basename(full_url[i]))
      url = full_url[i]
      download.file(url, destfile = paste0("downloads/",basename(full_url[i])),
                    method = "libcurl", mode = "wb")
    }
  }
}


unzip_files <- function(){
  # unzips all files
  files <- list.files('downloads/')
  for (file in files){
    if(grepl("zip$", file)) unzip(paste0('downloads/',file), exdir = 'sheets')
  }
}

unzip_files()


move_csv <- function(){
  # moves csv from Downloads to Sheets
  files <- list.files('downloads/')
  for (f in files) {
    if(grepl("csv$", f)){
    file.rename( from = file.path("./downloads/", f) ,
                 to = file.path("./sheets/", f) )
    }
  }
    
    
}

move_csv()
