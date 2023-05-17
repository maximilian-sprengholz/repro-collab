####################################################################################################
# 
#     0 -- Example Master File
# 
#     Maximilian Sprengholz / maximilian.sprengholz@hu-berlin.de
# 
####################################################################################################

# settings
set.seed(1234)

# data
df <- read.csv(paste0(wd, "/data/raw/mtcars.csv"))

# make plot
ggplot(df, aes(x = mpg)) + geom_histogram(binwidth = 5)
ggsave(paste0(wd, "/results/figures/r_hist_mpg.pdf"), device="pdf", width=14, height=8, unit="cm")

# make latex table
stargazer(
    df[ , c("mpg", "hp", "cyl")], 
    type = "text", 
    summary.stat = c("n", "mean", "sd", "min", "max"),
    out = paste0(wd, "/results/tables/r_sumstats.tex"),
    float = FALSE
)