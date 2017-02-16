Use case for integrating ODK-MitM system with Gap and Sage

1. Computation in Sage
   
   1. MitM -> Sage
      something that retuns a permutation group
   1. Sage -> MitM
      OMA(
       OMS(Sage.permuationGroup)
       OMI(4)
      )

1. MitM translation
   
   1. in
      OMA(
        OMS(Sage.permuationGroup)
        OMI(4)
      )
   1. out
      OMA(
        OMS(GAP.permutationGroup),
        OMI(4)
      )

1. Computation in GAP
   
   1. MitM -> GAP
      OMA(
       OMS(GAP.generators),
       OMA(
         OMS(GAP.permutationGroup),
         OMI(4)
       )
      )

   1. GAP -> MMT
      OMA(
        OMS(GAP.List),
        OMA(
          OMS(GAP.permutation),
          OMI(1),
          OMI(2)
        ),
        ...
      )

1. MitM translation
   Now, for example, another translation step can be used to translate GAP's result back to Sage.
