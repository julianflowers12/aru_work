test\_refs using visual rmd
================

See

-   <https://bookdown.org/yihui/rmarkdown-cookbook/bibliography.html>

-   <https://rstudio.github.io/visual-markdown-editing/citations>

``` r
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --

    ## v ggplot2 3.3.3     v purrr   0.3.4
    ## v tibble  3.1.2     v dplyr   1.0.6
    ## v tidyr   1.1.3     v stringr 1.4.0
    ## v readr   1.4.0     v forcats 0.5.1

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
devtools::install_github("julianflowers/myScrapers")
```

    ## Downloading GitHub repo julianflowers/myScrapers@HEAD

    ##       v  checking for file 'C:\Users\Julian\AppData\Local\Temp\Rtmp6DZAjO\remotes314c74677276\julianflowers-myScrapers-d651dd6/DESCRIPTION'
    ##       -  preparing 'myScrapers':
    ##    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   v  checking DESCRIPTION meta-information
    ##       -  checking for LF line-endings in source and make files and shell scripts
    ##       -  checking for empty or unneeded directories
    ##      Omitted 'LazyData' from DESCRIPTION
    ##      NB: this package now depends on R (>=        NB: this package now depends on R (>= 3.5.0)
    ##        WARNING: Added dependency on R >= 3.5.0 because serialized objects in
    ##      serialize/load version 3 cannot be read in older versions of R.
    ##      File(s) containing such objects:
    ##        'myScrapers/vignettes/annual-counts_cache/html/unnamed-chunk-1_ad4536896088afdadabfca30f1798fc4.RData'
    ##        'myScrapers/vignettes/annual-counts_cache/html/unnamed-chunk-1_ad4536896088afdadabfca30f1798fc4.rdx'
    ##        'myScrapers/vignettes/topic-models_cache/html/unnamed-chunk-2_f57582de137bcd4d9e8d344775c0ea4e.RData'
    ##        'myScrapers/vignettes/topic-models_cache/html/unnamed-chunk-2_f57582de137bcd4d9e8d344775c0ea4e.rdx'
    ##        'myScrapers/vignettes/topic-models_cache/html/unnamed-chunk-3_827896ea7558e7eccfebb30451ad8293.RData'
    ##        'myScrapers/vignettes/topic-models_cache/html/unnamed-chunk-3_827896ea7558e7eccfebb30451ad8293.rdx'
    ##      -  building 'myScrapers_0.1.0.tar.gz'
    ##      
    ## 

    ## Installing package into 'C:/Users/Julian/OneDrive/Documents/R/win-library/4.1'
    ## (as 'lib' is unspecified)

    ## Warning in i.p(...): installation of package 'C:/Users/Julian/AppData/Local/
    ## Temp/Rtmp6DZAjO/file314c59e4f0d/myScrapers_0.1.0.tar.gz' had non-zero exit
    ## status

``` r
ss <- myScrapers::get_ss_data(search = "large blue butterfly reintroduction")
```

    ## Loading required package: jsonlite

    ## 
    ## Attaching package: 'jsonlite'

    ## The following object is masked from 'package:purrr':
    ## 
    ##     flatten

    ## Loading required package: data.table

    ## 
    ## Attaching package: 'data.table'

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     between, first, last

    ## The following object is masked from 'package:purrr':
    ## 
    ##     transpose

``` r
ss$data |> 
  filter(isOpenAccess == TRUE) %>%
 gt::gt()
```

<div id="upazmtfzfp" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#upazmtfzfp .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#upazmtfzfp .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#upazmtfzfp .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#upazmtfzfp .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#upazmtfzfp .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#upazmtfzfp .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#upazmtfzfp .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#upazmtfzfp .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#upazmtfzfp .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#upazmtfzfp .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#upazmtfzfp .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#upazmtfzfp .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#upazmtfzfp .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#upazmtfzfp .gt_from_md > :first-child {
  margin-top: 0;
}

#upazmtfzfp .gt_from_md > :last-child {
  margin-bottom: 0;
}

#upazmtfzfp .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#upazmtfzfp .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#upazmtfzfp .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#upazmtfzfp .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#upazmtfzfp .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#upazmtfzfp .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#upazmtfzfp .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#upazmtfzfp .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#upazmtfzfp .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#upazmtfzfp .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#upazmtfzfp .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#upazmtfzfp .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#upazmtfzfp .gt_left {
  text-align: left;
}

#upazmtfzfp .gt_center {
  text-align: center;
}

#upazmtfzfp .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#upazmtfzfp .gt_font_normal {
  font-weight: normal;
}

#upazmtfzfp .gt_font_bold {
  font-weight: bold;
}

#upazmtfzfp .gt_font_italic {
  font-style: italic;
}

#upazmtfzfp .gt_super {
  font-size: 65%;
}

#upazmtfzfp .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">paperId</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">externalIds.PubMedCentral</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">externalIds.MAG</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">externalIds.DOI</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">externalIds.PubMed</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">url</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">title</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">abstract</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">venue</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">referenceCount</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">citationCount</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">influentialCitationCount</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">isOpenAccess</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">authors</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">ee922d6591ebff32f6cbe81a5d8fef5147d5fd31</td>
<td class="gt_row gt_left">5179113</td>
<td class="gt_row gt_left">2569853780</td>
<td class="gt_row gt_left">10.1371/journal.pone.0168679</td>
<td class="gt_row gt_left">28005942</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/ee922d6591ebff32f6cbe81a5d8fef5147d5fd31</td>
<td class="gt_row gt_left">Relative Contribution of Matrix Structure, Patch Resources and Management to the Local Densities of Two Large Blue Butterfly Species</td>
<td class="gt_row gt_left">The type of matrix, the landscape surrounding habitat patches, may determine the distribution and function of local populations. However, the matrix is often heterogeneous, and its various components may differentially contribute to metapopulation processes at different spatial scales, a phenomenon that has rarely been investigated. The aim of this study was to estimate the relative importance of matrix composition and spatial scale, habitat quality, and management intensity on the occurrence and density of local populations of two endangered large blue butterflies: Phengaris teleius and P. nausithous. Presence and abundance data were assessed over two years, 2011–12, in 100 local patches within two heterogeneous regions (near Kraków and Tarnów, southern Poland). The matrix composition was analyzed at eight spatial scales. We observed high occupancy rates in both species, regions and years. With the exception of area and isolation, almost all of the matrix components contributed to Phengaris sp. densities. The different matrix components acted at different spatial scales (grassland cover within 4 and 3 km, field cover within 0.4 and 0.3 km and water cover within 4 km radii for P. teleius and P. nausithous, respectively) and provided the highest independent contribution to the butterfly densities. Additionally, the effects of a 0.4 km radius of forest cover and a food plant cover on P. teleius, and a 1 km radius of settlement cover and management intensity on P. nausithous densities were observed. Contrary to former studies we conclude that the matrix heterogeneity and spatial scale rather than general matrix type are of relevance for densities of butterflies. Conservation strategies for these umbrella species should concentrate on maintaining habitat quality and managing matrix composition at the most appropriate spatial scales.</td>
<td class="gt_row gt_left">PloS one</td>
<td class="gt_row gt_right">2016</td>
<td class="gt_row gt_right">129</td>
<td class="gt_row gt_right">6</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("1422225208", "4970957", "3693237", "4253531", "39052340", "1422224817", "3681386"), c("Joanna Kajzer-Bonk", "P. Skórka", "P. Nowicki", "M. Bonk", "W. Król", "Damian Szpilyk", "M. Woyciechowski")</td></tr>
    <tr><td class="gt_row gt_left">d39481fc57fa522a82b1636d0a8f1f9b0b759113</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2050548898</td>
