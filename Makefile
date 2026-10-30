#  Compile every Typst document in the course directories to PDF.

TYPST      ?= typst
TYPSTFLAGS ?= --root .

INPUT_DIRS := calculus_2 linear_algebra data_analysis

SOURCES := $(foreach dir,$(INPUT_DIRS),$(wildcard $(dir)/*.typ))
PDFS    := $(SOURCES:.typ=.pdf)

.DEFAULT_GOAL := all
.PHONY: all clean check-input-dirs $(INPUT_DIRS)

all: check-input-dirs $(PDFS)

# Warn (but keep going) when an input directory is missing
check-input-dirs:
	@for dir in $(INPUT_DIRS); do \
		[ -d "$$dir" ] || echo "Directory '$$dir' not found." >&2; \
	done

# One PDF per .typ file
%.pdf: %.typ
	@$(TYPST) compile "$<" "$@" $(TYPSTFLAGS) \
		&& echo "Compiled: $< -> $@" \
		|| echo "Failed to compile $<" >&2

# Optional per-directory targets, e.g. `make calculus_2`
define DIR_TARGET
$(1)_PDFS := $$(patsubst %.typ,%.pdf,$$(wildcard $(1)/*.typ))
$(1): $$($(1)_PDFS)
endef

$(foreach dir,$(INPUT_DIRS),$(eval $(call DIR_TARGET,$(dir))))

clean:
	$(RM) $(PDFS)