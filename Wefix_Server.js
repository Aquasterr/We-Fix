const express = require('express')
const mysql = require('mysql')
const cors = require('cors')
const app = express();

app.use(cors())
app.use(express.json());

const port = 3002

// Conecta com o banco de dados
const db =  mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'wefixdb'
})

// Conecta no banco de dados
db.connect((err) => {
    console.log("Conectado ao banco de dados.")
})

// ---------------- GETs ----------------

// Obter todos os clientes
app.get('/clientes', cors(), (req, res) => {
    let sql = 'SELECT * FROM cliente';
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    });
});

// Obter um Cliente por CPF
app.get('/clientes/:cpf_cliente', (req, res) => {
    let sql = `SELECT * FROM cliente WHERE cpf_cliente=${req.params.cpf_cliente}`;
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    });
});

// Obter uma Conta por Email
app.get('/contas/:email', (req, res) => {
    let sql = `SELECT * FROM cliente WHERE email='${req.params.email}'`;
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    })
})

// ---------------- POSTs ----------------

// Adiciona Clientes
app.post('/clientes', (req, res) => {
    let cliente = req.body;
    let sql = 'INSERT INTO cliente SET ?';
    db.query(sql, cliente, (err, resultados) => {
        console.log(resultados);
    });
    res.status(201).json(cliente);
})

// Ola mundo!
app.get('/', (request, response) => {
    response.send("Ola mundo")
})

// Printa Mensagem ao conectar com a porta
app.listen(port, () => {
    console.log("Servidor conectado na porta " + port)
})