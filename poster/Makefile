# Default value for LaTeX compiler
LC?=xelatex -halt-on-error

CLASSES_WITH_HISTORY=sintefprojectmemo.pdf sintefprojectoffer.pdf \
                     sintefprojectproposal.pdf sintefreport.pdf \
                     sinteftestreport.pdf
CLASSES_WITH_ATTACHMENTS=sintefcontract.pdf sintefprojectmemo.pdf \
                         sintefprojectoffer.pdf sintefreport.pdf \
						 sintefsubcontractor.pdf sinteftestreport.pdf
DOCCLASSES=sintefconfirmation.pdf sintefcontract.pdf sintefdoc.pdf \
           sinteffax.pdf sintefletter.pdf sintefmeetingnotice.pdf \
           sintefmemo.pdf sintefminutes.pdf sintefstatus.pdf \
           sintefsubcontractor.pdf
CLASSES=sintefposter.pdf sintefbeamer.pdf $(CLASSES_WITH_ATTACHMENTS) \
        $(CLASSES_WITH_HISTORY) $(DOCCLASSES)

PACKAGES= beamersintefntnu.pdf sintefcolor.pdf sintefenclosures.pdf

all: $(CLASSES) $(PACKAGES)

# General pattern for generation of PDF documentation
# Each PDF depends on its respective TeX file.
%.pdf: %.tex
	$(LC) $< && $(LC) $<

# Classes depend on their CLS file, sintefcolor, sinteflabels and the logo
$(CLASSES): $(subst .pdf,.cls,$@) sintefcolor.sty sinteflabels.sty \
            Sintef_logo_blue.pdf

# In addition, all classes, except sintefposter, depend on sintefdoc.cls
$(CLASSES_WITH_HISTORY) $(DOCCLASSES): sintefdoc.cls

# Classes with history section depend on sintefhistory
$(CLASSES_WITH_HISTORY): sintefhistory.sty

# Classes with attachment section depend on sintefattachments
$(CLASSES_WITH_ATTACHMENTS): sintefattachments.sty

# Project proposals are project offers with a disclaimer, therefore dependency
sintefprojectproposal.pdf: sintefprojectoffer.cls

# Additional dependencies of package documentations
beamersintefntnu.pdf: beamerthemesintefntnu.sty Sintef_logo_black.pdf \
                      NTNU_logo.pdf
sintefcolor.pdf: sintefcolor.sty sintefdoc.cls
sintefenclosures.pdf: sintefenclosures.sty sintefreport.cls sinteflabels.sty

.PHONY: clean
clean:
	git clean --force -d -x --quiet --exclude="*.pdf" --exclude="sintefconfig.tex"

.PHONY: wipe
wipe:
	git clean --force -d -x --quiet --exclude="sintefconfig.tex"

.PHONY: dist
dist:
	make all
	make clean
	tar --create --gzip --file "sintex.`date --iso-8601`.tar.gz" --exclude-vcs --exclude="sintefconfig.tex" *