<td class="gt_row gt_left">10.1016/J.AGEE.2014.06.019</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/d39481fc57fa522a82b1636d0a8f1f9b0b759113</td>
<td class="gt_row gt_left">Effects of timing and frequency of mowing on the threatened scarce large blue butterfly – A fine-scale experiment</td>
<td class="gt_row gt_left">Abstract As part of a major transformation of the EU agriculture in the last few decades, traditional land-use types disappeared due to either intensification or abandonment. Grasslands are highly affected in this process and are consequently among the most threatened semi-natural habitats in Europe. However, experimental evidence is scarce on the effects of management types on biodiversity. Moreover, management types need to be feasible within the recently changed socio-economic circumstances in Hungary. We investigated the effects of timing and frequency of mowing on the abundance of the scarce large blue butterfly (Phengaris teleius), on the abundance of its host plant and on the frequency of its host ant species. In each of four study meadows, we applied four types of management: one cut per year in May, one cut per year in September, two cuts per year (May and September) and cessation of management. After three years of experimental management, we found that adult butterflies preferred plots cut once in September over plots cut twice per year and abandoned ones, while plots cut once in May were also preferred over abandoned plots. Relative host plant abundance remarkably increased in plots cut once in September. Management did not affect the occupancy pattern of Myrmica host ants. Invasive goldenrod was successfully retained by two cuts per year. To our knowledge, this is the first attempt to test management effects on the whole community module of a socially parasitic butterfly, its host plant and host ants. Based on the results, we provide recommendations on regional management of the scarce large blue's habitats.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2014</td>
<td class="gt_row gt_right">57</td>
<td class="gt_row gt_right">22</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("21461283", "5264162", "5755383", "4265014", "5402902", "6786398"), c("Á. Korösi", "I. Szentirmai", "P. Batáry", "S. Kövér", "Noémi Örvössy", "L. Peregovits")</td></tr>
    <tr><td class="gt_row gt_left">4662567d0f4368f69d363cc55fae5d42c4d2ee50</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">1975288302</td>
<td class="gt_row gt_left">10.1007/s10980-013-9855-3</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/4662567d0f4368f69d363cc55fae5d42c4d2ee50</td>
<td class="gt_row gt_left">Different flight behaviour of the endangered scarce large blue butterfly Phengaris teleius (Lepidoptera: Lycaenidae) within and outside its habitat patches</td>
<td class="gt_row gt_left">Understanding individual movements in heterogeneous environments is central to predicting how landscape changes affect animal populations. An important but poorly understood phenomenon is behavioural response to habitat boundaries and the way animals cross inhospitable matrix surrounding habitat patches. Here, we analyze movement decisions, flight behaviour, and activity of the endangered scarce large blue Phengaris (Maculinea) teleius, focusing on the differences among the patterns observed in patch interior, at patch boundaries and within matrix. The probability of crossing an external patch boundary, regardless of the land use in the adjacent area, was considerably lower than crossing a ‘control line’ within patch interior. Movement distances, flight durations and net squared displacement were largest in matrix, while similarly smaller at patch boundaries and in patch interior. The distribution of angles between successive movements was clearly clustered around 0° (indicating flight in a straight line) in matrix and at patch boundaries, but not in patch interior. There were no differences in time spent on foraging, resting and ovipositing between patch interior and boundaries, but the first two activities rarely, and oviposition never, happened in matrix. Our results suggest that although P. teleius adults do not avoid using the resources located in the boundaries of habitat patches, they often return to the interior of the patches when crossing their boundaries. However, having entered the matrix the butterflies perform relatively long and straight flights. The estimated probability of emigration and net squared distance implies that the dispersal between local populations is common in this species in the studied area.</td>
<td class="gt_row gt_left">Landscape Ecology</td>
<td class="gt_row gt_right">2013</td>
<td class="gt_row gt_right">103</td>
<td class="gt_row gt_right">36</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("4970957", "3693237", "3901377", "1757832", "5810768", "2978867", "3681386"), c("P. Skórka", "P. Nowicki", "Magdalena Lenda", "M. Witek", "E. Sliwinska", "J. Settele", "M. Woyciechowski")</td></tr>
    <tr><td class="gt_row gt_left">c70ec06e1dbb4fac4b7447b5a233dbbc31b1c466</td>
<td class="gt_row gt_left">3146443</td>
<td class="gt_row gt_left">1993987263</td>
<td class="gt_row gt_left">10.1186/1471-2148-11-201</td>
<td class="gt_row gt_left">21745368</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/c70ec06e1dbb4fac4b7447b5a233dbbc31b1c466</td>
<td class="gt_row gt_left">Reconstructing eight decades of genetic variation in an isolated Danish population of the large blue butterfly Maculinea arion</td>
<td class="gt_row gt_left">BackgroundFragmentation of terrestrial ecosystems has had detrimental effects on metapopulations of habitat specialists. Maculinea butterflies have been particularly affected because of their specialized lifecycles, requiring both specific food-plants and host-ants. However, the interaction between dispersal, effective population size, and long-term genetic erosion of these endangered butterflies remains unknown. Using non-destructive sampling, we investigated the genetic diversity of the last extant population of M. arion in Denmark, which experienced critically low numbers in the 1980s.ResultsUsing nine microsatellite markers, we show that the population is genetically impoverished compared to nearby populations in Sweden, but less so than monitoring programs suggested. Ten additional short repeat microsatellites were used to reconstruct changes in genetic diversity and population structure over the last 77 years from museum specimens. We also tested amplification efficiency in such historical samples as a function of repeat length and sample age. Low population numbers in the 1980s did not affect genetic diversity, but considerable turnover of alleles has characterized this population throughout the time-span of our analysis.ConclusionsOur results suggest that M. arion is less sensitive to genetic erosion via population bottlenecks than previously thought, and that managing clusters of high quality habitat may be key for long-term conservation.</td>
<td class="gt_row gt_left">BMC Evolutionary Biology</td>
<td class="gt_row gt_right">2011</td>
<td class="gt_row gt_right">65</td>
<td class="gt_row gt_right">38</td>
<td class="gt_row gt_right">5</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("5838185", "153239428", "3646766", "39292821"), c("L. V. Ugelvig", "P. S. Nielsen", "J. Boomsma", "D. Nash")</td></tr>
    <tr><td class="gt_row gt_left">8d43689de7e6fc927d5d81424a1d9b5478f1395d</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2142088133</td>
<td class="gt_row gt_left">10.1111/j.1365-294X.2007.03441.x</td>
<td class="gt_row gt_left">17850549</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/8d43689de7e6fc927d5d81424a1d9b5478f1395d</td>
<td class="gt_row gt_left">Population structure of a large blue butterfly and its specialist parasitoid in a fragmented landscape</td>
<td class="gt_row gt_left">Habitat fragmentation may interrupt trophic interactions if herbivores and their specific parasitoids respond differently to decreasing connectivity of populations. Theoretical models predict that species at higher trophic levels are more negatively affected by isolation than lower trophic level species. By combining ecological data with genetic information from microsatellite markers we tested this hypothesis on the butterfly Maculinea nausithous and its specialist hymenopteran parasitoid Neotypus melanocephalus. We assessed the susceptibility of both species to habitat fragmentation by measuring population density, rate of parasitism, overall genetic differentiation (θST) and allelic richness in a large metapopulation. We also simulated the dynamics of genetic differentiation among local populations to asses the relative effects of migration rate, population size, and haplodiploid (parasitoid) and diploid (host) inheritance on metapopulation persistence. We show that parasitism by N. melanocephalus is less frequent at larger distances to the nearest neighbouring population of M. nausithous hosts, but that host density itself is not affected by isolation. Allelic richness was independent of isolation, but the mean genetic differentiation among local parasitoid populations increased with the distance between these populations. Overall, genetic differentiation in the parasitoid wasp was much greater than in the butterfly host and our simulations indicate that this difference is due to a combination of haplodiploidy and small local population sizes. Our results thus support the hypothesis that Neotypus parasitoid wasps are more sensitive to habitat fragmentation than their Maculinea butterfly hosts.</td>
<td class="gt_row gt_left">Molecular ecology</td>
<td class="gt_row gt_right">2007</td>
<td class="gt_row gt_right">79</td>
<td class="gt_row gt_right">66</td>
<td class="gt_row gt_right">10</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("143993535", "3599926", "8453024", "143801495", "3646766", "2978867"), c("C. Anton", "I. Zeisset", "M. Musche", "W. Durka", "J. Boomsma", "J. Settele")</td></tr>
    <tr><td class="gt_row gt_left">5cebe0d738ccbcf42a2443a532aac7ce5c34dab7</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">1537036699</td>
