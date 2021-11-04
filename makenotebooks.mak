# GNU Make makefile to convert bunch of IPython notebooks to HTML

find_files := $(wildcard *.ipynb)
html_files := $(find_files:.ipynb=.html)

all: $(html_files)

# Convert each IPython notebook to a flat HTML file
%.html: %.ipynb
	jupyter nbconvert --to html $<

# Example how to execute. Does not convert, keeps as notebook.
# https://nbconvert.readthedocs.io/en/latest/execute_api.html
execute5:
	jupyter nbconvert --ExecutePreprocessor.store_widget_state=True --to notebook --execute script5.ipynb
