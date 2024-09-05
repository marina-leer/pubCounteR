
# GeSciLiVis - Gene-based scientific literature visualiser 
 
 <!-- badges -->
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) 
[![](https://www.r-pkg.org/badges/version/GeSciLiVis?color=orange)](https://cran.r-project.org/package=GeSciLiVis)
[![metacran downloads](https://cranlogs.r-pkg.org/badges/grand-total/GeSciLiVis)](https://cranlogs.r-pkg.org/badges/grand-total/GeSciLiVis)
[![metacran downloads](https://cranlogs.r-pkg.org/badges/last-month/GeSciLiVis)](https://cran.r-project.org/package=GeSciLiVis)
![](https://tokei.rs/b1/github/marina-leer/GeSciLiVis)
![GitHub commits](https://img.shields.io/github/commit-activity/m/marina-leer/GeSciLiVis)


<p align="justify">
The concept for an interface-based bioinformatical tool that can routinely and reliably perform multi-gene high-throughput, biological context-based literature database interrogation. The tool stems from the need to efficiently assess a large number of differentially expressed (DE) genes to allow rapid evaluation of targets for further research. GeSciLiVis thus enables a simultaneous screen for multiple genes of interest in Pubmed (www.PubMed.gov; Lu et al. 2011), and a quick but thorough overview of the related publication activity linking individual candidate genes and a customised research area or topic.
</p>

<p align="justify">
For a set of genes, using official gene symbols (Maltais et al. 2002) belonging to the human or murine genome, such as those derived from differential expression analysis in RNA-seq datasets, and a defined set of keywords that is biologically-driven and represents a specific area of research, the algorithm constructs a query separately for each gene, and uses the R-package rentrez (Winter, 2017) to access NCBI’s PubMed database (www.PubMed.gov; Lu et al. 2011) and its search functions. 
</p>

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/figures/Picture1a.png>
</p>

<p align="justify">
The returned hits, i.e. publications, are summarised for each gene separately and represented as a publication activity for as many as 50 genes. This will result in a barplot visualisation, that displays for every gene of interest the number of the detected publication activity, and exports the most recent individual 100 publications per gene in a csv file format.
</p>

<p align="justify">
Thus, we present a novel literature identification strategy that quickly surveys the published literature available research on entire gene lists, for individual genes, in conjunction with a specific biological interest. This allows investigators to identify gaps in knowledge through little-researched genes that could be putative novel targets for diverse biological fields of research, and to deliver an accurate overview and the most recent related work for any list of genes of interest. 
</p>

## Statement of need
<p align="justify">
Presently, there is a lack of high-throughput literature survey methods or software to assess publication activity simultaneously for entire experimentally-derived gene sets in specific biological contexts user-defined a priori. The National Center for Biotechnology Information (NCBI) offers a website (https://www.ncbi.nlm.nih.gov/) featuring search modes that use an Advanced Search Builder interface [1]. Current literature analysis tools for gene sets predominantly utilize NCBI’s PubMed database to analyse publication trends per year [2], publications per gene [3], or per gene frequency in published gene sets for functional predictions [4], among others. Gene sets are usually associated with biological processes or pathways using Gene Ontology (GO) [5], or similar systems. For translational approaches, platforms including the Medical Subject Headings (MeSH) are used to predict gene-disease associations [6]. However, literature surveys on gene sets utilising particular terms that are poorly annotated in existing platforms (e.g. GO, MeSH), are typically performed manually, impractical and time-consuming. As modern Omics approaches generate an increasing wealth of available data that entail gene lists in various contexts (for instance: differentially expressed or co-expressed genes, enriched gene set in regulatory networks, ontologies or pathways), novel user-friendly tools are needed to enable the rapid assessment of gene lists and published information content. 
</p>

## Getting started


### Installation

Installation of the development version from GitHub:
```r
if (!requireNamespace("devtools", quietly = TRUE)) {
    install.packages("devtools")}
	
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

## Manual test for the validation of biological context computation
To validate the accuracy and utility of GeSciLiVis in identifying published literature in connection to defined gene-related biological search terms, we used as a reference the biological content information organized by the GO system {Michael Ashburner, 2000 #1503;Gene Ontology, 2023 #1501}. The GO tool currently includes gene-related biological information based on experimental findings from >150,000 peer-reviewed studies, corresponding to ~700,000 experimentally-supported annotations and >6,000,000 inferred functional annotations across >5,000 species {Michael Ashburner, 2000 #1503;Gene Ontology, 2023 #1501}. 
Using the mouse (Mus musculus) as an example species, which currently contains >160,000 experimentally-supported annotations {Michael Ashburner, 2000 #1503;Gene Ontology, 2023 #1501}, we first tested four separate sets of genes, each set representing one of four discrete GO terms (GO:0030206, GO:0030208, GO:0015012, GO:0018146) due to divergent biosynthetic processes and related encoding genes (Figure 2A). These selected four terms share a parent node (GO:0009059), indicating that although the biosynthetic processes are distinct, they belong to the same macromolecule biosynthetic class and thus are functionally related regarding their underlying biology (Figure 2A). This discrete but also shared node connectivity of the selected four gene sets represents a typical hierarchy of relations in the GO system {Michael Ashburner, 2000 #1503;Gene Ontology, 2023 #1501}, making this an exemplary test for validating the accuracy of the functionality of GeSciLiVis through GO-organised, gene-related publications. For interrogation of existing literature based on selected keyword search terms, we input search terms that reflected the defined biological annotation of the gene lists by the GO tool, thereby matching the biological content of GO-organized genes to that of the search terms. Examination of the GeSciLiVis-computed publication activity demonstrated both the accuracy and specificity of GeSciLiVis, as the input search terms robustly reflected the biological content information organized in the GO tool (Figure 2B). Moreover, statistically significant results were observed independent of the length of gene lists, from GO terms represented by longer lists (GO:0015012, represented by 28 genes), to short gene lists represented by as few as three (GO:0030208) or four (GO:0018146) individual genes (Figure 2B). Thus, GeSciLiVis accurately computes the gene-specific biological content for entire input gene lists and reliably matches this content to the biological context provided as an input search term, thereby computing and summarizing with high precision the publication activity for gene sets to reflect existing biological knowledge.

<!--- Figure 2: GeSciLiVis reliably computes and summarizes publication activity for gene sets that reflect existing biological knowledge
(A) Node connectivity of four selected gene sets representing a typical hierarchy of relations in the GO system. The GO identifier, number of genes in the term (shown in brackets), and term title are shown. (B) Examination of the GeSciLiVis-computed publication activity summation across GO-organized gene lists. The same four search terms were used as input across the four GO gene lists, representing a total of four independent GeSciLiVis literature interrogations per GO term, or sixteen in total. Bars represent average numbers of GeSciLiVis-computed articles as mean ± SEM summarizing all respective genes in each list, Mann-Whitney-U test with Bonferroni correction; statistical significance are *p< 0.01; **p< 0.001; and ***p< 0.0001. 
-->

</p>

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/figures/Picture2a.png>
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/figures/Picture2b.png>

</p>



## Confirmation of quantitative precision in research activity computation
The precision of GeSciLiVis in computing research activity for input gene lists was further verified using a gene expression dataset from our previously published study {Ambrosi, 2017 #133}. The data were obtained in experiments comparing the transcriptomic signatures of defined stem and progenitor cell populations occurring in bone tissue that were measured by RNA-sequencing. Specifically, a subset of bone-resident multipotent mesenchymal stromal cells (MSC) was compared to its cellular progeny, as it can produce daughter cells either committed to undergo differentiation into bone cells (osteogenic progenitor cells; OPC) or fat cells (adipogenic progenitor cells; APC). DEGs enriched in one of the three cell types were initially derived from cell populations as determined by statistical significance (p value < 0.05). These subpopulation-defining marker genes were separated by manual literature search into two categories, corresponding to (i) established marker genes that are well-documented in the published literature on stem cells, and (ii) novel marker genes which show little, if any, publication activity related to stem cells {Ambrosi, 2017 #133} (Supplementary Table 1). <br>
To validate the publication activity through GeSciLiVis, these lists of marker genes were used as input data and the number of identified articles per gene were summarized to compare established gene- and novel gene-related publication activities in an unbiased manner. A biologically defined keyword set was used as co-input, referring to the original area of research from which the dataset was derived, i.e. “stem cell biology” of bone-resident cells (Supplementary Table 2). Genes previously annotated as established marker genes in the reference dataset {Ambrosi, 2017 #133} displayed higher publication activity when compared to the novel marker gene category, confirming the ability of our tool to identify established genes through a higher published literature content (Figure 3A). In contrast, genes previously annotated manually as novel markers consistently showed a significantly lower publication activity for all three cell types (Figure 3A-B). 

<!--- Figure 3. GeSciLiVis effectively recapitulates the manual assessment of research activities for individual candidate gene entries. (A) Average number of publications per gene from a validation of publication activity by GeSciLiVis. Differentially expressed marker genes of three defined stem and progenitor cell populations as previously identified were used {Ambrosi, 2017 #133}. A 10-keyword set referring to the research area “Stem Cell Biology” was generated and two lists containing either established or novel marker genes of multipotent mesenchymal stromal cells (MSC), osteogenic (OPC), or adipogenic progenitor cells (APC) were entered (individual genes and keyword set: Supplementary Tables 1 and 2). Bars represent average number of GeSciLiVis-computed articles as mean ± SEM summarizing all respective genes in each list, Mann-Whitney-U test with Bonferroni correction; * < 0.01 ** < 0.001 *** < 0.0001. (B) Output plots visualize publication activity in number of publications in logarithmic scale and shown separately for established markers (23 genes; left panel) and novel markers (42 genes; right panel) of OPCs as published in {Ambrosi, 2017 #133}. This illustrative GeSciLiVis output plot for the two gene lists (novel and established) from OPCs is accompanied by output examples of the most recent 100 publications for the two OPC gene lists in CSV format in Supplementary Files 1 and 2 respectively.  -->

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/figures/Picture3a.png>
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/figures/Picture3b.png>
</p>


## Execution time and input size 
Lastly, the runtime of GeSciLiVis was found to scale linearly with input size (number of entry genes; Figure 4A), and search duration was elevated when genes with high publication activity were entered (Figure 4B). Therefore, GeSciLiVis detects with quantitative precision the published gene-specific context-based research activity, thereby providing a dependable depiction of the existing volume of publication activity for input gene sets in relation to the user-defined biological context.

<p align="center">
  <img src=https://github.com/marina-leer/GeSciLiVis/blob/main/figures/Picture4ab.png>
</p>
<!--- Figure 4. -->

**Effect of input size parameters on runtime (in seconds) of a GeSciLiVis analysis.** (A) Effect of number of genes as an input size parameter, independent of established or novel gene characterisation. (B) Effect of number of genes as an input size parameter, shown separately for established genes and novel genes. Solid lines connect the individual data points, dotted lines represent the respective best fit lines from linear regression fits, grey error bars represent the 95% confidence intervals, y represents the slope, R2 is the coefficient of determination, and the p-value represents a two-tailed test of the null hypothesis that the slopes are identical.

## Supplementary information

[**Supplementary Table 1.**](https://github.com/marina-leer/GeSciLiVis/blob/main/supplementary) 
Cell type-specific marker gene lists. Supplementary Table 2. Keyword set example for biological context definition.

[**Supplementary File 1.**](https://github.com/marina-leer/GeSciLiVis/blob/main/supplementary) 
Example of an excel output file for established OPC markers, listing the top ≤ 100 publications (by PMID and title) for each of the interrogated genes.

[**Supplementary File 2.**](https://github.com/marina-leer/GeSciLiVis/blob/main/supplementary) 
Example of an excel output file for novel OPC markers, listing the top ≤ 100 publications (by PMID and title) for each of the interrogated genes.

## License
The GeSciLiVis software has a GPLv3 LICENSE.

## References
<p align="justify">
1. Fatehi F, Gray LC, Wootton R: How to improve your PubMed/MEDLINE searches: 3. advanced searching, MeSH and My NCBI. J Telemed Telecare 2014, 20(2):102-112.<br>
<br>
2. Serrano Najera G, Narganes Carlon D, Crowther DJ: TrendyGenes, a computational pipeline for the detection of literature trends in academia and drug discovery. Sci Rep 2021, 11(1):15747.<br>
<br>
3. von Mering C, Jensen LJ, Snel B, Hooper SD, Krupp M, Foglierini M, Jouffre N, Huynen MA, Bork P: STRING: known and predicted protein-protein associations, integrated and transferred across organisms. Nucleic Acids Res 2005,33(Database issue):D433-437.<br>
<br>
4. Clarke DJB, Marino GB, Deng EZ, Xie Z, Evangelista JE, Ma'ayan A: Rummagene: massive mining of gene sets from supporting materials of biomedical research publications. Commun Biol 2024, 7(1):482.<br>
<br>
5. Gene Ontology C, Aleksander SA, Balhoff J, Carbon S, Cherry JM, Drabkin HJ, Ebert D, Feuermann M, Gaudet P, Harris NL et al:The Gene Ontology knowledgebase in 2023.Genetics 2023, 224(1).<br>
<br>
6. Narganes-Carlon D, Crowther DJ, Pearson ER: A publication-wide association study (PWAS), historical language models to prioritise novel therapeutic drug targets. Sci Rep 2023, 13(1):8366.<br>
<br>
7. Maltais LJ, Blake JA, Chu T, Lutz CM, Eppig JT, Jackson I: Rules and guidelines for mouse gene, allele, and mutation nomenclature: a condensed version. Genomics 2002,79(4):471-474.<br>
<br>
8. Winter DJ: rentrez: An R package for the NCBI eUtils API. The R Journal 2017, 9:520-526.<br>
<br>
9. Sayers EW, Bolton EE, Brister JR, Canese K, Chan J, Comeau DC, Farrell CM, Feldgarden M, Fine AM, Funk K et al: Database resources of the National Center for Biotechnology Information in 2023. Nucleic Acids Res 2023, 51(D1):D29-D38.<br>
<br>
10. Maglott D, Ostell J, Pruitt KD, Tatusova T: Entrez Gene: gene-centered information at NCBI. Nucleic Acids Res 2011, 39(Database issue):D52-57.<br>
<br>
11. O'Leary NA, Wright MW, Brister JR, Ciufo S, Haddad D, McVeigh R, Rajput B, Robbertse B, Smith-White B, Ako-Adjei D et al: Reference sequence (RefSeq) database at NCBI: current status, taxonomic expansion, and functional annotation. Nucleic Acids Res 2016, 44(D1):D733-745.<br>
<br>
12. Ambrosi TH, Scialdone A, Graja A, Gohlke S, Jank AM, Bocian C, Woelk L, Fan H, Logan DW, Schurmann A et al: Adipocyte Accumulation in the Bone Marrow during Obesity and Aging Impairs Stem Cell-Based Hematopoietic and Bone Regeneration. Cell Stem Cell 2017,20(6):771-784 e776.<br>
<br>
</p>
