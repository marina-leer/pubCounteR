
# pubCounteR: an R package for interrogating published literature for experimentally-derived gene lists within a user-defined biological context
 
 <!-- badges -->
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) 
[![](https://www.r-pkg.org/badges/version/GeSciLiVis?color=orange)](https://cran.r-project.org/package=GeSciLiVis)
[![metacran downloads](https://cranlogs.r-pkg.org/badges/grand-total/GeSciLiVis)](https://cranlogs.r-pkg.org/badges/grand-total/GeSciLiVis)
![](https://tokei.rs/b1/github/marina-leer/GeSciLiVis)
![GitHub commits](https://img.shields.io/github/commit-activity/m/marina-leer/GeSciLiVis)


<p align="justify">
The concept for an interface-based bioinformatical tool that can routinely and reliably perform multi-gene high-throughput, biological context-based literature database interrogation. The tool stems from the need to efficiently assess a large number of differentially expressed (DE) genes to allow rapid evaluation of targets for further research. GeSciLiVis thus enables a simultaneous screen for multiple genes of interest in Pubmed (www.PubMed.gov; Lu et al. 2011), and a quick but thorough overview of the related publication activity linking individual candidate genes and a customised research area or topic.<br>
<br>
For a set of genes, using official gene symbols (Maltais et al. 2002) belonging to the human or murine genome, such as those derived from differential expression analysis in RNA-seq datasets, and a defined set of keywords that is biologically-driven and represents a specific area of research, the algorithm constructs a query separately for each gene, and uses the R-package rentrez (Winter, 2017) to access NCBI’s PubMed database (www.PubMed.gov; Lu et al. 2011) and its search functions. The returned hits, i.e. publications, are summarised for each gene separately and represented as a publication activity for as many as 50 genes. This will result in a barplot visualisation, that displays for every gene of interest the number of the detected publication activity, and exports the most recent individual 100 publications per gene in a csv file format.
</p>

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/figures/Picture1a.png>
</p>

**Figure 1. Schematic overview of GeSciLiVis’ processing workflow.** GeSciLiVis runs a rentrez-query based on all sets of keywords/search terms and each gene entered in a gene list. The R-package then uses the access to NCBI’s PubMed database via a Representational State Transfer Application Programming Interface (REST API). Computing the summation over the publication activity, GeSciLiVis visualises for every gene of interest the number of detected publications, ranked by publication numbers in a bar plot.

<p align="justify">
Thus, we present a novel literature identification strategy that quickly surveys the published literature available research on entire gene lists, for individual genes, in conjunction with a specific biological interest. This allows investigators to identify gaps in knowledge through little-researched genes that could be putative novel targets for diverse biological fields of research, and to deliver an accurate overview and the most recent related work for any list of genes of interest. 
</p>

### Statement of need
<p align="justify">
Presently, there is a lack of high-throughput literature survey methods or software to assess publication activity simultaneously for entire experimentally-derived gene sets in specific biological contexts user-defined a priori. The National Center for Biotechnology Information (NCBI) offers a website (https://www.ncbi.nlm.nih.gov/) featuring search modes that use an Advanced Search Builder interface (Fatehi et al. 2014). Current literature analysis tools for gene sets predominantly utilize NCBI’s PubMed database to analyse publication trends per year (Serrano Najera et al. 2021), publications per gene (von Mering et al. 2005), or per gene frequency in published gene sets for functional predictions (Clarke et al. 2024), among others. Gene sets are usually associated with biological processes or pathways using Gene Ontology (GO) (Gene Ontology Concortium et al. 2023), or similar systems. For translational approaches, platforms including the Medical Subject Headings (MeSH) are used to predict gene-disease associations (Narganes-Carlon et al. 2023). However, literature surveys on gene sets utilising particular terms that are poorly annotated in existing platforms (e.g. GO, MeSH), are typically performed manually, impractical and time-consuming. As modern Omics approaches generate an increasing wealth of available data that entail gene lists in various contexts (for instance: differentially expressed or co-expressed genes, enriched gene set in regulatory networks, ontologies or pathways), novel user-friendly tools are needed to enable the rapid assessment of gene lists and published information content. 
</p>

## Getting started


### Installation

Installation of the development version from GitHub:
```r
if (!requireNamespace("devtools", quietly = TRUE)) {
    install.packages("devtools")}
	
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

pub_activity_plot(
g_list,
k_list,
species = "mouse",
output_dir = "output",
use_preloaded_gene_names=TRUE,
show_progressbar = FALSE
)


### Parameters
-  information on the purpose and values of all optional parameters

k_list: list of keywords ≤ 10 elements
g_list: list of official gene symbols ≤ 50 elements
species: selecting the species of interest, species="mouse" or species="human"
output_dir: path to output directory to save resulting csv and png, NULL for not saving.
use_preloaded_gene_names: boolean: whether to use preloaded gene names (TRUE) or load from biomaRt (FALSE)
show_progressbar: boolean: whether to show progress bar

<br>

## Example

```r 
library(GeSciLiVis)
```

<p align="justify">
In this example, we use a list of exemplary genes that could represent a differentially expressed gene (DEG) list, and an illustrative keyword set defining the specific area of biological interest for these genes, comprising of the terms “mesenchymal stem cell”, “multipotent stem cell”, “skeletal stem cell”, “stem cell”, “progenitor cell”. 
</p>

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

<p align="justify">
Performing the search will return a visualisation that shows the publication activity per gene for all instances of co-occurence per gene with one or more of the search terms. Per gene publication counts are displayed as a linear and logarithmic barchart, and ranked from high to low counts, as shown below for this example. 
</p>

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/vignettes/Example_1_1_output_mouse.png>
</p>


<p align="justify">
Once the search is complete, an output folder is created in the working directory, which includes the visualisation plot as a png file, and a csv file which contains the top 100 most recent publications per gene by PubMedID and title, sorted by date from most to least recent.
</p>

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/vignettes/Example_1_2_output_mouse.PNG>
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
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/vignettes/Example_2_1_output_human.png>
</p>

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/vignettes/Example_2_2_output__human.PNG>
</p>


## License
The GeSciLiVis software has a GPLv3 LICENSE.

## References
<p align="justify">
1.	Lu Z: PubMed and beyond: a survey of web tools for searching biomedical literature. Database (Oxford) 2011, 2011:baq036.<br>
<br>
2.	Maltais LJ, Blake JA, Chu T, Lutz CM, Eppig JT, Jackson I: Rules and guidelines for mouse gene, allele, and mutation nomenclature: a condensed version. Genomics 2002, 79(4):471-474.<br>
<br>
3.	Winter DJ: rentrez: An R package for the NCBI eUtils API. The R Journal 2017, 9:520-526.<br>
<br>
4.	Fatehi F, Gray LC, Wootton R: How to improve your PubMed/MEDLINE searches: 3. advanced searching, MeSH and My NCBI. J Telemed Telecare 2014, 20(2):102-112.<br>
<br>
5.	Serrano Najera G, Narganes Carlon D, Crowther DJ: TrendyGenes, a computational pipeline for the detection of literature trends in academia and drug discovery. Sci Rep 2021, 11(1):15747.<br>
<br>
6.	von Mering C, Jensen LJ, Snel B, Hooper SD, Krupp M, Foglierini M, Jouffre N, Huynen MA, Bork P: STRING: known and predicted protein-protein associations, integrated and transferred across organisms. Nucleic Acids Res 2005, 33(Database issue):D433-437.<br>
<br>
7.	Clarke DJB, Marino GB, Deng EZ, Xie Z, Evangelista JE, Ma'ayan A: Rummagene: massive mining of gene sets from supporting materials of biomedical research publications. Commun Biol 2024, 7(1):482.<br>
<br>
8.	Gene Ontology C, Aleksander SA, Balhoff J, Carbon S, Cherry JM, Drabkin HJ, Ebert D, Feuermann M, Gaudet P, Harris NL et al: The Gene Ontology knowledgebase in 2023. Genetics 2023, 224(1).<br>
<br>
9.	Narganes-Carlon D, Crowther DJ, Pearson ER: A publication-wide association study (PWAS), historical language models to prioritise novel therapeutic drug targets. Sci Rep 2023, 13(1):8366.<br>
<br>
10.	Michael Ashburner CAB, Judith A. Blake, David Botstein, Heather Butler, J. Michael Cherry, Allan P. Davis, Kara Dolinski, Selina S. Dwight, Janan T. Eppig, Midori A. Harris, David P. Hill, Laurie Issel-Tarver, Andrew Kasarskis, Suzanna Lewis, John C. Matese, Joel E. Richardson, Martin Ringwald, Gerald M. Rubin & Gavin Sherlock Gene Ontology: tool for the unification of biology. Nature Genetics 2000, 25:25-29.<br>
<br>
11.	Ambrosi TH, Scialdone A, Graja A, Gohlke S, Jank AM, Bocian C, Woelk L, Fan H, Logan DW, Schurmann A et al: Adipocyte Accumulation in the Bone Marrow during Obesity and Aging Impairs Stem Cell-Based Hematopoietic and Bone Regeneration. Cell Stem Cell 2017, 20(6):771-784 e776.<br>
<br>
</p>
