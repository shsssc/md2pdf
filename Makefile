SRCS = $(wildcard *.md)

PROGS = $(patsubst %.md,%.pdf,$(SRCS))

all: $(PROGS)

%.pdf: %.md
	pandoc -f markdown -t latex -i "$<" -o outputTemp.latex --template=./latex.template;\
	job=$$(echo "$<" | sed -e 's/\.md$$//g');\
	pdflatex -jobname="$$job" ./outputTemp.latex;\
	rm -rf outputTemp.latex;\
	rm -rf *.aux;\
	rm -rf *.log;\
	rm -rf *.out;\
 	
clean: 
	rm -f $(PROGS)
