

# generate multifigure with linear und logarithmic barplot
# plots on the currently open device
lin_log_barplot <- function(countlist, title){
  oldpar <- par(no.readonly = TRUE)
  on.exit(par(oldpar))
  par(mfrow=c(1,2))
  bp1 <- barplot(unlist(countlist), main="linear",
                 xlab= title, horiz = TRUE,
                 names.arg=names(countlist),
                 col=c("#e0e0e0"),
                 las=1,
                 #xaxt='n',
                 cex.names = 1.2, xlim = c(0,(max(unlist(countlist))*1.3)))
  text(unlist(countlist)+10, bp1, labels = unlist(countlist), pos=4)

  x_max <- max(log10(unlist(countlist)+1))*1.3
  bp2 <- barplot(log10(unlist(countlist)+1), main="logarithmic",
                 xlab=title, horiz = TRUE,
                 names.arg=names(countlist),
                 col=c("#e0e0e0"),
                 xaxt='n',
                 las=1,
                 cex.names = 1.2, xlim = c(0,x_max))
  old <- options()
  on.exit(options(old))
  options(scipen=5)
  axis(1,at=seq(0,x_max),labels = 10^seq(0,x_max))
  text(log10(unlist(countlist)+1)+0.01, bp2, labels = unlist(countlist), pos=4)
}

#' @title Visualize the publication activity for genes
#'
#' @description
#' This function uses three input parameters, one gene list, one defined set of keywords and
#' species, to run a PubMed database search, and returns an annotated overview of a publication
#' activity plot.
#'
#' @param g_list list of official gene symbols <= 30 elements.
#' @param k_list list of keywords <= 10 elements.
#' @param species selecting the species of interest (species="mouse" or species="human").
#' @param output_dir path to output directory to save resulting csv and png, NULL for not saving.
#' @param use_preloaded_gene_names boolean: whether to use preloaded gene names (TRUE) or
#' load from biomaRt (FALSE)
#' @param show_progressbar boolean: whether to show progress bar
#' @return None
#'
#' @usage
#' pub_activity_plot(
#' g_list,
#' k_list,
#' species = "mouse",
#' output_dir = NULL,
#' use_preloaded_gene_names = TRUE,
#' show_progressbar = FALSE
#' )
#'
#' @import rentrez
#' @import biomartr
#' @import biomaRt
#' @import grDevices
#' @import graphics
#' @import utils

#' @examples
#' gene_list_mouse  = c("Mbl1")
#' keyword_list = c("stem cell")
#' pub_activity_plot(g_list = gene_list_mouse, k_list = keyword_list,
#' species = "mouse", output_dir=NULL, use_preloaded_gene_names=TRUE,
#' show_progressbar=FALSE)

# using gene list and keyword set to run pubmed search with customized query and
# generates a publication activity plot based on the results

