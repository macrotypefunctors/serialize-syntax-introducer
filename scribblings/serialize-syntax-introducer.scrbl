#lang scribble/manual

@(require (for-label racket/base
                     serialize-syntax-introducer))

@title{Serializing Syntax Introducers}

@defmodule[serialize-syntax-introducer]

@deftogether[[
  @defproc[(serialize-syntax-introducer [intro (-> syntax? syntax?)]) any/c]
  @defproc[(deserialize-syntax-introducer [v any/c]) (-> syntax? syntax?)]
]]{
Serializes a syntax introducer into a value that can be embedded
into a syntax object, compiled, read back as syntax, and restored
to a function that introduces the same scopes.
}

