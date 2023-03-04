# blibiotecas 
import requests
import json
# importa o link do arquivo de confuguraçao 
from .Apis_config import APIServer_Name

#API para buscar dados das produçoes
def get_Production():
    dados = requests.get(APIServer_Name['Producao'])
    return json.loads(dados.content)
        
#API para iniciar uma produção    
def post_Production(mat=[],id=[]):
    values = {
        "mat1":mat[0],
        "mat1":mat[2],
        "mat1":mat[3],
        "mat1":mat[4],
        "mat1":mat[5],
        "mat1":mat[6],
        "mat1":mat[7],
        "mat1":mat[8],
        "mat2":mat[9],
         
        "mat1":mat[0],
        "mat1":mat[2],
        "mat1":mat[3],
        "mat1":mat[4],
        "mat1":mat[5],
        "mat1":mat[6],
        "mat1":mat[7],
        "mat1":mat[8],
        "mat2":mat[9] 
    }
    print(values)
    resposta = requests.post(APIServer_Name['Producao'],json=values) 
    print(resposta)
    print(resposta.text)
        
#API para Finalizar uma produção 
def put_Production(date):
    values = {
        "final_date":date           
    }
    resposta = requests.put(APIServer_Name['Producao'],json=values) 
    print(resposta)
    print(resposta.text)
        
#API para Deletar uma produção     
def delete_Production(id):
    values = {
        "id":id           
    }
    resposta = requests.delete(APIServer_Name['Producao'],json=values) 
    print(resposta)
    print(resposta.text)   
   