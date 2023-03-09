
# GeSciLiVis - Gene-based scientific literature visualiser 
 
 <!-- badges -->
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) 
 
<p align="justify">
The concept for an interface-based bioinformatical tool that can routinely and reliably perform multi-gene high-throughput, biological context-based literature database interrogation. Tool stems the need to efficiently assess a large number of differentially expressed (DE) genes to allow rapid evaluation of targets for further research. GeSciLiVis thus enables a simultaneous screen for multiple genes of interest in Pubmed (www.PubMed.gov; Lu et al. 2011), and a quick but thorough overview of the related publication activity linking individual candidate genes and a customised research area or topic.
</p>

<p align="justify">
For a set of genes, using official gene symbols (Maltais et al. 2002) belonging to the human or murine genome, such as those derived from differential expression analysis in RNA-seq datasets, and a defined set of keywords that is biologically-driven and represents a specific area of research, the algorithm constructs a query separately for each gene, and uses the R-package rentrez (Winter, 2017) to access NCBI’s PubMed database (www.PubMed.gov; Lu et al. 2011) and its search functions. 
</p>

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/vignettes/test_figure.png>
</p>

<p align="justify">
The returned hits, i.e. publications, are summarised for each gene separately and represented as a publication activity for as many as 50 genes. This will result in a barplot visualisation, that displays for every gene of interest the number of the detected publication activity, and exports the most recent individual 100 publications per gene in a csv file format.
</p>

<p align="justify">
Thus, we present a novel literature identification strategy that quickly surveys the published literature available research on entire gene lists, for individual genes, in conjunction with a specific biological interest. This allows investigators to identify gaps in knowledge through little-researched genes that could be putative novel targets for diverse biological fields of research, and to deliver an accurate overview and the most recent related work for any list of genes of interest. 
</p>


### References
<p align="justify">
Maglott, D. et al. (2005) Entrez Gene: gene-centered information at NCBI. Nucleic acids research, 2005, 33. Jg., Nr. suppl_1, S. D54-D58 <br>
Maltais, L. J. et al. (2002) Rules and guidelines for mouse gene, allele, and mutation nomenclature: a condensed version. Genomics, 4.79, 471-474 <br>
Sayers, E.W. et al. (2010) Database resources of the National Center for Biotechnology Information. Nucleic Acids Res. 39. suppl_1, D38-D51 <br>
Winter, D. J. (2017). rentrez: An R package for the NCBI eUtils API. The R Journal. 2017;9:520-6 <br>
<br>
</p>

## Getting started


### Installation

Installation of the development version from GitHub:
```r
if (!requireNamespace("devtools", quietly = TRUE)) {
    install.packages("devtools")
}
install_github("marina-leer/GeSciLiVis")
devtools::install_github("marina-leer/GeSciLiVis")
```

### Requirements
GeSciLiVis requires the following external dependencies (R packages):
- rentrez (>= 1.2.3)
- biomaRt (>= 2.54.0)
- biomartr (>= 1.0.2)
- grDevices (>= 4.2.2)
- graphics (>= 4.2.2)
- utils (>= 4.2.2)
Depends:
- R (>= 2.10)

### Usage
```
pub_activity_plot(
g_list,
k_list,
species = "mouse",
output_dir = "output",
use_preloaded_gene_names=TRUE,
show_progressbar = FALSE
)

```

### Parameters
-  information on the purpose and values of all optional parameters
```
k_list: list of keywords ≤ 10 elements
g_list: list of official gene symbols ≤ 30 elements
species: selecting the species of interest, species="mouse" or species="human"
output_dir: path to output directory to save resulting csv and png, NULL for not saving.
use_preloaded_gene_names: boolean: whether to use preloaded gene names (TRUE) or load from biomaRt (FALSE)
show_progressbar: boolean: whether to show progress bar
```
<br>

## Example

```r 
library(GeSciLiVis)
```

In this example, we use a list of exemplary genes that could represent a differentially expressed gene (DEG) list, and an illustrative keyword set defining the specific area of biological interest for these genes, comprising of the terms “mesenchymal stem cell”, “multipotent stem cell”, “skeletal stem cell”, “stem cell”, “progenitor cell”. 

<table class="tg">
  <tr>
    <th class="tg-031e">Keywordset</th>
    <th class="tg-031e">mesenchymal stem cell, multipotent stem cell, skeletal stem cell, stem cell, progenitor cell</th>
  </tr>
</table>



```r
keyword_list = c("mesenchymal stem cell", "multipotent stem cell", "skeletal stem cell", "stem cell", "progenitor cell")
```

The gene list and the keyword set are used as input to derive publication activity for these genes in the specific field of interest.

In the first example a set of genes derived from mouse experiments were used.

<br>
<table class="tg">
  <tr>
    <th class="tg-031e">Gene list (mouse)</th>
    <th class="tg-031e">Cxcl12, Fos, Lect1, Lepr, Vcam1, Fosb</th>
  </tr>
</table>

```r
gene_list_mouse  = c("Cxcl12", "Fos", "Lect1", "Lepr", "Vcam1", "Fosb")

pub_activity_plot(g_list = gene_list_mouse, k_list = keyword_list, species = "mouse", output_dir="output", use_preloaded_gene_names=TRUE)
```
<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/vignettes/Example_1_mouse.png>
</p>


In the second example a set of human genes were used as input.


<br>
<table class="tg">
  <tr>
    <th class="tg-031e">Gene list (human)</th>
    <th class="tg-031e">LEPR, KITL, OSMR, IL1RN, FGF2, COL2A1</th>
  </tr>
</table>


```r
gene_list_human = c("LEPR", "KITL", "OSMR", "IL1RN", "FGF2", "COL2A1")

pub_activity_plot(gene_list_human, keyword_list, "human", output_dir="output", use_preloaded_gene_names=TRUE)
```

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/vignettes/Example_2_human.png>
</p>

## License
The GeSciLiVis software has a GPLv3 LICENSE.