<td class="gt_row gt_left">10.1111/J.1365-2664.2006.01125.X</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/5cebe0d738ccbcf42a2443a532aac7ce5c34dab7</td>
<td class="gt_row gt_left">Influence of mowing on the persistence of two endangered large blue butterfly species</td>
<td class="gt_row gt_left">Mowing influences two endangered butterfly species, Maculinea nausithous and Maculinea teleius, directly through egg destruction and larval mortality on the mown plants and indirectly through altering the abundance of their sequential resources in meadows (Sanguisorba plants for oviposition and early larval development and Myrmica ant nests for later larval development and pupation). Although conservation biologists have argued that mowing during the adult stage is detrimental to population persistence, it is not obvious how the timing and frequency of mowing impact on population dynamics. A simulation model was used to investigate how current 'traditional' mowing regimes could be altered to reconcile butterfly conservation with agriculture. The key mechanism affecting the impact of mowing on population persistence was the interaction between density-independent and density-dependent mortalities in different larval stages of each life cycle. Because of this interaction, optimal mowing regimes for butterfly conservation were sensitive to the type of density regulation displayed by each species, and to landscape attributes such as the influence of climate on resource availability and the level of parasitism. Despite this sensitivity, we were able to identify robust mowing regimes appropriate for a wide range of landscape attributes and to derive general management recommendations. Synthesis and applications. Our results showed that the 'traditional' mowing regime (twice per year with the second cut during the flight period) was always detrimental to the two butterfly species at both local (single population) and regional (metapopulation) scales. However, mowing once a year, or every second or third year, before or after the flight period, was appropriate for both species in the considered landscapes. Maculinea teleius could persist only at a regional scale, assuming dispersal among the meadows, whereas M. nausithous could persist at both local and regional scales. Thus it is essential that the recommended mowing regimes are applied across several connected meadows within reach of dispersing butterflies if both butterflies are to be conserved in a region</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2006</td>
<td class="gt_row gt_right">33</td>
<td class="gt_row gt_right">138</td>
<td class="gt_row gt_right">6</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("2069570", "34806432", "2115543978", "2978867"), c("K. Johst", "M. Drechsler", "Jeremy A. Thomas", "J. Settele")</td></tr>
    <tr><td class="gt_row gt_left">44c796941f8fd38937b4dcf2897ced4590a1fdc2</td>
<td class="gt_row gt_left">7246198</td>
<td class="gt_row gt_left">3020805917</td>
<td class="gt_row gt_left">10.1002/ece3.6203</td>
<td class="gt_row gt_left">32489603</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/44c796941f8fd38937b4dcf2897ced4590a1fdc2</td>
<td class="gt_row gt_left">Caterpillars on a phytochemical landscape: The case of alfalfa and the Melissa blue butterfly</td>
<td class="gt_row gt_left">Abstract Modern metabolomic approaches that generate more comprehensive phytochemical profiles than were previously available are providing new opportunities for understanding plant‐animal interactions. Specifically, we can characterize the phytochemical landscape by asking how a larger number of individual compounds affect herbivores and how compounds covary among plants. Here we use the recent colonization of alfalfa (Medicago sativa) by the Melissa blue butterfly (Lycaeides melissa) to investigate the effects of indivdiual compounds and suites of covarying phytochemicals on caterpillar performance. We find that survival, development time, and adult weight are all associated with variation in nutrition and toxicity, including biomolecules associated with plant cell function as well as putative anti‐herbivore action. The plant‐insect interface is complex, with clusters of covarying compounds in many cases encompassing divergent effects on different aspects of caterpillar performance. Individual compounds with the strongest associations are largely specialized metabolites, including alkaloids, phenolic glycosides, and saponins. The saponins are represented in our data by more than 25 individual compounds with beneficial and detrimental effects on L. melissa caterpillars, which highlights the value of metabolomic data as opposed to approaches that rely on total concentrations within broad defensive classes.</td>
<td class="gt_row gt_left">Ecology and evolution</td>
<td class="gt_row gt_right">2020</td>
<td class="gt_row gt_right">41</td>
<td class="gt_row gt_right">3</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("5423525", "88999800", "21117289", "4661161", "1791972251", "49787644", "3660197", "6617624", "6809704", "3718778", "8676637", "145152221", "123201483"), c("M. Forister", "Su'ad A Yoon", "C. Philbin", "C. D. Dodson", "Bret Hart", "J. Harrison", "O. Shelef", "J. Fordyce", "Z. Marion", "C. Nice", "Lora A. Richards", "C. Buerkle", "Z. Gompert")</td></tr>
    <tr><td class="gt_row gt_left">8eb974736c0fdde68adcfbdbbe8b5347d6bf0ffb</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2618954912</td>
<td class="gt_row gt_left">10.13102/SOCIOBIOLOGY.V64I1.1206</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/8eb974736c0fdde68adcfbdbbe8b5347d6bf0ffb</td>
<td class="gt_row gt_left">First Data on the Host Ant Usage of Large Blue from the Carpathian Basin</td>
<td class="gt_row gt_left">The protected Maculinea arion  is an obligate myrmecophilous butterfly (Lepidoptera, Lycaenidae). Fourth instar larvae and pupae develop in Myrmica (Hymenoptera: Formicidae) ant nests. Host ant specificity varies geographically, and knowledge of the local host ant species is important to understand the biogeography and evolution of this species, and vital for its conservation. Here we report the first data on the host ant usage of M. arion in the Carpathian Basin, one prepupal caterpillar from a Myrmica specioides Bondroit, 1918 and one pupa from a M. scabrinodis Nylander, 1846 nest. Myrmica specioides is a new host ant species of M. arion . It is important to collect further data on the host ant usage of M. arion , despite the difficulties of data collection.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2017</td>
<td class="gt_row gt_right">26</td>
<td class="gt_row gt_right">2</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("6599204", "153582551", "2090828042", "3956069"), c("A. Tartally", "J. Tóth", "A. Váradi", "J. Bereczki")</td></tr>
    <tr><td class="gt_row gt_left">dcfc2dd62a0a71623f2c71eb387cfee3db82c310</td>
<td class="gt_row gt_left">5093462</td>
<td class="gt_row gt_left">2546711761</td>
<td class="gt_row gt_left">10.1038/srep36364</td>
<td class="gt_row gt_left">27808223</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/dcfc2dd62a0a71623f2c71eb387cfee3db82c310</td>
<td class="gt_row gt_left">Host-ant specificity of endangered large blue butterflies (Phengaris spp., Lepidoptera: Lycaenidae) in Japan</td>
<td class="gt_row gt_left">Large blue butterflies, Phengaris (Maculinea), are an important focus of endangered-species conservation in Eurasia. Later-instar Phengaris caterpillars live in Myrmica ant nests and exploit the ant colony’s resources, and they are specialized to specific host-ant species. For example, local extinction of P. arion in the U. K. is thought to have been due to the replacement of its host-ant species with a less-suitable congener, as a result of changes in habitat. In Japan, Myrmica kotokui hosts P. teleius and P. arionides caterpillars. We recently showed, however, that the morphological species M. kotokui actually comprises four genetic clades. Therefore, to determine to which group of ants the hosts of these two Japanese Phengaris species belong, we used mitochondrial COI-barcoding of M. kotokui specimens from colonies in the habitats of P. teleius and P. arionides to identify the ant clade actually parasitized by the caterpillars of each species. We found that these two butterfly species parasitize different ant clades within M. kotokui.</td>
<td class="gt_row gt_left">Scientific reports</td>
<td class="gt_row gt_right">2016</td>
<td class="gt_row gt_right">27</td>
<td class="gt_row gt_right">5</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("5248070", "104186403", "7005085", "7340941", "2700754"), c("Shouhei Ueda", "T. Komatsu", "T. Itino", "Ryusuke Arai", "H. Sakamoto")</td></tr>
    <tr><td class="gt_row gt_left">5682d6e96716fb75c2819d06063bbf9a5c8a9a5c</td>
