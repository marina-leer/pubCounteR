test_that("Test - function ran without error", {

    gene_list_mouse  = c("Mbl1")
    keyword_list = c("stem cell")

    result <- pub_activity_plot(gene_list_mouse,
                                keyword_list,
                                species = "mouse",
                                output_dir=NULL,
                                show_progressbar=FALSE)

  expect_identical(result, 1)

})


test_that("Test - function ran when keyword set empty", {

  gene_list_mouse  = "Mbl1"
  keyword_list = ""

  result2 <- pub_activity_plot(gene_list_mouse,
                               keyword_list,
                               species = "mouse",
                               output_dir=NULL,
                               show_progressbar=FALSE)

  expect_identical(result2, 1)
})
