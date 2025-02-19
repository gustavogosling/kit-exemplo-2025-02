# Formato geral
#
# alvo: pre-requisito1 pre-requisito2....
#    comandos que usam os pre-requisitos para geral o alvo

all: resultados/variacao_temperatura.csv resultados/numero_de_dados.txt figuras/variacao_temperatura.png

clean:
	rm -rfv resultados dados

resultados/numero_de_dados.txt: dados/temperature-data.zip
	mkdir -p resultados
	ls dados/temperatura/*.csv | wc -l > resultados/numero_de_dados.txt
	
dados/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py dados
	
figuras/variacao_temperatura.png: code/plota_dados.py
	mkdir -p figuras
	python code/plota_dados.py resultados/variacao_temperatura.csv figuras/variacao_temperatura.png
	
resultados/variacao_temperatura.csv: code/variacao_temperatura_todos.sh dados/temperature-data.zip
	mkdir -p resultados
	bash code/variacao_temperatura_todos.sh > resultados/variacao_temperatura.csv