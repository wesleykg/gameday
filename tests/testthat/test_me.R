test_that("case is ignored", {
  expect_equal(gday("canucks"), gday("CANUCKS"))
})

test_that("Seattle does not have a NHL team", {
  expect_false(gday("seattle"))
})

test_that("if no team is supplied, default to canucks", {
  expect_equal(gday(), gday("canucks"))
})

test_that("Vancouver Canucks had a game against Nashville Predators on 2014-11-02", {
  expect_true(gday(team = "canucks",   date = "2014-11-02"))
  expect_true(gday(team = "predators", date = "2014-11-02"))
})

test_that("Vancouver Canucks had a game against Nashville Predators on 2014-11-03", {
  expect_false(gday(team = "canucks",   date = "2014-11-03"))
  expect_false(gday(team = "predators", date = "2014-11-03"))
})
