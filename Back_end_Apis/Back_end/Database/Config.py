#função para definir  dados de conexão do banco de dados
def Db_source(Source='MySql'):

    if Source == 'SQLServernuvem':
        Login = {
            'host':"tcp:htsisconecta.database.windows.net" ,
            'user':"Hugodb",
            'password':"HT-SIS-002conecta",
            'database':'ConectaDB',
            'encrypt':'yes',            
            'id': 1       
        }
        return Login
         
    elif Source == 'MySql':
        Login = {
            'host':"localhost",
            'user':"conectadb",
            'password':"HT-SIS-002conecta",
            'database':'projeto',
            'id': 2     
        }
        return Login


    