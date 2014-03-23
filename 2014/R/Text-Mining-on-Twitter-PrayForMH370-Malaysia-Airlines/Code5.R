library(XML)

df1 <- readHTMLTable('http://blog.kerul.net/2014/01/list-of-malay-stop-words.html')
df1 <- df1[[1]]

malaystopwords <- as.character(unlist(df1))[-c(320, 321)]
head(malaystopwords)

# OUTPUT
[1] "ada"    "adakah" "adakan" "adalah" "adanya" "adapun"