<td class="gt_row gt_left">5373076</td>
<td class="gt_row gt_left">2597506042</td>
<td class="gt_row gt_left">10.1038/srep45613</td>
<td class="gt_row gt_left">28358352</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/5682d6e96716fb75c2819d06063bbf9a5c8a9a5c</td>
<td class="gt_row gt_left">Corrigendum: Host-ant specificity of endangered large blue butterflies (Phengaris spp., Lepidoptera: Lycaenidae) in Japan</td>
<td class="gt_row gt_left">Scientific Reports 6: Article number: srep36364; published online: 03 November 2016; updated: 30 March 2017 This Article contains typographical errors in Table 1. For Location E, the ‘L1’ value “2 (0%)” should read “2 (100%)”. Additionally, the Region for ‘P. arionides’, “Chu-bu” should read “Chubu”.</td>
<td class="gt_row gt_left">Scientific reports</td>
<td class="gt_row gt_right">2017</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("5248070", "104186403", "7005085", "7340941", "2700754"), c("Shouhei Ueda", "T. Komatsu", "T. Itino", "Ryusuke Arai", "H. Sakamoto")</td></tr>
    <tr><td class="gt_row gt_left">183eee4fe6aa3e96f1a576122d76c067ca64958a</td>
<td class="gt_row gt_left">4510528</td>
<td class="gt_row gt_left">2443707702</td>
<td class="gt_row gt_left">10.1038/srep12351</td>
<td class="gt_row gt_left">26197998</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/183eee4fe6aa3e96f1a576122d76c067ca64958a</td>
<td class="gt_row gt_left">Body size distributions of the pale grass blue butterfly in Japan: Size rules and the status of the Fukushima population</td>
<td class="gt_row gt_left">The body size of the pale grass blue butterfly, Zizeeria maha, has been used as an environmental indicator of radioactive pollution caused by the Fukushima nuclear accident. However, geographical and temporal size distributions in Japan and temperature effects on size have not been established in this species. Here, we examined the geographical, temporal, and temperature-dependent changes of the forewing size of Z. maha argia in Japan. Butterflies collected in 2012 and 2013 from multiple prefectures throughout Japan demonstrated an inverse relationship of latitude and forewing size, which is the reverse of Bergmann’s cline. The Fukushima population was significantly larger than the Aomori and Miyagi populations and exhibited no difference from most of the other prefectural populations. When monitored at a single geographic locality every other month, forewing sizes were the largest in April and the smallest in August. Rearing larvae at a constant temperature demonstrated that forewing size followed the temperature-size rule. Therefore, the converse Bergmann’s rule and the temperature-size rule coexist in this multivoltine species. Our study establishes this species as a useful environmental indicator and supports the idea that the size reduction observed only in Fukushima Prefecture in 2011 was caused by the environmental stress of radioactive pollution.</td>
<td class="gt_row gt_left">Scientific reports</td>
<td class="gt_row gt_right">2015</td>
<td class="gt_row gt_right">67</td>
<td class="gt_row gt_right">18</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("6210536", "3619019", "2414027"), c("Wataru Taira", "Mayo Iwasaki", "J. M. Otaki")</td></tr>
    <tr><td class="gt_row gt_left">9ae88f8e3c6ecade575cf31e82756efa24a19ab5</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2159048834</td>
<td class="gt_row gt_left">10.1098/rsbl.2010.1077</td>
<td class="gt_row gt_left">21177692</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/9ae88f8e3c6ecade575cf31e82756efa24a19ab5</td>
<td class="gt_row gt_left">After 60 years, an answer to the question: what is the Karner blue butterfly?</td>
<td class="gt_row gt_left">The Karner blue butterfly (KBB), Lycaeides melissa samuelis, is a federally protected taxon whose relationship to the Melissa blue, Lycaeides melissa, has been a point of contention during the 66 years since the KBB was first described. Using a large population-genomic dataset and a model of population divergence with migration, we investigated the relationship between the KBB and L. melissa, as well as the relationship between L. melissa and a third taxon, Lycaeides idas. We report that gene flow between the KBB and L. melissa is low, and comparable to gene flow between L. melissa and L. idas. Considering this population-genetic evidence, we conclude that the KBB is a unique evolutionary lineage that should be recognized as Lycaeides samuelis.</td>
<td class="gt_row gt_left">Biology Letters</td>
<td class="gt_row gt_right">2010</td>
<td class="gt_row gt_right">22</td>
<td class="gt_row gt_right">26</td>
<td class="gt_row gt_right">2</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("5423525", "123201483", "6617624", "3718778"), c("M. Forister", "Z. Gompert", "J. Fordyce", "C. Nice")</td></tr>
    <tr><td class="gt_row gt_left">2b8137942149116cf0b0b29855c5bde1964a584f</td>
<td class="gt_row gt_left">7664033</td>
<td class="gt_row gt_left">3100844065</td>
<td class="gt_row gt_left">10.1186/s40851-020-00164-6</td>
<td class="gt_row gt_left">33292721</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/2b8137942149116cf0b0b29855c5bde1964a584f</td>
<td class="gt_row gt_left">Coloration principles of the Great purple emperor butterfly (Sasakia charonda)</td>
<td class="gt_row gt_left">The dorsal wings of male Sasakia charonda butterflies display a striking blue iridescent coloration, which is accentuated by white, orange-yellow and red spots, as well as by brown margins. The ventral wings also have a variegated, but more subdued, pattern. We investigated the optical basis of the various colors of intact wings as well as isolated wing scales by applying light and electron microscopy, imaging scatterometry and (micro)spectrophotometry. The prominent blue iridescence is due to scales with tightly packed, multilayered ridges that contain melanin pigment. The scales in the brown wing margins also contain melanin. Pigments extracted from the orange-yellow and red spots indicate the presence of 3-OH-kynurenine and ommochrome pigment. The scales in the white spots also have multilayered ridges but lack pigment. The lower lamina of the scales plays a so-far undervalued but often crucial role. Its thin-film properties color the majority of the ventral wing scales, which are unpigmented and have large windows. The lower lamina acting as a thin-film reflector generally contributes to the reflectance of the various scale types.</td>
<td class="gt_row gt_left">Zoological letters</td>
<td class="gt_row gt_right">2020</td>
<td class="gt_row gt_right">39</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("3524164", "93558642", "4900499"), c("D. Stavenga", "H. Leertouwer", "K. Arikawa")</td></tr>
    <tr><td class="gt_row gt_left">79185b8862fd583d27e4d441bb75cbd49a41f694</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">3025672557</td>
<td class="gt_row gt_left">10.1101/2020.05.13.093096</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/79185b8862fd583d27e4d441bb75cbd49a41f694</td>
<td class="gt_row gt_left">Convergence in sympatry: evolution of blue-banded wing pattern in Morpho butterflies</td>
<td class="gt_row gt_left">Species interactions such as mimicry can promote trait convergence but disentangling this effect from those of shared ecology, evolutionary history and niche conservatism is often challenging. Here by focusing on wing color pattern variation within and between three butterfly species living in sympatry in a large proportion of their range, we tested the effect of species interactions on trait diversification. These butterflies display a conspicuous iridescent blue coloration on the dorsal side of their wings and a cryptic brownish colour on the ventral side. Combined with an erratic and fast flight, these color patterns increase the difficulty of capture by predators and contribute to the high escape abilities of these butterflies. We hypothesize that, beyond their direct contribution to predator escape, these wing patterns can be used as signals of escape abilities by predators, resulting in positive frequency-dependent selection favouring convergence in wing pattern in sympatry. To test this hypothesis, we quantified dorsal wing pattern variations of 723 butterflies from the three species sampled throughout their distribution, including sympatric and allopatric situations and compared the phenotypic distances between species, sex and localities. We detected a significant effect of localities on colour pattern, and higher inter-specific resemblance in sympatry as compared to allopatry, consistent with the hypothesis of local convergence of wing patterns. Our results provide some support to the existence of escape mimicry in the wild and stress the importance of estimating trait variation within species to understand trait variation between species, and to a larger extent, trait diversification at the macro-evolutionary scale.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2020</td>
<td class="gt_row gt_right">39</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("9805539", "48186934", "2051158336", "1744754219", "2065723674", "4408453"), c("V. Llaurens", "Y. Le Poul", "A. Puissant", "C. Noûs", "P. Blandin", "V. Debat")</td></tr>
    <tr><td class="gt_row gt_left">2b101ace61b61dbcddc29e90957b4a0ff20a9ca2</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">1979375397</td>
