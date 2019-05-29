# Assessing the role of Stage 1


Some observers have pointed out that our stage 1 might be perceived as just
a fast way to skip white spaces. If this were true, and if the simdjson 
is heavily biased toward skipping white space characters quickly, then processing
minified JSON documents should be unfavorable to simdjson.

The script in this repository verifies that it is not the case.