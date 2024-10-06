
# library(biomaRt)
# library(rentrez)
# library(png)
# install.packages("GeSciLiVis")
library("GeSciLiVis")

gene_list_mouse <- c("Vangl2",
                     "Extl3",
                     "Ext2",
                     "B3gat3",
                     "Ndst1",
                     "Hs6st2",
                     "Lipc",
                     "Ndst2",
                     "Ndst3",
                     "Ndst4",
                     "Xylt2",
                     "Hs3st5",
                     "Glce",
                     "Hs6st3",
                     "Hs6st1",
                     "Hs3st1",
                     "Ext1",
                     "Hs2st1",
                     "Slc35d2",
                     "mHS6ST2/iso:3",
                     "Ugdh",
                     "Hs3st3a1",
                     "Hs3st3b1",
                     "Hs3st2",
                     "Hs3st4",
                     "Hs3st6",
                     "Extl1",
                     "Xylt1"
)

keyword_list1 <- c("Heparan sulfate")

pub_activity_plot(g_list = gene_list_mouse, k_list = keyword_list1, species = "mouse",output_dir = "DSbiosynth_KWDS")

