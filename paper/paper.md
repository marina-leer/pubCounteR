---
title: 'Gene-based scientific literature visualiser (GeSciLiVis): an R package for interrogating published literature for experimentally-derived gene lists within a priori user-defined biological context'
tags:
  - R
  - literature search
  - publication activity
  - gene set
  - information retrieval
  - user-defined search-term
  - keyword-defined biological context

authors:
  - name: Marina Leer
    orcid: 0000-0002-8714-2807
    affiliation: "1, 2"
  - name: George A. Soultoukis
    orcid: 0000-0002-7290-1444
    affiliation: "1" 
  - name: Markus Jähnert
    affiliation: "2,3" 
  - name: Masoome Oveisi
    affiliation: "1"
  - name: Dirk Walther
    affiliation: "4"
  - name: Tim J. Schulz
    orcid: 0000-0002-8413-3972
    affiliation: "1, 2, 3, 5"
affiliations:
  - name: Department of Adipocyte Development, German Institute of Human Nutrition Potsdam-Rehbrücke, 14558 Nuthetal, Germany
    index: 1
  - name: German Center for Diabetes Research, 85764 Neuherberg, Germany
    index: 2
  - name: Department of Experimental Diabetology, German Institute of Human Nutrition Potsdam-Rehbrücke, 14558 Nuthetal, Germany
    index: 3
  - name: Max Planck Institute of Molecular Plant Physiology, 14476 Potsdam, Germany
    index: 4
  - name: Institute of Nutritional Science, University of Potsdam, Potsdam-Rehbrücke, 14558 Nuthetal, Germany
    index: 5
date: 30 September 2024
bibliography: paper.bib
---

# Summary

Basic and clinical biomedical research relies heavily on modern large-scale datasets that include genomics, transcriptomics, epigenomics, metabolomics, and proteomics, among other “Omics”. These research tools very often generate lists of candidate genes that are linked to biological questions. To aid the interpretation of experimentally-obtained gene lists, Gene-based Scientific Literature Visualiser (GeSciLiVis), was developed as an R-package that screens publications by a user-defined set of keywords representing a specific biological context a priori, for experimentally-derived gene lists.
The main algorithm of GeSciLiVis uses as input (i) a list of ≤50 DEGs in official gene symbol format (Maltais et al., 2002), which in the current implementation is confined to human (Homo sapiens) and murine (Mus musculus) genes, and (ii) an optional set of ≤10 a priori defined keyword search terms representing a biological context arranged in a hypothesis generation or biological interpretation style. The software then utilises R (version 4.0.2) and the R-package rentrez (Winter, 2017) to conduct a rentrez-search using Entrez Programming Utilities (E-utilities) (Sayers et al., 2023). This enables access to Entrez Gene (Maglott, 2011), NCBI’s database for gene-specific information, a collection of indexed information on genes from curation and automated analysis by NCBI’s Reference Sequence (RefSeq) project (O'Leary et al., 2016). RefSeq provides access to gene-specific information from the indexed title, abstract, main and supplementary text of each publication (including indexed table content and citation texts). GeSciLiVis employs the PubMed database a Representational State Transfer Application Programming Interface (REST API) to access the PubMed database, connect the record of each gene to its corresponding, distinct publications (those assigned unique PubMed identifiers, PMIDs). GeSciLiVis runs a rentrez-query based on (i) all keyword search terms (separately and combined) and (ii) each individual gene separately provided in the gene list of interest, running different iterations for each combination of these two components (Figure 1). Finally, it summarises the number of publications for each gene in an overview bar plot, ranking genes from highest to lowest publication activity (Figure 1A), and a summary table in a comma separated value (CSV) format that includes the most recent 100 PMIDs and publication titles for each published article. In an effort to limit individual search runtime, we limit the maximum candidate gene input to 50. Due to the open access structure of this software tool, users’ own preferences and needs can be applied to adapt GeSciLiVis to different search strategies. 

<p align="center">


[Figure 1](https://github.com/marina-leer/GeSciLiVis/blob/main/figures/Picture1a.png "Schematic overview of GeSciLiVis’ processing workflow: GeSciLiVis runs a rentrez-query based on all sets of keywords/search terms and each gene entered in a gene list. The R-package then uses the access to NCBI’s PubMed database via a Representational State Transfer Application Programming Interface (REST API). Computing the summation over the publication activity, GeSciLiVis visualises for every gene of interest the number of detected publications, ranked by publication numbers in a bar plot.")

<!--- Figures can be included like this:
![Caption for example figure.\label{fig:example}](figure.png)
and referenced from text using \autoref{fig:example}.
Figure sizes can be customized by adding an optional second parameter:
![Caption for example figure.](figure.png){ width=20% }

-->



# Statement of need
Presently, there is a lack of high-throughput literature survey methods or software to assess publication activity simultaneously for entire experimentally-derived gene sets in specific biological contexts user-defined a priori. The National Center for Biotechnology Information (NCBI) offers a website (https://www.ncbi.nlm.nih.gov/) featuring search modes that use an Advanced Search Builder interface [1]. Current literature analysis tools for gene sets predominantly utilize NCBI’s PubMed database to analyse publication trends per year [2], publications per gene [3], or per gene frequency in published gene sets for functional predictions [4], among others. Gene sets are usually associated with biological processes or pathways using Gene Ontology (GO) [5], or similar systems. For translational approaches, platforms including the Medical Subject Headings (MeSH) are used to predict gene-disease associations [6]. However, literature surveys on gene sets utilising particular terms that are poorly annotated in existing platforms (e.g. GO, MeSH), are typically performed manually, impractical and time-consuming. As modern Omics approaches generate an increasing wealth of available data that entail gene lists in various contexts (for instance: differentially expressed or co-expressed genes, enriched gene set in regulatory networks, ontologies or pathways), novel user-friendly tools are needed to enable the rapid assessment of gene lists and published information content.
To facilitate literature searches based on the simultaneous entry of multiple genes in combination with fully customisable search terms for a defined scientific area of interest, we developed GeSciLiVis, which performs a PubMed database search and returns an annotated and quantified overview of the publication activity for each query gene in the defined search context area. GeSciLiVis therefore combines a high-throughput gene input and flexible search terms in user-defined biological areas of interest. The software can assess larger gene sets through a systematic and biological context-embedded literature overview, and reveal underlying scientific implications in novel areas. Our package aids the generation of new hypotheses, as well as the interpretation and understanding of experimentally-derived gene lists. It further identifies gaps in specific research areas upon absence of gene associations with queried terms in published literature. In summary, GeSciLiVis’s principal value is in supporting high-throughput biological interpretations of experimentally-obtained gene sets through customisable context-embedded literature overviews.

# Acknowledgements

This work was supported by the German Research Foundation (DFG; project IDs 323196138 and 249509554 (FOR 2165) and within the DFG Collaborative Research Centre 1444 (CRC 1444), project no. 427826188), and grants within the German Center for Diabetes Research (DZD) funded by the German Ministry of Education and Research (BMBF) and the State of Brandenburg (DZD grant IDs 82DZD03E6G, 82DZD03C3G, and 82DZD03D03, to TJS).

# References

