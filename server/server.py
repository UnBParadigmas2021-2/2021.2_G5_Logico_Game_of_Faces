import socket

HOST = "127.0.0.1"  
PORT = 65432 


from pyswip import Prolog

prolog = Prolog()

prolog.consult('./main.pl')
prolog.consult('./popula.pl')
prolog.consult('./utils.pl')

def consult_prolog():
    return list(prolog.query("is_bastard('s', 'M', C)"))

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    conn, addr = s.accept()
    with conn:
        print(f"Connected by {addr}")
        result = consult_prolog()
        print(result)
        if type(result) is dict: 
            conn.sendall(bytes('TRUE'.encode()))
        else: 
            conn.sendall(bytes('FALSE'.encode()))