<td class="gt_row gt_left">10.1111/JBI.12137</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/2b101ace61b61dbcddc29e90957b4a0ff20a9ca2</td>
<td class="gt_row gt_left">Complex evolutionary history of the pallid dotted-blue butterfly (Lycaenidae: Euphilotes pallescens) in the Great Basin of western North America</td>
<td class="gt_row gt_left">Aim 
 
The aim of this study was to investigate patterns of genetic isolation associated with populations in discrete habitat patches in a North American cold desert through analysis of the pallid dotted-blue butterfly, Euphilotes pallescens. This small butterfly is largely restricted to low-elevation habitats across the Great Basin. The apparent geographical isolation and reported morphological variation among E. pallescens populations makes this species an ideal candidate with which to investigate patterns of genetic isolation and diversification in this arid region. 
 
 
 
Location 
 
Great Basin, western North America. 
 
 
 
Methods 
 
We used sequence data from nuclear and mitochondrial genes to investigate genetic diversity among E. pallescens populations, and among E. pallescens and a number of closely related Euphilotes species, using Bayesian phylogenetic analyses, as well as population genetic analyses. In conjunction with genetic variation, morphological variation was examined in the context of geographical and subspecific differentiation. 
 
 
 
Results 
 
Our genetic and morphological analyses suggest a moderate amount of isolation among populations, consistent with the hypothesis of restricted gene flow among isolated dune habitats, and possibly associated with isolation in distinct Pleistocene refugia. The patterns of diversification within E. pallescens and among closely related species are complicated by discordance among phylogenetic reconstructions based on nuclear and mitochondrial genes. Discordance among gene genealogies suggests a complex evolutionary history, perhaps involving alternating periods of reticulation and divergence in isolation. 
 
 
 
Main conclusions 
 
Although E. pallescens may be a vagile species, we find that persistence on isolated dunes in the Great Basin is associated with appreciable genetic and morphological differentiation among populations. However, genetic, morphological and taxonomic axes of variation are only partially in agreement. More generally, the discordance we find among genetic regions is consistent with the ascendant paradigm in phylogenetic reconstruction: gene genealogies often do not perfectly match species trees. Thus we present Euphilotes as a model for future biogeographical and phylogenetic reconstructions employing larger data sets of independent sequence markers.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2013</td>
<td class="gt_row gt_right">60</td>
<td class="gt_row gt_right">3</td>
<td class="gt_row gt_right">2</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("2115847766", "40419369", "6303408", "3718778", "6617624", "5423525"), c("Joseph S. Wilson", "Michelle E. Sneck", "D. Murphy", "C. Nice", "J. Fordyce", "M. Forister")</td></tr>
    <tr><td class="gt_row gt_left">fb00ee9fc9670be824467b44bf09328ee8401f65</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">3023544061</td>
<td class="gt_row gt_left">10.12681/mms.21148</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/fb00ee9fc9670be824467b44bf09328ee8401f65</td>
<td class="gt_row gt_left">MEDLEM database, a data collection on large Elasmobranchs in the Mediterranean and Black seas</td>
<td class="gt_row gt_left">The Mediterranean Large Elasmobranchs Monitoring (MEDLEM) database contains over 3000 records (more than 4000 individuals) of large elasmobranch species from 20 different countries around the Mediterranean and Black seas, observed from 1666 to 2017. The main species included in the archive are the devil fish (1 813 individuals), the basking shark (939 individuals), the blue shark (585 individuals) and the great white shark (337 individuals). In the last decades other species such as the shortfin mako (166 individuals), the spiny butterfly ray (138) and the thresher shark (174 individuals) were reported with an increasing frequency. This was possibly due to an increased public awareness on the conservation status of sharks, and a consequent development of new monitoring programmes. MEDLEM does not have a homogeneous reporting coverage throughout the Mediterranean and Black seas and it should be considered as a database of observed species presence. Scientific monitoring efforts in the south-eastern Mediterranean and Black seas are generally lower than in the northern sectors and the absence in our database of some species does not imply their actual absence in these regions. Some considerations are made on the frequency and spatial distribution of records, size structure of the observed individuals for selected species, general area coverage and species involved as by-catch by fishing gear.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2020</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">5</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("3716971", "1723382444", "40121015", "66729774", "153294100", "86909624", "1723382417", "25569857", "8741278", "87837090", "6918116", "5135017", "6583213", "152211092", "87397919", "143775658", "13301336", "1708159481", "34469574", "78568827", "10797528", "30460752", "48043487", "5977613", "145595337", "1723387250", "8971187", "49278065", "1405217025", "89145887", "21689530", "34570415", "13714153", "2917396", "9781630", "90263878", "34978880", "40701004", "6948882", "152541725", "9906952", "88500230", 
"1723388703", "89054825", "20800877", "32185320", "91132259", "31929851", "4567271", "1780651", "13978578", "152523440", "88617175", "90034230", "2097005849", "48609808", "6415992", "100647618", "145413129", "2564370"), c("C. Mancusi", "R. Baino", "C. Fortuna", "L. G. Sola", "G. Morey", "M. Bradai", "Argyrios Kallianotis", "A. Soldo", "F. Hemida", "A. Saad", "M. Dimech", "P. Peristeraki", "M. Bariche", "S. Clò", "E. D. Sabata", "L. Castellano", "F. Garibaldi", "L. Lanteri", "F. Tinti", "A. Pais", "E. Sperone", "P. Micarelli", "F. Poisson", "L. Sion", "R. Carlucci", "Daniel Cebrian-Menchero", "B. Séret", "F. Ferretti", "Alaa M. El-Far", "I. Saygu", "E. Shakman", "Àlex Bartolí", "J. Guallart", "D. Damalas", "P. Megalofonou", 
"M. Vacchi", "M. Bottaro", "G. Sciara", "M. C. Follesa", "R. Cannas", "H. Kabasakal", "B. Zava", "Graziella Cavlan", "A. Jung", "Mohammed Abudaya", "J. Kolitari", "A. Barash", "A. Joksimovic", "B. Marceta", "L. Vilas", "F. Tiralongo", "I. Giovos", "F. Bargnesi", "S. Lelli", "M. Barone", "S. Moro", "C. Mazzoldi", "Charilaou Charis", "Á. Abella", "F. Serena")</td></tr>
    <tr><td class="gt_row gt_left">ca77f6aa89ae804a122c801240749f510a3257c5</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2118607377</td>
<td class="gt_row gt_left">10.14411/EJE.2008.115</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/ca77f6aa89ae804a122c801240749f510a3257c5</td>
<td class="gt_row gt_left">Host ant specificity of large blue butterflies Phengaris (Maculinea) (Lepidoptera: Lycaenidae) inhabiting humid grasslands in East-central Europe</td>
<td class="gt_row gt_left">Butterflies of the genus Phengaris have a highly specialised life cycle involving an obligatory relationship with Myrmica ants. A knowledge of the host ant specificity is essential for understanding the relationship between a particular Phengaris species and its hosts and also important for the conservation of these butterflies. Data on host ant specificity were collected in Poland, the Czech Republic, Slovakia and Ukraine. Five different Myrmica species were used by P. teleius as hosts (M. scabrinodis, M. rubra, M. ruginodis, M. rugulosa and M. gallienii) and at most localities it was not possible to distinguish a primary host - i.e. several Myr- mica species were parasitized to similar extents. Three populations of P. nausithous were found in Poland and Ukraine. In every case, M. rubra was its primary host, although in the Krakow region (Poland) two nests of M. scabrinodis and two of M. ruginodis were infested by this butterfly species. P. alcon in the four populations investigated in Poland and Ukraine invariably only used M. scabrinodis as a host despite the presence of other Myrmica species. These results obtained suggest lack of host specificity in P. teleius and high host specificity in P. nausithous, which mainly uses M. rubra as its host across Europe. Moreover, the three populations of P. alcon investigated seem to be highly specific and use M. scabrinodis as a host, which confirms the high local spe- cialisation of these populations.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2008</td>
<td class="gt_row gt_right">57</td>
<td class="gt_row gt_right">64</td>
<td class="gt_row gt_right">4</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("1757832", "5810768", "4970957", "3693237", "3877455", "4013332", "2978867", "3681386"), c("M. Witek", "E. Sliwinska", "P. Skórka", "P. Nowicki", "M. Wantuch", "V. Vrabec", "J. Settele", "M. Woyciechowski")</td></tr>
    <tr><td class="gt_row gt_left">859bf05e3246b592e11e301aa622705265478e34</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">1981622039</td>
