tdm = TermDocumentMatrix(
  mh370_corpus,
  control = list(
    removePunctuation = TRUE,
    stopwords = c("prayformh370", "prayformh", malaystopwords, stopwords("english")),
    removeNumbers = TRUE, tolower = TRUE)
    )

m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing = TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word = names(word_freqs), freq = word_freqs)

wordcloud(dm$word, dm$freq, random.order = FALSE, colors = brewer.pal(8, "Dark2"))
