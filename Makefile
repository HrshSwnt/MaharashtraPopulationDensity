PYTHON ?= python3
PIP ?= $(PYTHON) -m pip
JUPYTER ?= jupyter

.PHONY: setup run clean

setup:
	$(PYTHON) -m pip install --upgrade pip
	$(PIP) install jupyter pandas geopandas folium openpyxl pyogrio pyproj shapely branca numpy requests

run:
	$(JUPYTER) nbconvert --to notebook --execute map_gen.ipynb --inplace
	test -f index.html
	mkdir -p _site
	cp index.html _site/index.html

clean:
	rm -rf _site
	rm -f index.html
