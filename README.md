# serialize-syntax-introducer

Documentation: https://docs.racket-lang.org/serialize-syntax-introducer/index.html

```racket
(require serialize-syntax-introducer)
```

Functions for serializing syntax introducers into a values that can be embedded into syntax objects.
These syntax objects can be compiled, read back as syntax, and then restored back to functions that
introduce the same scopes.

```racket
(serialize-syntax-introducer intro) → SerializedSyntaxIntroducer

  intro : (-> syntax? syntax?)
```

```racket
(deserialize-syntax-introducer v) → (-> syntax? syntax?)

  v : SerializedSyntXIntroducer
```
