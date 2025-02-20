# Formato geral
#
# alvo: pre-requisito1 pre-requisito2....
#    comandos que usam os pre-requisitos para geral o alvo

all: paper/paper.pdf resultados/numero_de_dados.txt

clean:
	rm -rfv resultados dados figuras paper/paper.pdf paper/paises.tex
	
paper/paper.pdf: paper/paper.tex figuras/variacao_temperatura.png paper/referencias.bib paper/paises.tex
	tectonic -X compile paper/paper.tex

paper/paises.tex: code/lista_paises.py
	python code/lista_paises.py dados/temperatura > paper/paises.tex
	
resultados/numero_de_dados.txt: dados/temperature-data.zip
	mkdir -p resultados
	ls dados/temperatura/*.csv | wc -l > resultados/numero_de_dados.tex
	
dados/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py dados
	
figuras/variacao_temperatura.png: code/plota_dados.py resultados/variacao_temperatura.csv
	mkdir -p figuras
	python code/plota_dados.py resultados/variacao_temperatura.csv figuras/variacao_temperatura.png
	
resultados/variacao_temperatura.csv: code/variacao_temperatura_todos.sh dados/temperature-data.zip
	mkdir -p resultados
	bash code/variacao_temperatura_todos.sh > resultados/variacao_temperatura.csv