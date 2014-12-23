library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)

mh370 <- searchTwitter("#PrayForMH370", since = "2014-03-08", until = "2014-03-20", n = 1000)
mh370_text = sapply(mh370, function(x) x$getText())
mh370_corpus = Corpus(VectorSource(mh370_text))

tdm = TermDocumentMatrix(
  mh370_corpus,
  control = list(
    removePunctuation = TRUE,
    stopwords = c("prayformh370", "prayformh", stopwords("english")),
    removeNumbers = TRUE, tolower = TRUE)
    )

m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing = TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word = names(word_freqs), freq = word_freqs)

wordcloud(dm$word, dm$freq, random.order = FALSE, colors = brewer.pal(8, "Dark2"))
