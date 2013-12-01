shinyUI(pageWithSidebar(
  headerPanel(title = ""),
  sidebarPanel(
    conditionalPanel(
      condition = "input.tab == 1 || input.tab == 2 || input.tab == 6",
      wellPanel(
        strong("MODEL ORDER OF SIMULATED SERIES"),br(),br(),
        sliderInput(
          inputId = "ar",
          label = "Autoregressive",
          min = 0,
          max = 2,
          value = 1),
        sliderInput(
          inputId = "df",
          label = "Differencing",
          value = 1,
          min = 0,
          max = 2),
        sliderInput(
          inputId = "ma",
          label = "Moving-Average",
          min = 0,
          max = 2,
          value = 0)),
      wellPanel(
        HTML('<p><center><img src="http://spark.rstudio.com:8787/files/ShinyApps/arima/awsr.png" width = "45%"/>
             <br/><br/><b><a href="http://alstatr.blogspot.com/" target = "_blank">Analysis with Programming</a></b>
             <a href="https://www.facebook.com/pages/Analysis-with-Programming/145193032232528"
             target = "_blank">Facebook</a><b>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</b>
             <a href="https://plus.google.com/b/113399232174536016748/+AlstatrBlogspot/posts"
             target = "_blank">Google+</a><br/><br/>Al-Ahmadgaid Asaad<br/><a 
             href="https://twitter.com/alstated"
             target = "_blank">@alstated</a></center></p>'))
        ),
    conditionalPanel(
      condition = "input.tab == 3 || input.tab == 4 || input.tab == 5",
      wellPanel(
        strong("ORDER OF IDENTIFIED MODEL"),
        br(),br(),
        sliderInput(
          inputId = "arest",
          label = "Autoregressive",
          value = 1,
          min = 0,
          max = 5),
        sliderInput(
          inputId = "dfest",
          label = "Differencing",
          value =1 ,
          min = 0,
          max = 2),
        sliderInput(
          inputId = "maest",
          label = "Moving-Average",
          value = 0,
          min = 0,
          max = 5),br(),
        checkboxInput(inputId = "con",
                      label = "With Intercept?",
                      value = FALSE),
        helpText("If the order of differencing is 1 or 2, then the intercept is 
                 ignored in the model.")),
      conditionalPanel(
        condition = "input.tab == 4", 
        wellPanel(
          radioButtons(
            inputId = "yaxis",
            label = strong("HISTOGRAM"),
            choices = c("Count" = 1,
                        "Density" = 2),
            selected = "Count"),
          sliderInput(
            inputId = "bin",
            label = "Binwidth",
            min = 0.1,
            max = 4,
            value = 1),
          checkboxInput(
            inputId = "indivobs",
            labe = "Show Individual Observations",
            value = FALSE),
          conditionalPanel(
            condition="input.yaxis == 2",
            checkboxInput(
              inputId = "dens",
              label = "Show Estimated Density",
              value = FALSE)))
      ),
      wellPanel(
        HTML('<p><center><img src="http://spark.rstudio.com:8787/files/ShinyApps/arima/awsr.png" width = "45%"/>
             <br/><br/><b><a href="http://alstatr.blogspot.com/"
             target = "_blank">Analysis with Programming</a></b>
             <a href="https://www.facebook.com/pages/Analysis-with-Programming/145193032232528"
             target = "_blank">Facebook</a><b>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</b><a href="https://plus.google.com/b/113399232174536016748/+AlstatrBlogspot/posts"
             target = "_blank">Google+</a><br/><br/>Al-Ahmadgaid Asaad<br/><a 
             href="https://twitter.com/alstated"
             target = "_blank">@alstated</a></center></p>')))),
  mainPanel(
    tabsetPanel(
      id = "tab",
      tabPanel(
        title = "Historical Plot",
        plotOutput(
          outputId = "plot"), 
        withTags(
          div(
            class = "fluid-row",
            conditionalPanel(
              condition = "input.ar == 1 || input.ar == 2",
              div(
                class ="span4",
                numericInput(
                  inputId="par",
                  "First-Order AR Parameter",
                  value = 0.3,
                  min = 0.1,
                  max = 0.7)), 
              conditionalPanel(
                condition="input.ar == 2",
                div(
                  class = "span4",
                  numericInput(
                    inputId="par2",
                    "Second-Order AR Parameter",
                    value = 0.3,
                    min = 0.1,
                    max = 0.7)))),
            conditionalPanel(
              condition = "input.ma == 1 || input.ma == 2",
              div(
                class = "span4",
                numericInput(
                  inputId="pma",
                  "First-Order MA Parameter",
                  value = 0.3,
                  min = 0.1,
                  max = 0.7)),
              conditionalPanel(
                condition="input.ma==2",
                div(
                  class = "span4",
                  numericInput(
                    inputId="pma2",
                    "Second-Order MA Parameter",
                    value = 0.3,
                    min = 0.1,
                    max = 0.7))))
          )),
        value = 1),
      tabPanel(
        title = "Identification",
        helpText("Identify the model of the simulated data using the correlograms,
                 the", strong("Autocorrelation Function"), "(ACF) and the", 
                 strong("Partial Autocorrelation Function"), "(PACF).",
                 br(),br()),
        tabsetPanel(
          id = "subtab",
          tabPanel(
            title = "ACF",
            plotOutput(
              outputId = "acf"),
            value = 1),
          tabPanel(
            title = "PACF",
            plotOutput(
              outputId = "pacf"), 
            value = 2),
          tabPanel(
            title = "Differenced Series",
            helpText("Unless differencing is applied,
                     you will see nothing in this tab."),
            plotOutput(
              outputId = "h.new"), 
            value = 3)),
        checkboxInput(
          inputId="dfdat",
          label = "Apply Differencing?",
          value = FALSE),
        conditionalPanel(
          condition = "input.dfdat == true",
          selectInput(
            inputId = "dfd",
            label = "",
            choices = list(
              "First-Order" = 1, 
              "Second-Order" = 2),
            selected = "First-Order")),
        value = 2),
      tabPanel(
        title = "Estimation",
        helpText("Estimate the identified model of the simulated series.",
                 br(),br()),
        verbatimTextOutput(
          outputId = "est"),
        value = 3),
      tabPanel(
        title = "Diagnostic",
        helpText("Diagnose the model by testing the residuals for randomness."),
        br(),br(),
        withTags(
          div(
            class = "fluid-row",
            div(
              selectInput(
                inputId = "test",
                label = strong("PORTMANTEAU TEST"),
                choices = c(
                  "Box-Pierce"= "Box",
                  "Ljung-Box"= "Ljung"),
                selected = "Ljung-Box"),
              br(),br(),
              helpText(strong("HYPOTHESES:"),"from ",
                       a("Wikipedia", 
                         href="http://en.wikipedia.org/wiki/Ljung%E2%80%93Box_test", 
                         target = "_blank"), 
                       br(),
                       strong("H0:"),
                       "The data are independently distributed (i.e. the correlations in 
                       the population from which the sample is taken are 0, so that any 
                       observed correlations in the data result from randomness of the 
                       sampling process.",br(),
                       strong("H1:"),
                       "The data are not independently distributed.",br(),br(),br(),
                       strong("COMPUTATION:"),br(),
                       "The computed statistics is:",
                       textOutput(outputId = "diagx2"),
                       "The computed p-value is:",
                       textOutput(outputId = "diagpv"),br(),br(),
                       strong("DECISION:"),textOutput(outputId = "diagdc"),br(),br(),
                       strong("CONCLUSION:"),textOutput(outputId = "diagcn")
              ), class = "span5"),
            div(
              class = "span7",
              plotOutput(outputId = "resplot", height = "290px"),br(),br(),
              plotOutput(outputId = "histres", height = "290px")))),br(),br(),
        value = 4),
      tabPanel(
        title = "Forecast",
        helpText("Obtain the predicted values of the model, and plot this with the
                 original data."),br(),br(),
        plotOutput(outputId = "fitplot"),
        value = 5),
      tabPanel(
        title = "Data",
        tabsetPanel(
          tabPanel(
            title = "Jan - Jun",
            dataTableOutput(outputId = "data.table1")),
          tabPanel(
            title = "Jul - Dec",
            dataTableOutput(outputId = "data.table2"))), value = 6)
      )
    )
        )
      )
