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



// ---- ENGENHEIROS ! ! ! !

// Obtem Engenheiros
app.get('/engenheiros', cors(), (req, res) => {
    let sql = 'SELECT * FROM engenheiro';
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    });
});

// Obter um Engenheiro por CPF
app.get('/engenheiros/:cpf_engenheiro', (req, res) => {
    let sql = `SELECT * FROM engenheiro WHERE cpf_engenheiro=${req.params.cpf_engenheiro}`;
    db.query(sql, (err, resultados) => {
        res.json(resultados);
    });
});

// Obtem um Engenheiro por email
app.get('/engenheiros/email/:email', (req, res) => {
    let sql = `SELECT * FROM engenheiro WHERE email='${req.params.email}'`;
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

// Obter um Profissional Geral por CPF
app.get('/profissionalgeral/:cpf_profissional', (req, res) => {
    let sql = `SELECT * FROM profissionalgeral WHERE cpf_profissional=${req.params.cpf_profissional}`;
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

// Adiciona Engenheiros
app.post('/engenheiros', (req, res) => {
    let engenheiro = req.body;
    let sql = 'INSERT INTO engenheiro SET ?';
    db.query(sql, engenheiro, (err, resultados) => {
        console.log(resultados);
    });
    res.status(201).json(engenheiro);
})

// Adiciona Profissionais Gerais
app.post('/profissionalgeral', (req, res) => {
    let profissionalgeral = req.body;
    let sql = 'INSERT INTO profissionalgeral SET ?';
    db.query(sql, profissionalgeral, (err, resultados) => {
        console.log(resultados);
    });
    res.status(201).json(profissionalgeral);
})

// Ola mundo!
app.get('/', (request, response) => {
    response.send("Ola mundo")
})

// Printa Mensagem ao conectar com a porta
app.listen(port, () => {
    console.log("Servidor conectado na porta " + port)
})