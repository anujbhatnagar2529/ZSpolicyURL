# ZSpolicyURL

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

         Possible ways to call the utility...

         ---------------------------------------
         For Staging and Production Environment-
         Usage: url.sh -a [stg|prd] -b [apac|emea|amer] -c [devid]

         For Client Environment-
         Usage: url.sh -a [cmr] -b [apac|emea|amer] -c [cmrid]
         ---------------------------------------

        -a can be stg or prd or cmr, to idenity link is for prod or stage or customer environment
        -b devid or cmrid, any one is acceptable subject type of env selected, .i.e. for cmr env only cmrid will be accepted

        Final results would be
         Step 1:
                [production|staging|customer].[APAC|EMEA|AMER].[developerID|customerID].[randomString]

                 prd.apac.d1234.mywup
                 OR
                 cmr.apac.c1234.mywup

         Step 2:
                Storing the Data for Future Reference
                File - /tmp/urlinfo.txt

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