#' @export
pub_activity_plot <- function(g_list, k_list, species="mouse",
                              output_dir=NULL, use_preloaded_gene_names=TRUE, show_progressbar=FALSE){
  # check length of input lists
  if(length(g_list) < 1) stop("Gene list has to consist of at least 1 gene")
  else if(length(g_list) > 50 && length(k_list >10)) stop("Gene list and keyword list are too long, gene list has to be < 50 elements and keyword list hast to be < 10")
  else if (length(g_list) > 50) stop("Gene list is too long, it has to be <= 50 elements")
  else if (length(k_list) > 10)  stop("Keyword list is too long, it has to be <= 10 elements")

  if(use_preloaded_gene_names){
    if(species=="mouse"){ # "Mus musculus"
      mouse_official_gene_names <-""
      data("mouse_official_gene_names", package = "GeSciLiVis",envir = environment())
      #load("data/mouse_official_gene_names.rda")
      biomart_data<-mouse_official_gene_names
    }
    else if(species=="human"){ #"Homo sapiens"
      human_official_gene_names <- ""
      data("human_official_gene_names",package = "GeSciLiVis", envir = environment())
      #load("data/human_official_gene_names.rda")
      biomart_data<-human_official_gene_names
    }
    else{
      stop("available species: mouse or human")
    }
  }else{
    # obtain official gene symbols from annotation database biomaRt depending on species
    if(species=="mouse"){ # "Mus musculus"
      biomart_db <- "mmusculus_gene_ensembl"
      attribute <- "mgi_symbol" # Official Symbol by MGNC
    }
    else if(species=="human"){ #"Homo sapiens"
      biomart_db <- "hsapiens_gene_ensembl"
      attribute <- "hgnc_symbol" # Official Symbol by HGNC
    }
    else{stop("available species: mouse or human")}

    ensembl <-useEnsembl(biomart = "ensembl",
                         dataset = biomart_db)
    biomart_data <- getBM(attributes = attribute,
                          mart = ensembl)
    colnames(biomart_data) <- c("symbol")
  }

  # to check the gene list of genes if they are official gene symbols(valid)
  invalid <- list()
  for (gene in g_list) {
    if (!(gene %in% biomart_data$symbol)) {
      invalid <- append(invalid, gene)
    }
  }
  message <- paste(length(invalid), "entries were not found:", paste(invalid, collapse = ", "), sep = " ")
  message2 <- paste("no entry was found")
  if (length(invalid)== length(g_list)) stop(message2)
  else if (length(invalid)>0){
    warning(message)
    g_list <- g_list[!(g_list %in% invalid)]
  }

  # formating keywordset to a rentrez query
  queries <- paste("(",paste("(",k_list,")",sep="",collapse =" OR "),")",sep="")

  if(show_progressbar){
  pb <- txtProgressBar(min = 0, max = length(g_list), width = 50 , style = 3)
  }

  countlist <- list()
  publication_info_all <- c("Gene", "PubmedID", "Title")

  # pubmed search for each gene with the keyword query
  counter = 0
  for (gene in g_list) {
    current_query <- paste(queries," AND ",gene,"[GENE]", sep="")

    search <- entrez_search(db="pubmed",term=current_query,
                                 retmax=100, #top100 recent publications per gene
                                 use_history=TRUE)
    countlist[gene] <- search$count

    # extract 100 recent publication IDs and titles if there are any
    if(search$count>0){
          publication_info <- entrez_summary(db="pubmed", id=search$ids)
          if(search$count > 100){
            n_entries <- 100
          }else{
            n_entries <- search$count
          }
          gene_name <- data.frame(rep(gene,times=n_entries))
          colnames(gene_name) <- c("gene")
          publication_info_gene <- cbind(gene_name,t(extract_from_esummary(publication_info, c("uid", "title"))))
          #print(head(publication_info_gene))
          publication_info_all <- rbind(publication_info_all, publication_info_gene)
    }

    Sys.sleep(0.33) # sleep_time should be at least (1/3) second because Entrez allows 3 requests per second

    if(show_progressbar){
    counter = counter+1
    setTxtProgressBar(pb, counter)
    }
  }
  if(show_progressbar){
  close(pb)
    }

  if(!is.null(output_dir)){
    # prepare output directory
    dir.create(output_dir)
    # generate csv with extracted publication
    publication_info_all <- apply(publication_info_all, 2, as.character)
    write.table(file=paste(output_dir,"/publication_info_all.csv",sep="") ,x = publication_info_all, row.names=FALSE, col.names = FALSE, sep=",")
  }
  # prepare publication activity plot
  countlist <- countlist[order(sapply(countlist,'[[',1))] # sort the gene list by hits

  if(!is.null(output_dir)){
    png(paste(output_dir,"/publication_activity_plot.png",sep=""), # minimum resolution: 300 ppi
        units="cm", width = 33, height = 1.1*length(g_list)+5, res = 600)

    # generate png with publication activity plot
    lin_log_barplot(countlist, "Number of publications")

    dev.off() # output figure
  }

  # display publication activity plot
  lin_log_barplot(countlist, "Number of publications")
}

