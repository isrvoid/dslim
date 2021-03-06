DFLAGS_UNITTEST := -unittest
DFLAGS_DEBUG := -debug

ifeq ($(DEBUG),1)
	DFLAGS := $(DFLAGS_DEBUG)
else
	DFLAGS := $(DFLAGS_UNITTEST)
endif

SRCDIR := dslim
BUILDDIR := build

UNITTEST_SRC := $(shell find $(SRCDIR) -type f -name "*.d")

$(BUILDDIR)/unittest: $(UNITTEST_SRC)
	@dmd $(DFLAGS) $^ -of$@

clean:
	-@$(RM) $(wildcard $(BUILDDIR)/*)

.PHONY: clean
