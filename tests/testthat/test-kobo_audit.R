test_that("with kobo_audit you can read your audit log data", {
  url <- Sys.getenv("KOBOTOOLBOX_PROD_URL")
  token <- Sys.getenv("KOBOTOOLBOX_PROD_TOKEN")
  skip <-  url == "" & token == ""
  skip_if(skip,
          message = "Test server not configured")

  kobo_setup(url = url, token = token)
  uid <- "aKQB8xLBd3nsJ7EZQmQhZd"
  asset <- kobo_asset(uid)
  raw_uid <- kobo_data(uid)
  raw_asset <- kobo_data(asset)
  expect_equal(raw_uid, raw_asset)
  expect_equal(class(raw_uid),
               c("tbl_df", "tbl", "data.frame"))
  expect_error(kobo_audit(1L))

  uid_no_audit <- "aYuTZn9vegi3Z49MXwKjep"
  asset_no_audit <- kobo_asset(uid_no_audit)
  expect_error(kobo_audit(uid_no_audit))
})