<td class="gt_row gt_left">10.2478/s11535-013-0190-5</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/859bf05e3246b592e11e301aa622705265478e34</td>
<td class="gt_row gt_left">Movements and flight morphology in the endangered Large Blue butterflies</td>
<td class="gt_row gt_left">Movements and flight morphology of the endangered Large Blue butterflies Phengaris teleius and P. nausithous in southern Poland were studied with mark-release-recapture surveys and GIS analyses. Most individuals moved relatively small distances (&lt;40 metres) within their habitat patches. Distances covered by both species were positively related to season progression and wing length, and negatively related to body mass. P. teleius movement distances slightly exceeded those of P. nausithous. In addition, females moved longer distances than males, although the difference was significant only in P. teleius. Morphological traits appeared to be good indicators of the inter-specific and inter-sexual differences in mobility. While P. teleius individuals were heavier than P. nausithous ones, they had considerably longer wings, which may explain longer movements in the former species. Similarly, females were heavier than males in both species, but they invested more in wing size, which is likely to compensate for the negative impact of body mass on movement distances. Our results indicate that combination of GIS analysis of movement distances recorded with mark-release-recapture methods and morphometric measurements taken in field during non-lethal handling of captured individuals proved useful for studying the mobility potential of the endangered insect species.</td>
<td class="gt_row gt_left">Central European Journal of Biology</td>
<td class="gt_row gt_right">2013</td>
<td class="gt_row gt_right">54</td>
<td class="gt_row gt_right">10</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("4970957", "3693237", "134178140", "6344156", "5810768", "1757832", "2978867", "3681386"), c("P. Skórka", "P. Nowicki", "J. Kudlek", "A. Pepkowska", "E. Sliwinska", "M. Witek", "J. Settele", "M. Woyciechowski")</td></tr>
    <tr><td class="gt_row gt_left">1074e74a72977098f091a2dfbd125f6b5d1f69dd</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2160399100</td>
<td class="gt_row gt_left">10.14411/EJE.2011.067</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/1074e74a72977098f091a2dfbd125f6b5d1f69dd</td>
<td class="gt_row gt_left">The genetic structure of phenologically differentiated Large Blue (Maculinea arion) populations (Lepidoptera: Lycaenidae) in the Carpathian Basin</td>
<td class="gt_row gt_left">The infraspecific taxonomy of the European populations of the Large Blue (Maculinea arion) is confusing. Several sub- species have been described mostly based on external morphological features. In the Carpathian Basin two subspecies have been dis- tinguished. Maculinea arion arion flies from mid-May to mid-June and Maculinea arion ligurica is on the wing from the end of June to mid-August. The two forms show some differentiation in habitat use, but occasionally can also share habitats with two peaks in the appearance of butterflies. Our aim was to study the level and structure of genetic variation in a set of populations of the two phe- nologically different M. arion. Imagos were collected from 8 localities between 2000 and 2006. Enzyme polymorphism was ana- lysed at 13 enzyme loci using polyacrylamide gel electrophoresis. In the analysis of the data, we estimated the parameters of polymorphism. To study the pattern of genetic differentiation F-statistics, hierarchical F-statistics and AMOVA were computed. GeneClass and Structure were both applied to analyse the differentiation between the two phenologically different sets of popula- tions. Cavalli-Sforza and Edwards' arc distances were calculated and a UPGMA dendrogram was constructed on the basis of the dis- tance matrix. PCA analysis was also carried out using the allele frequencies of the individuals. The level of polymorphism was relatively high in M. arion. The results of all analyses indicated that the differences between the two sets of phenologically different populations accounted for a low percentage of the total differentiation. In addition, a sizeable amount of variation could be attributed to the differences among the samples collected from the same population in consecutive years. Thus, we concluded that the "spring" and "summer arion" could not be considered as separate ESUs, although we could attribute conservation value to both forms on the basis of their phenological differentiation and habitat use.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2011</td>
<td class="gt_row gt_right">73</td>
<td class="gt_row gt_right">16</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("3956069", "153582551", "145965922", "3696511", "6171374", "49175491"), c("J. Bereczki", "J. Tóth", "A. Tóth", "E. Bátori", "K. Pecsenye", "Z. Varga")</td></tr>
    <tr><td class="gt_row gt_left">34ef03164bc6e1e1fc30d1443a90fb3bc0e42c53</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2129012792</td>
<td class="gt_row gt_left">10.1017/S0030605300024625</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/34ef03164bc6e1e1fc30d1443a90fb3bc0e42c53</td>
<td class="gt_row gt_left">Why Did the Large Blue Become Extinct in Britain</td>
<td class="gt_row gt_left">In 1979 the Nature Conservancy Council revealed that the large blue butterfly Maculinea arion was probably extinct in Britain, despite much research and valiant efforts to save it. The author, a member of the Institute of Terrestrial Ecology, who since 1972 has been engaged full time on the research and conservation work for the butterfly, tells the story as it is now known.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">1980</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">94</td>
<td class="gt_row gt_right">6</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">50512336, J. Thomas</td></tr>
    <tr><td class="gt_row gt_left">0d5a715fed13542c6ce778dd37d760e6c917a3fb</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2036160600</td>
<td class="gt_row gt_left">10.1115/IMECE2011-62608</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/0d5a715fed13542c6ce778dd37d760e6c917a3fb</td>
<td class="gt_row gt_left">A Chaotic Blue Sky Catastrophe of Butterfly Valves Driven by Solenoid Actuators</td>
<td class="gt_row gt_left">Chilled water systems used in the industry and on board ships are critical for safe and reliable operation. It is hence important to understand the fundamental physics of these systems. This paper focuses in particular on a critical part of the automation system, namely, actuators and valves that are used in so-called “smart valve” systems. The system is strongly nonlinear, and necessitates a nonlinear dynamic analysis to be able to predict all critical phenomena that affect effective operation and efficient design. The derived mathematical model includes electromagnetics, fluid mechanics, and mechanical dynamics. Nondimensionalization has been carried out in order to reduce the large number of parameters to a few critical independent sets to help carry out a broad parametric analysis. The system stability analysis is then carried out by the aid of the tools from nonlinear dynamic analysis. This reveals that the system is unstable in a certain region of the parameter space. The system is also shown to exhibit crisis and chaotic responses; this is characterized using Lyapunov exponents and power spectra. Knowledge and avoidance of these dangerous regimes is necessary for successful and safe operation.Copyright © 2011 by ASME</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2011</td>
<td class="gt_row gt_right">19</td>
<td class="gt_row gt_right">13</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("12817664", "144851044"), c("P. Naseradinmousavi", "C. Nataraj")</td></tr>
    <tr><td class="gt_row gt_left">a3038a4e1a4fd45f118aa242250a3da05e4b4757</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2939400123</td>
