
# library(biomaRt)
# library(rentrez)
# library(png)
# install.packages("GeSciLiVis")
library("GeSciLiVis")

gene_list_mouse <- c("Chst7",
                     "Chst13",
                     "Slc35d1",
                     "Chsy3",
                     "Slc35b2",
                     "Csgalnact2",
                     "Chst12",
                     "Chpf2",
                     "Chst3",
                     "Csgalnact1",
                     "Chst11",
                     "Chsy1",
                     "Ugdh",
                     "Chpf",
                     "Xylt1"
)

keyword_list1 <- c("Heparan sulfate")

pub_activity_plot(g_list = gene_list_mouse, k_list = keyword_list1, species = "mouse",output_dir = "DSbiosynth_KWDS")

