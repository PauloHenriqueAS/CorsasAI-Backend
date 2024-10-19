# Use uma imagem base com Python 3.11
FROM python:3.11-slim

# Instale as dependências do sistema operacional necessárias
RUN apt-get update && \
    apt-get clean

# Crie um diretório para o app
WORKDIR /app

# Copie os arquivos do projeto para o container
COPY . /app

# Instale as dependências do Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Comando para rodar a aplicação
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