<td class="gt_row gt_left">10.1007/s10841-019-00154-w</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/a3038a4e1a4fd45f118aa242250a3da05e4b4757</td>
<td class="gt_row gt_left">The potential of species distribution modelling for reintroduction projects: the case study of the Chequered Skipper in England</td>
<td class="gt_row gt_left">The Chequered Skipper Carterocephalus palaemon inhabits a variety of habitats in NW Europe: heathlands, wet grasslands and chalk grasslands, usually at woodland edges and wide rides and glades in different types of woodlands. It mainly uses broadleaved grasses such as Molinia, Calamagrostis and Brachypodium as host plants. The species became extinct in England in 1976 and an earlier reintroduction attempt in 1995–1999 was unsuccessful. Using species distribution models, we located potential source regions in NW Europe for its reintroduction to England. To do so, we gathered distribution data of the butterfly and environmental variables (Corine Land Cover and climate data) from four regions in Belgium (Belgian Campine, Fagne–Famenne–Calestienne, Ardenne–Thiérache and Gaume–Lorraine), two in the Netherlands (Achterhoek and Dutch Campine) and one in the United Kingdom (Argyll, Scotland). We calibrated the models in these regions and projected them to the Rockingham Forest landscape, the reintroduction site in England. The Fagne–Famenne–Calestienne and the Gaume–Lorraine model resulted in the highest average probability when projected to the Rockingham Forest landscape. Based on additional expert knowledge on potential host plant abundance and the presence of large source populations, the Fagne–Famenne–Calestienne was selected as the source region for the reintroduction of the Chequered Skipper to England. To assess the possible impact of climate change, we also built a model with present-day climate data in NW Europe and modelled the probability of occurrence in the Rockingham Forest landscape in the year 2070. The species was predicted to increase in the Rockingham Forest landscape under future climate conditions.</td>
<td class="gt_row gt_left">Journal of Insect Conservation</td>
<td class="gt_row gt_right">2019</td>
<td class="gt_row gt_right">132</td>
<td class="gt_row gt_right">8</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("46811706", "2046570650", "66796610", "32783151", "88692697", "100959461", "49674554", "40488050", "12558761", "101297632", "144101650", "4013632", "1411378757", "35046663", "5442982"), c("D. Maes", "S. Ellis", "P. Goffart", "K. Cruickshanks", "C. V. Swaay", "R. Cors", "M. Herremans", "Kristijn R. R. Swinnen", "C. Wils", "Sofie Verhulst", "L. Bruyn", "E. Matthysen", "Susannah O’Riordan", "D. Hoare", "N. Bourn")</td></tr>
    <tr><td class="gt_row gt_left">4a1c18fb1120946dcc28917b52c029cb802a956f</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">3100307372</td>
<td class="gt_row gt_left">10.1177/1940082920958397</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/4a1c18fb1120946dcc28917b52c029cb802a956f</td>
<td class="gt_row gt_left">Post-Release Monitoring Diet Quality and Nutritional Status of Reintroduced Burchell’s Zebra and Blue Wildebeest in Maputo Special Reserve, Mozambique</td>
<td class="gt_row gt_left">The reintroduction of wild animal species into conservations areas is widely used to restore populations of species endangered with extinction. The assessment of the quality of the diet and the nutritional status of the animals is crucial to the success of herbivore reintroduction programs, given that adequate nutrition is essential to ensure the survival and fertility of ungulates. Given this, the present study investigated the quality of the diet and nutritional status of Burchell’s zebra (Equus burchelli, Smuts 1832) and blue wildebeest (Connochaetes taurinus, Burchell 1823) reintroduced into Maputo Special Reserve (MSR), in southern Mozambique. The study was conducted between July 2016 and June 2017, and the data were collected through direct observation, by driving a vehicle along the roads within the reserve that pass through the vegetation cover where zebra and wildebeest are known to occur most frequently. The composition of the diet and specific feature of the grass grazed by the two species, such as greenness (an indication of food quality) were assessed. Crude fecal protein and phosphorus were determined to evaluate the nutritional status of the two herbivore species. Both herbivores were pure grazers, consuming a diet composed entirely (100%) of grass. Aristida barbicollis was the principal component of the diets of both zebra and wildebeest and both species grazed almost entirely on green grass (91–100% of greenness). However, wildebeest consumed significantly more green grass (which has a better nutrient content) than zebra, which tolerated a considerably larger proportion of browner grass in both seasons. The levels of crude protein and phosphorus in the zebra and wildebeest fecal samples were not below threshold of nutritional stress recommended for large southern African herbivores, which indicates that neither the zebra nor the wildebeest populations in MSR are undernourished at the present time and that the quality of the forage found in the study area is not a factor limiting the persistence of the reintroduced populations of either species.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2020</td>
<td class="gt_row gt_right">63</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("2042753099", "39619640"), c("Luís Jr. Comissario Mandlate", "F. Rodrigues")</td></tr>
    <tr><td class="gt_row gt_left">45456ee87b9645482c414fd55189f67b7e20e18c</td>
<td class="gt_row gt_left">6835262</td>
<td class="gt_row gt_left">2973543763</td>
<td class="gt_row gt_left">10.3390/insects10100311</td>
<td class="gt_row gt_left">31547512</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/45456ee87b9645482c414fd55189f67b7e20e18c</td>
<td class="gt_row gt_left">Using Noninvasive Genetic Sampling to Survey Rare Butterfly Populations</td>
<td class="gt_row gt_left">Advances in nondestructive genetic sampling techniques continue to offer new opportunities for studying organisms, particularly those of conservation concern where more traditional invasive sampling methods are often not available. As part of a proof-of-concept, we investigated the effectiveness of using the chorion from residual butterfly egg debris as a source of viable genetic material for analysis. Laboratory material from a captive breeding population of the federally endangered Miami blue butterfly (Cyclargus thomasi bethunebakeri) was used to test efficacy and refine the methodology. The resulting best practices were subsequently evaluated using field-collected material from extant north Florida populations of the at-risk frosted elfin butterfly (Callophyrs irus). Our results demonstrated that it is possible to extract DNA of sufficiently high quantity and quality for successful gene sequencing. We additionally describe a simple, low-cost, and reliable method of collecting and storing egg debris samples that can be consistently adopted for field or laboratory work as well as deployed with projects that have a larger geographic scope and/or involve citizen scientists. Potential limitations related to field sample collection are discussed as well as needs for future evaluation.</td>
<td class="gt_row gt_left">Insects</td>
<td class="gt_row gt_right">2019</td>
<td class="gt_row gt_right">29</td>
<td class="gt_row gt_right">2</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("40137420", "32200332", "2110394507", "80460212"), c("Caroline G Storer", "J. Daniels", "Lei Xiao", "Kristin Rossetti")</td></tr>
    <tr><td class="gt_row gt_left">ca15efbe61f7a60dcaf48fb20cc44b73d3e03666</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2167226479</td>
<td class="gt_row gt_left">10.14411/EJE.2008.018</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/ca15efbe61f7a60dcaf48fb20cc44b73d3e03666</td>
<td class="gt_row gt_left">Patch size and connectivity influence the population turnover of the threatened chequered blue butterfly, Scolitantides orion (Lepidoptera: Lycaenidae)</td>
<td class="gt_row gt_left">Chequered blue butterfly, Scolitantides orion (Lepidoptera: Lycaenidae) has severely declined in many parts of Europe and is currently red-listed in many countries. We studied the population structure and turnover of the species in a lake-island system in a National Park in eastern Finland over a three-year period. The incidence of the chequered blue on the suitable islands (n = 41) and habitat patches (n = 123) was high: an average of 82% of the islands and patches were occupied over the three year period. At the island scale, the annual population turnover rate was 17%, with an extinction and colonization rate of 7% and 10%, respectively. At the patch scale, the annual population turnover was 16%, with 7% extinction and 9% colonization rate. Islands that were occupied over the three year period had a larger area of suitable habitat than islands in which turnover events were observed. At the patch scale, turnover events were observed in small and poorly connected patches. Patchy occurrence of the host plant and observed extinction-colonization dynamics suggest that the chequered blue population confirms a metapopulation structure. Although the local populations are small, the observed high patch occupancy and balanced population turnover indicates that the metapopulation is not in immediate risk of extinction.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2008</td>
<td class="gt_row gt_right">33</td>
<td class="gt_row gt_right">6</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("4242993", "21655026", "15821731", "3896090"), c("A. Komonen", "Tuuli Tikkamäki", "Niina Mattila", "J. S. Kotiaho")</td></tr>
    <tr><td class="gt_row gt_left">0219e68dd93f54fceb0ee3ab34e481d17f483163</td>
