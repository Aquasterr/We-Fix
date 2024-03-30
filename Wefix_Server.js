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

// Obtem um cliente por email
app.get('/clientes/email/:email', (req, res) => {
    let sql = `SELECT * FROM cliente WHERE email='${req.params.email}'`;
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    })
})

// ---- ARQUITETOS

// Obtem Arquitetos
app.get('/arquitetos', cors(), (req, res) => {
    let sql = 'SELECT * FROM arquiteto';
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    });
});

// Obter um Arquitetos por CPF
app.get('/arquitetos/:cpf_arquiteto', (req, res) => {
    let sql = `SELECT * FROM arquiteto WHERE cpf_arquiteto=${req.params.cpf_arquiteto}`;
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    });
});

// Obtem um arquiteto por email
app.get('/arquitetos/email/:email', (req, res) => {
    let sql = `SELECT * FROM arquiteto WHERE email='${req.params.email}'`;
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    })
})



// ---- EMPREITEIROS ! ! ! !

// Obtem Empreiteiros
app.get('/empreiteiros', cors(), (req, res) => {
    let sql = 'SELECT * FROM empreiteiro';
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    });
});

// Obtem um Empreiteiros por email
app.get('/empreiteiros/email/:email', (req, res) => {
    let sql = `SELECT * FROM empreiteiros WHERE email='${req.params.email}'`;
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    })
})

// ---- PROFISSIONAL GERAL ! ! ! !

// Obtem Profissional Geral
app.get('/profissionalgeral', cors(), (req, res) => {
    let sql = 'SELECT * FROM profissionalgeral';
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    });
});

// Obtem um Profissional Geral por email
app.get('/profissionalgeral/email/:email', (req, res) => {
    let sql = `SELECT * FROM profissionalgeral WHERE email='${req.params.email}'`;
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

// Adiciona Arquitetos
app.post('/arquitetos', (req, res) => {
    let arquiteto = req.body;
    let sql = 'INSERT INTO arquiteto SET ?';
    db.query(sql, arquiteto, (err, resultados) => {
        console.log(resultados);
    });
    res.status(201).json(arquiteto);
})

// Adiciona Empreiteiros
app.post('/empreiteiros', (req, res) => {
    let empreiteiro = req.body;
    let sql = 'INSERT INTO empreiteiro SET ?';
    db.query(sql, empreiteiro, (err, resultados) => {
        console.log(resultados);
    });
    res.status(201).json(empreiteiro);
})

// Ola mundo!
app.get('/', (request, response) => {
    response.send("Ola mundo")
})

// Printa Mensagem ao conectar com a porta
app.listen(port, () => {
    console.log("Servidor conectado na porta " + port)
})