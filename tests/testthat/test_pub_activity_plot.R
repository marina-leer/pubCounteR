test_that("Test function ran without error", {

    gene_list_mouse  = c("Mbl1")
    keyword_list = c("stem cell")

    result <- pub_activity_plot(gene_list_mouse,
                                keyword_list,
                                species = "mouse",
                                output_dir=NULL,
                                show_progressbar=FALSE)

  expect_identical(result, 1)

})

