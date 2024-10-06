
# library(biomaRt)
# library(rentrez)
# library(png)
# install.packages("GeSciLiVis")
library("GeSciLiVis")

gene_list_mouse <- c("B4galt4",
                     "Chst5",
                     "B3gnt7",
                     "Chst1"
)

keyword_list1 <- c("Dermatan sulfate")

pub_activity_plot(g_list = gene_list_mouse, k_list = keyword_list1, species = "mouse",output_dir = "DSbiosynth_KWDS")

