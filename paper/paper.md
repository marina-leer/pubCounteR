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
date: 31 August 2024
bibliography: paper.bib
---

# Summary

Basic and clinical biomedical research relies heavily on modern large-scale datasets that include genomics, transcriptomics, epigenomics, metabolomics, and proteomics, among other “Omics”. These research tools very often generate lists of candidate genes that are hypothesised or shown to be responsible for the biological effect in question. To aid the interpretation of experimentally-obtained gene lists, Gene-based Scientific Literature Visualiser (GeSciLiVis), was developed as an R-package that screens publications by a user-defined set of keywords representing a specific biological context a priori, for experimentally-derived gene lists.

# Statement of need
Presently, there is a lack of high-throughput literature survey methods or software to assess publication activity simultaneously for entire experimentally-derived gene sets in specific biological contexts defined a priori. As modern Omics approaches generate an increasing wealth of available data that entail gene lists in various contexts (for instance differentially expressed or co-expressed genes, enriched gene set in regulatory networks, ontologies or pathways), novel user-friendly tools are needed to enable the rapid assessment of gene lists and published information content.
To facilitate literature searches based on the simultaneous entry of multiple genes in combination with fully customisable search terms for a defined scientific area of interest, we developed GeSciLiVis, which performs a PubMed database search and returns an annotated and quantified overview of the publication activity for each query gene in the defined search context area. GeSciLiVis can assess larger gene sets through a systematic and biological context-embedded literature overview, and reveal underlying scientific implications in novel areas. Our package aids the generation of new hypotheses, as well as the interpretation and understanding of experimentally-derived gene lists.

<!-- state of the field -->

<!-- Main overview of the tool and small example -->

# Acknowledgements

This work was supported by the German Research Foundation (DFG; project IDs 323196138 and 249509554 (FOR 2165) and within the DFG Collaborative Research Centre 1444 (CRC 1444), project no. 427826188), and grants within the German Center for Diabetes Research (DZD) funded by the German Ministry of Education and Research (BMBF) and the State of Brandenburg (DZD grant IDs 82DZD03E6G, 82DZD03C3G, and 82DZD03D03, to TJS).

# References

