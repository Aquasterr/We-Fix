const express = require('express')
const mysql = require('mysql')
const cors = require('cors')
const app = express();

app.use(cors())
app.use(express.json());

// Conecta com o banco de dados
const db =  mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'wefixcrud'
})

// Conecta ao banco de dados
db.connect((err) => {
    console.log('Conectado ao banco de dados!');
});

// ---------------- GETs ----------------

// Obter todas equipes
app.get('/equipes', cors(), (req, res) => {
    let sql = 'SELECT * FROM equipe';
    db.query(sql, (err, results) => {
        res.json(results);
    });
});

// Obter todos os Empreiteiros
app.get('/empreiteiros', (req, res) => {
    console.log("Get empreiteiros");
    let sql = 'SELECT * FROM empreiteiro';
    db.query(sql, (err, results) => {
        res.send(results);
    });
});

// Obter todos os Clientes
app.get('/clientes', (req, res) => {
    let sql = 'SELECT * FROM cliente';
    db.query(sql, (err, results) => {
        res.json(results);
    });
});

// Obter todes es Portfolies
app.get('/portfolios', (req,res) => {
    let sql = 'SELECT * FROM portfolio';
    db.query(sql, (err, results) => {
        res.json(results);
    })
})


// Obter uma equipe
app.get('/equipes/:cpf', cors(), (req, res) => {
    let sql = `SELECT * FROM equipe WHERE cpf=${req.params.cpf}`;
    db.query(sql, (err, results) => {
        res.json(results);
    });
});

// Obter um Empreiteiro
app.get('/empreiteiros/:cpf', (req, res) => {
    let sql = `SELECT * FROM empreiteiro WHERE cpf=${req.params.cpf}`;
    db.query(sql, (err, results) => {
        res.json(results);
    });
});

// Obter um Cliente
app.get('/clientes/:cpf', (req, res) => {
    let sql = `SELECT * FROM cliente WHERE cpf=${req.params.cpf}`;
    db.query(sql, (err, results) => {
        res.json(results);
    });
});

// Obter um portfolie
app.get('/portfolios/:cpf', (req, res) => {
    let sql = `SELECT * FROM portfolio WHERE cpf=${req.params.cpf}`;
    db.query(sql, (err, results) => {
        res.json(results);
    });
});



// ---------------- POSTs ----------------

// Adiciona Equipes
app.post('/equipes', (req, res) => {
    let equipe = req.body;
    let sql = 'INSERT INTO equipe SET ?';
    db.query(sql, equipe, (err, result) => {
        console.log(result);
    });
    res.status(201).json(equipe);
});

// Adiciona Empreiteiros
app.post('/empreiteiros', (req, res) => {

    let empreiteiro = req.body;
    let sql = 'INSERT INTO empreiteiro SET ?';
    db.query(sql, empreiteiro, (err, result) => {
        console.log(result);
    });
    res.status(201).json(empreiteiro);
});

// Adiciona clientes
app.post('/clientes', (req, res) => {
    let cliente = req.body;
    let sql = 'INSERT INTO cliente SET ?';
    db.query(sql, cliente, (err, result) => {
        console.log(result);
    });
    res.status(201).json(cliente);
});

// Adiciona Portfolies
app.post('/portfolios', (req, res) => {
    let portfolio = req.body;
    let sql = 'INSERT INTO portfolio SET ?';
    db.query(sql, portfolio, (err, result) => {
        console.log(result);
    });
    res.status(201).json(portfolio);
});
// ---------------- PUTs ----------------

// Altera Equipes
app.put('/equipes/:cpf', (req, res) => {
    let equipe = req.body;
    let sql = `UPDATE equipe 
    SET 
    cpf='${equipe.cpf}',
    nome='${equipe.nome}',
    email='${equipe.email}',
    senha='${equipe.senha}',
    quantidade='${equipe.quantidade}', 
    especialidade='${equipe.especialidade}'
    WHERE cpf='${req.params.cpf}'`;
    
    db.query(sql, (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Ocorreu um erro durante a atualização da equipe.' });
        } else {
            console.log(result);
            res.json(equipe);
        }
    });
});

// Altera Empreiteiros
app.put('/empreiteiros/:cpf', (req, res) => {
    let empreiteiro = req.body;
    let sql = `UPDATE empreiteiro
    SET
    cpf='${empreiteiro.cpf}', 
    nome='${empreiteiro.nome}',
    email='${empreiteiro.email}',
    senha='${empreiteiro.senha}',
    endereco='${empreiteiro.endereco}',
    especialidade='${empreiteiro.especialidade}',
    certificados='${empreiteiro.certificados}' 
    WHERE cpf='${req.params.cpf}'`;
    
    db.query(sql, (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Ocorreu um erro durante a atualização do Empreiteiro.' });
        } else {
            console.log(result);
            res.json(empreiteiro);
        }
    });
});

// Altera clientes
app.put('/clientes/:cpf', (req, res) => {
    let cliente = req.body;
    let sql = `UPDATE cliente 
    SET 
    cpf='${cliente.cpf}',
    nome='${cliente.nome}',
    email='${cliente.email}',
    senha='${cliente.senha}',
    endereco='${cliente.endereco}' 
    WHERE cpf='${req.params.cpf}'`;
    
    db.query(sql, (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Ocorreu um erro durante a atualização do cliente.' });
        } else {
            console.log(cliente);
            res.json(cliente);
        }
    });
});

// Altera Portfolies
app.put('/portfolios/:cpf', (req, res) => {
    let portfolio = req.body;
    let sql = `UPDATE portfolio 
    SET 
    cpf='${portfolio.cpf}',
    NomePrestador='${portfolio.NomePrestador}',
    TipoDeReforma='${portfolio.TipoDeReforma}',
    Detalhes='${portfolio.Detalhes}' ,
    Funcao='${portfolio.Funcao}' ,
    Imagem='${portfolio.Imagem}'
    WHERE cpf='${req.params.cpf}'`;
    
    db.query(sql, (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Ocorreu um erro durante a atualização do portfolie.' });
        } else {
            console.log(portfolio);
            res.json(portfolio);
        }
    });
});

// ---------------- DELETEs ----------------


// Deleta Equipes
app.delete('/equipes/:cpf', (req, res) => {
    let sql = `DELETE FROM equipe
    WHERE cpf=${req.params.cpf}`;
    db.query(sql, (err, result) => {
        res.send('Equipe Deletada!');
    });
});

// Deleta Empreiteiros
app.delete('/empreiteiros/:cpf', (req, res) => {
    let sql = `DELETE FROM empreiteiro
    WHERE cpf=${req.params.cpf}`;
    db.query(sql, (err, result) => {
        res.send(result);
    });
});

// Deleta Clientes
app.delete('/clientes/:cpf', (req, res) => {
    let sql = `DELETE FROM cliente
    WHERE cpf=${req.params.cpf}`;
    db.query(sql, (err, result) => {
        res.send('Cliente Deletado!');
    });
});

// Deleta Portfolies
app.delete('/portfolios/:cpf', (req, res) => {
    let sql = `DELETE FROM portfolio
    WHERE cpf=${req.params.cpf}`;
    db.query(sql, (err, result) => {
        res.send('Portfolio Deletado!');
    });
});

// ---------------- ETCs ----------------

app.get('/', (request, response) => {
    response.send("Ola mundo")
})

app.listen(3002, () => {
    console.log("Servidor aberto na porta 3002")
})
