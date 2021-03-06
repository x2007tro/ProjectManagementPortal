##
# Global parameter
##
entry_wid_s <- "80px"
entry_wid_m <- "120px"
entry_wid_l <- "250px"
entry_wid_xl <- "1200px"
brewed_colors <- rep(RColorBrewer::brewer.pal(n = 9, name = "Set3"), 100)

##
# Project directory
##
proj_dir <- list(
  `Workers Comp` = list(
    `NWT WSCC` = list(
      `Rate Setting` = "input/wc/wscc/rset.xls",
      `Benefits Valuation` = "input/wc/wscc/ben_val.xls",
      `OPEB` = "input/wc/wscc/opeb.xls"
    )
  ),
  `Other` = list(
    `PNB` = list(
      `LTD Valuation` = "input/other/pnb/ltd_val.xls"
    )
  )
)

# comn