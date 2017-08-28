#lang slideshow

(require slideshow/text)
(require slideshow/repl)
(require rsvg)
(require pict)


(current-main-font "TeX Gyre Pagella")


(define eu-logo (scale (bitmap "img/Flag_of_Europe.png") 0.1))
(define eu-banner (ht-append 15 eu-logo
                             (vl-append
                              (text "OpenDreamKit")
                              (text "A project funded by the Horizon 2020 - European Research Infrastructures Work Programme"))))
(define odk-logo (scale (bitmap "img/ODK_elected_logo.png") 0.4))
(define ustan-logo (scale (bitmap "img/USTAN_logo.png") 0.3))

(define gap-ismagma (scale (bitmap "img/gap-ismagma.png") 0.8))
(define gap-graph (scale (bitmap "img/gap-graph.png") 0.09))

  
(define bkg (blank))
(define current-bkg (make-parameter bkg))
(define original-slide-assembler (current-slide-assembler))
(current-slide-assembler
 (λ (a b c)
   (define main 
     (ct-superimpose (lb-superimpose (filled-rectangle
                                      #:draw-border? #f
                                      #:color "white"
                                      client-w client-h)
                                     eu-banner)
                     (original-slide-assembler a b c)))
     (refocus (cc-superimpose (current-bkg) main)
              main)))

(define fullgraph
  (scale (svg-file->pict "tikz/fullgraph.svg") 2))
(define stargraph
  (scale (svg-file->pict "tikz/stargraph.svg") 2))
(define mstargraph
  (scale (svg-file->pict "tikz/mstargraph.svg") 2))
(define three-graphs
  (scale (svg-file->pict "tikz/three-graphs.svg") 2))

(slide
 (text "SCSCP and OpenMath" (current-main-font) 56)
 (small (t "(and OpenDreamKit)"))
 (bt "Markus Pfeiffer and Alexander Konovalov")
 ustan-logo
 (small (tt "markus.pfeiffer@st-andrews.ac.uk"))
 (small (tt "alexander.konovalov@st-andrews.ac.uk"))
 (t "2017-07-17"))

(slide
 odk-logo
 (tt "http://opendreamkit.org"))

(slide
 #:title "OpenDreamKit"
 (item "a \"Virtual Research Environment\" for mathematics")
 'next
 (item "composed of Free Software Components")
 'next
 (item "for example GAP, Sage, Singular, Jupyter, Pari/GP, etc...")
 'next
 (item "and preceding composition efforts: OpenMath, SCSCP, etc."))

(slide
 #:title "Challenge: Interfacing"
 (item "(sometimes subtly) different assumptions and implementations")
 'next
 (item "hand-crafted interfaces")
 'next
 (item "error prone")
 'next
 (item "requires understanding of at least two systems"))


(slide
 #:title "Interfacing"
 (t "Option 1: Peer-to-Peer")
 fullgraph
 (t "n^2 / 2 translations"))

(slide
 #:title "Interfacing"
 (t "Option 2: Industry Standard")
 stargraph
 (t "2n - n translations"))

(slide
 #:title "Interfacing"
 (t "Option 3: Open Standard")
 mstargraph
 (t "2n translations"))

(slide #:title "Interfacing"
 'alts
 (list (list (ht-append 50 fullgraph stargraph mstargraph) )
       (list
        (ht-append 50 fullgraph stargraph
                   (frame mstargraph #:color "chartreuse" #:line-width 3))
          (t "Let's establish Option 3")
          'next
          (t "With OpenMath, SCSCP, and MMT")
          'next
          (t "Call it \"Math in the Middle\""))))

(slide #:title "OpenMath"
       (para #:align 'center
             "OpenMath is an emerging standard for representing mathematical objects "
             "with their semantics, allowing them to be exchanged between computer "
             "programs, stored in databases, or published on the worldwide web."))

(slide #:title "SCSCP"
       (item "Symbolic Computation Software Composability Protocol")
       (item "Specified in OpenMath CDs " (it "scscp1") " and " (it "scscp2"))
       (item "Simple RPC protocol")
       (subitem (small (tt "procedure_call")))
       (subitem (small (tt "procedure_completed")))
       (subitem (small (tt "procedure_terminated")))
       )

(slide #:title "GAP"
       (item "GAP " (small (tt "http://www.gap-system.org")))
       (item "Programming Language")
       (item "Computer Algebra System")
       (item "Library of Mathematical Functionality")
       (item "Group Theory")
       (item "Data Libraries")
       (item "Packages"))

(slide #:title "GAP"
       (item "Importantly: OpenMath & SCSCP Packages")
       (item "OpenMath CDs that cover some basic data + Conversion"))

(slide #:title "Interfacing with GAP; The plan"
       (item "Step 1: Export Type Information from GAP")
       (item "Step 2: Generate CDs")
       (item "Step 3: Formalise Group Theory in MMT, bootstrap MitM")
       (item "Step 4: Align GAP with formalisation")
       (item "Step 5: Formalise some Rings and Ideals in MMT")
       (item "Step 6: Align Singular with formalisation")
       (item "Step 7: Successful Demonstration of MitM"))

(slide #:title "IsMagma in GAP"
       gap-ismagma)

(slide gap-graph)

(slide
 (text "Questions? / Discussion" 'default 54))

;(slide
; #:title "Test REPL stuff"
; ; shows the result of running either module (use F5)
; (repl-area
;  #:prompt "gap> "
;  #:width (* client-w 7/8)
;  #:height (*  client-h 7/8)
;  
;  "(define x 4)"))
