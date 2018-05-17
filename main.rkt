#lang racket/base

(provide
 ;; type SerializedStxIntro

 ;; [Syntax -> Syntax] -> SerializedStxIntro
 serialize-syntax-introducer

 ;; SerializedStxIntro -> [Syntax -> Syntax]
 deserialize-syntax-introducer
 )

(require racket/match)

;; A StxIntroDelta is a
;;   (syntax-introducer-delta Id Id)
(struct syntax-introducer-delta [start end] #:prefab)

;; serialize-syntax-introducer : [Syntax -> Syntax] -> StxIntroDelta
(define (serialize-syntax-introducer f)
  (define start (datum->syntax #f 'stx))
  (define end (f start))
  (syntax-introducer-delta start end))

;; deserialize-syntax-introducer : StxIntroDelta -> [Syntax -> Syntax]
(define (deserialize-syntax-introducer d)
  (match (stx-e d)
    [(syntax-introducer-delta start end)
     (make-syntax-delta-introducer end start)]))

;; --------------------------------------------------------------

(define (stx-e stx)
  (if (syntax? stx) (syntax-e stx) stx))