<td class="gt_row gt_left">6580300</td>
<td class="gt_row gt_left">2943711065</td>
<td class="gt_row gt_left">10.1002/ece3.5221</td>
<td class="gt_row gt_left">31236235</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/0219e68dd93f54fceb0ee3ab34e481d17f483163</td>
<td class="gt_row gt_left">Postrelease monitoring habitat selection by reintroduced burchell's zebra and blue wildebeest in southern Mozambique</td>
<td class="gt_row gt_left">Abstract Aim In Africa, reintroduction of wild animal species to conservation areas is a common practice, for the recovery or restoration of populations. Effective monitoring of reintroduced species requires understanding of basic ecological requirements such as habitat selection of these species in the new environment. Therefore, the present study investigated the habitat selection of zebra and wildebeest following their reintroduction into Maputo Special Reserve, south Mozambique, and we use binary logistic analyses to investigate the relative influence of biotic and abiotic factors in determining the habitat use. Location Maputo Special Reserve, south Mozambique. Methods We conducted the study from July 2016 to June 2017. The data were collected by direct observation, driving the vehicle along the reserve's roads that covered the vegetation communities where zebras and wildebeest are known to commonly occur. Habitat selection was calculated using selection indices (Manly's alpha), and binary logistic analyses were used to investigate the relative influence of biotic and abiotic factors in determining the habitat use. Results The arboreal savanna was the preferred habitat by both herbivore species. Habitat use of zebra appeared to be strongly determined by characteristics such as high grass cover, high grass greenness, and distance to water, while the habitat use by wildebeest, was strongly affected by grass height. Main conclusions Both zebra and wildebeest prefer arboreal savanna, forage selection likely drove preference of this habitat. Greater grass cover and greater percentage greenness of the grass both significantly increased the odds of zebra use of habitat, whereas the odds of use decreased with increases in distance to water, meaning an opportunity to ingest large amounts of grass biomass with higher quality, and this opportunity decreases with increasing in distance to water. Grass height was in the highest‐ranking model predicting habitat use by wildebeest, and during the dry season the use of habitat increased with increasing grass height, suggesting that selecting areas with tall grasses by wildebeest equated to choosing areas with higher grass quantity, as the food intake rate increases with grass height.</td>
<td class="gt_row gt_left">Ecology and evolution</td>
<td class="gt_row gt_right">2019</td>
<td class="gt_row gt_right">47</td>
<td class="gt_row gt_right">3</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("2042753099", "82205738", "39619640"), c("Luís Jr. Comissario Mandlate", "E. Cuamba", "F. Rodrigues")</td></tr>
    <tr><td class="gt_row gt_left">8452a3ee6c3a49e9ca9bd8805a86a5b2c50d09e5</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">1985037207</td>
<td class="gt_row gt_left">10.1016/S0006-3207(97)00165-1</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/8452a3ee6c3a49e9ca9bd8805a86a5b2c50d09e5</td>
<td class="gt_row gt_left">Habitat use by the endangered Karner blue butterfly in oak woodlands : the influence of canopy cover</td>
<td class="gt_row gt_left">Abstract The Karner blue butterfly Lycaeides melissa samuelis is an endangered species residing in the Great Lakes and northeastern regions of the United States. Increased canopy cover is a major factor implicated in the decline of the Karner blue at many locales. Therefore, we examined how the butterfly's behavior varied with canopy cover. Adult males at Indiana Dunes National Lakeshore used habitat under canopy openings for nearly 90% of their activities; females used openings and shaded areas more equally. The frequency of oviposition on the sole host plant, wild lupine Lupinus perennis, was highest under 30–60% canopy cover even though lupine was more abundant in more open areas. Larvae fed preferentially on larger lupine plants and on lupines in denser patches. However, lupines were generally larger in the shade. Therefore, shade-related trade-offs existed between lupine abundance and distribution of larval feeding and oviposition. Also, heterogeneity of shading by sub-canopy woody vegetation was greater at oviposition sites than at sites where lupine did not grow. Given the importance of shade heterogeneity, a mixture of canopy openings and shade, on a scale similar to daily adult movement range, should be beneficial for this butterfly.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">1998</td>
<td class="gt_row gt_right">18</td>
<td class="gt_row gt_right">95</td>
<td class="gt_row gt_right">14</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("6440548", "2094530", "21741779"), c("R. Grundel", "N. Pavlovic", "Christina L. Sulzman")</td></tr>
    <tr><td class="gt_row gt_left">9ab94718c5107986e745e0f61137698fdd9142ed</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">2890667120</td>
<td class="gt_row gt_left">10.2494/PHOTOPOLYMER.31.113</td>
<td class="gt_row gt_left">NA</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/9ab94718c5107986e745e0f61137698fdd9142ed</td>
<td class="gt_row gt_left">Fabrication Process of Large-area Morpho -color Flexible Film via Flexible Nano-imprint Mold</td>
<td class="gt_row gt_left">Morpho butterfly’s blue is the structural color given by optical interference, that contradicts its single coloration in too wide angular range. After proven the principle of the coloration by mimicking the specific nanostructures of their scales, we found the reproduced Morpho-color to serve wide applications, because it can produce a brilliant single color in wide angular range with high reflectivity for longtime without chemical pigment. We have then developed various techniques for practical applications of the specific color. One of the remaining issues is to mass-produce the large-area flexible film, which has long been difficult because of the process containing both nano-imprint and multilayer deposition. Thus, we developed a new process using the flexible mold and simple film-detachment system.</td>
<td class="gt_row gt_left"></td>
<td class="gt_row gt_right">2018</td>
<td class="gt_row gt_right">4</td>
<td class="gt_row gt_right">1</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("2028116774", "47068228", "50158581", "46955518", "2557506"), c("A. Saito", "K. Ishibashi", "Junpei Ohga", "Y. Hirai", "Y. Kuwahara")</td></tr>
    <tr><td class="gt_row gt_left">edfe97b3bc155a4a42a2853b85fa5a005b188378</td>
<td class="gt_row gt_left">6028894</td>
<td class="gt_row gt_left">2805049708</td>
<td class="gt_row gt_left">10.1007/s00359-018-1267-z</td>
<td class="gt_row gt_left">29869100</td>
<td class="gt_row gt_left">https://www.semanticscholar.org/paper/edfe97b3bc155a4a42a2853b85fa5a005b188378</td>
<td class="gt_row gt_left">The giant butterfly-moth Paysandisia archon has spectrally rich apposition eyes with unique light-dependent photoreceptor dynamics</td>
<td class="gt_row gt_left">The palm borer moth Paysandisia archon (Burmeister, 1880) (fam. Castniidae) is a large, diurnally active palm pest. Its compound eyes consist of ~ 20,000 ommatidia and have apposition optics with interommatidial angles below 1°. The ommatidia contain nine photoreceptor cells and appear structurally similar to those in nymphalid butterflies. Two morphological ommatidial types were identified. Using the butterfly numbering scheme, in type I ommatidia, the distal rhabdom consists exclusively of the rhabdomeres of photoreceptors R1–2; the medial rhabdom has contributions from R1–8. The rhabdom in type II ommatidia is distally split into two sub-rhabdoms, with contributions from photoreceptors R2, R3, R5, R6 and R1, R4, R7, R8, respectively; medially, only R3–8 and not R1–2 contribute to the fused rhabdom. In both types, the pigmented bilobed photoreceptors R9 contribute to the rhabdom basally. Their nuclei reside in one of the lobes. Upon light adaptation, in both ommatidial types, the rhabdoms secede from the crystalline cones and pigment granules invade the gap. Intracellular recordings identified four photoreceptor classes with peak sensitivities in the ultraviolet, blue, green and orange wavelength regions (at 360, 465, 550, 580 nm, respectively). We discuss the eye morphology and optics, the photoreceptor spectral sensitivities, and the adaptation to daytime activity from a phylogenetic perspective.</td>
<td class="gt_row gt_left">Journal of Comparative Physiology A</td>
<td class="gt_row gt_right">2018</td>
<td class="gt_row gt_right">92</td>
<td class="gt_row gt_right">9</td>
<td class="gt_row gt_right">0</td>
<td class="gt_row gt_center">TRUE</td>
<td class="gt_row gt_center">c("3067909", "46269818", "18097244", "4900499", "3524164", "3582785"), c("P. Pirih", "Marko Ilic", "Jerneja Rudolf", "K. Arikawa", "D. Stavenga", "G. Belušic")</td></tr>
  </tbody>
  
  
</table>
</div>

``` r
dois <- ss$data %>% pluck("externalIds.DOI")
```

blah said @forister2020

@kajzer-bonkRelativeContributionMatrix2016 @Rasmussen2019

@Yu2018

@ntprese2016

\[@hill2016; @flowers2016; @fox2017; @mayer2010; @flowers2005;
@flowers2013; @soljak2008\]

## References
