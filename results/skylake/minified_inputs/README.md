Execute the `compute.py` script while in this directory. Results are in millions of CPU cycles.

```
                                                 original   minified
apache_builds
 simdjson                                  (74) :    0.19  0.17 
 RapidJSON (insitu)                        (74) :    0.55  0.49 
 sajson                                    (74) :    0.34  0.28 

citm_catalog
 simdjson                                  (29) :    2.34  1.64 
 RapidJSON (insitu)                        (29) :    6.30  3.49 
 sajson                                    (29) :    4.79  2.40 

github_events
 simdjson                                  (82) :    0.09  0.08 
 RapidJSON (insitu)                        (82) :    0.29  0.25 
 sajson                                    (82) :    0.20  0.16 

gsoc-2018
 simdjson                                  (92) :    3.58  3.39 
 RapidJSON (insitu)                        (92) :   11.16 10.60 
 sajson                                    (92) :    8.76  8.19 

instruments
 simdjson                                  (49) :    0.36  0.29 
 RapidJSON (insitu)                        (49) :    0.98  0.75 
 sajson                                    (49) :    0.70  0.47 

marine_ik
 simdjson                                  (61) :   10.62 10.20 
 RapidJSON (insitu)                        (61) :   22.33 20.24 
 sajson                                    (61) :   15.11 12.88 

mesh
 simdjson                                  (90) :    2.56  2.54 
 RapidJSON (insitu)                        (90) :    6.06  6.00 
 sajson                                    (90) :    3.88  3.71 

mesh.pretty
 simdjson                                  (48) :    3.64  3.19 
 RapidJSON (insitu)                        (48) :    8.50  6.56 
 sajson                                    (48) :    5.61  4.08 

```
random
 simdjson                                  (90) :    1.22  1.19 
 RapidJSON (insitu)                        (90) :    2.96  2.91 
 sajson                                    (90) :    2.08  1.96 

twitter
 simdjson                                  (74) :    0.99  0.88 
 RapidJSON (insitu)                        (74) :    3.08  2.41 
 sajson                                    (74) :    2.11  1.63 

```
