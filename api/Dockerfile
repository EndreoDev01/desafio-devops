# Etapa base: imagem leve com Python
FROM python:3.11-slim

# Cria e define a pasta de trabalho
WORKDIR /app

# Copia os arquivos necessários
COPY requirements.txt .

# Instala os pacotes Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos da API
COPY . .

# Expõe a porta que usaremos
EXPOSE 8000

# Comando para iniciar a API com uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
