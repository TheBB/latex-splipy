# Splipy published software article

## Resources

* [Youtube video on software publication](https://youtu.be/KA3ds9-FCDc)
* [SoftwareX](https://www.journals.elsevier.com/softwarex)
* [Splipy](https://github.com/sintefmath/Splipy)
* [Author guidelines (pdf)](https://www.elsevier.com/journals/softwarex/2352-7110?generatepdf=true)

In particular we note the following guidelines:

> 4. The manuscript must be submitted in single column. The following constraints apply: Word count: max. 3000.
> a. Excluding: title, authors, affiliations, references, metadata tables.
> b. Including: abstract, running text, captions, footnotes.
> c. Max. 6 figures.
> 5. The manuscript must have line numbers.
> 6. At least one of the two mandatory metadata tables located at the end of the article template must be filled in and included in the manuscript.


## Compile
```
latexmk -pdf doc.tex
```

## Word Count
`detex` strips away any latex-code and `wc` counts the words that you are left with:
```
detex doc.tex | wc --words
```
