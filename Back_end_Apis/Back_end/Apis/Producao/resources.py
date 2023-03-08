#blibiotecas
from pathlib import Path
from flask_restx import Resource
from flask import request
from .Db_Querys import Querys
from datetime import datetime
from Database.Database import DB
import json
import time

Db_source = Path(__file__).parent/"Db_source.json"

with open(Db_source,encoding='utf-8') as my_json:
    dados = json.load(my_json)
    setings = dados["Setings"]["MySQL"]
    
#Inicializa a isstancia do bando de dados
Database = DB(setings)

#pega os segundos para gerar o id da produção

Curent_prodID = 0

# API Produçao
class Producao (Resource):

    #metodo POST
    def post(self):
        global Curent_prodID

        initial_date = datetime.now().strftime("%Y-%m-%d, %H:%M:%S")
        Curent_prodID = int(time.time())
        values = (Curent_prodID,initial_date)
        sql= "insert into producao (id_prod,initial_date)values(%s,%s)"
        Database.execute(sql,values)

        materiais =[]
        ids=[]

        iteracao=0
        for mats in request.json["materiais"]:
            if mats !="0":
                materiais.append(mats)
                ids.append(request.json["mat_ids"][iteracao])
                values = (Curent_prodID,request.json["mat_ids"][iteracao])
                Database.execute(Querys["Add_materiais"],values)
            iteracao+=1
        return 'Producao iniciada com sucesso',201
    

    #metodo PUT
    def put(self):


        
        global Curent_prodID

        if request.json["comando"] == "fechar":
            final_date = datetime.now().strftime("%Y-%m-%d, %H:%M:%S")
        
            valores=(Curent_prodID,)
            sql= "SELECT id FROM producao WHERE id = %s"
            Database.execute_select (sql,valores)
            
            if Database.rowcount >= 1 :
                valores = (final_date,Curent_prodID)
                sql = "UPDATE production SET final_date = %s WHERE producao.id = %s"
                Database.execute(sql,valores)
                Curent_prodID = 0

                return "Producao Fechada Com Sucesso",200
            else:
                return "Nenhuma Producao foi iniciada",404
            
        else:
            pass
  

    #metodo DELETE
    def delete(self):
        id = request.json ['id']

        values=(id,)    
        sql = "DELETE FROM materiais_producao WHERE id_prod = %s"
        Database.execute(sql,values)
        sql = "DELETE FROM producao WHERE id_prod = %s"
        Database.execute(sql,values)
        
        return "Producao Deletada com sucesso",201   