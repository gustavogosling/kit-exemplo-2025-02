import sys
import pathlib
import pandas as pd
import numpy as np


# O caminho para o arquivo é recebido pela linha de comando
file_path = pathlib.Path(sys.argv[1])

# Lê o csv ignorando comentários
data = pd.read_csv(file_path, comment="#")

# Filtra dados dos últimos cinco anos
last_five_years = data[data.year_decimal > data.year_decimal.iloc[-1] - 5]

# Regressão linear
coefficients = np.polyfit(
    last_five_years.year_decimal, last_five_years.temperature_C, 1
)

print(f'{coefficients[0]:.3f},"{file_path.stem.replace("-", " ").title()}"')
# Impressão de resultados