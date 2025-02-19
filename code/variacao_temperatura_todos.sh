# Calcula a variação da temperatura para todos os países

echo "variacao_C_por_ano,pais"

for i in dados/temperatura/*.csv
do
    python code/variacao_temperatura.py $i
done