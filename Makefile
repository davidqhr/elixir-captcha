CFLAGS= -g

HEADER_FILES = src
SOURCE_FILES = src/captcha.c

OBJECT_FILES = $(SOURCE_FILES:.c=.o)

priv/captcha: clean priv $(OBJECT_FILES)
	mkdir -p priv
	$(CC) -I $(HEADER_FILES) -o $@ $(LDFLAGS) $(OBJECT_FILES) $(LDLIBS)

clean:
	rm -f priv/captcha $(OBJECT_FILES) $(BEAM_FILES)
