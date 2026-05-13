const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Função auxiliar para ler arquivos JSON
const readJsonFile = (fileName) => {
    try {
        const filePath = path.join(__dirname, fileName);
        const data = fs.readFileSync(filePath, 'utf8');
        return JSON.parse(data);
    } catch (err) {
        console.error(`Erro ao ler arquivo ${fileName}:`, err);
        return [];
    }
};

app.get('/api', (req, res) => {
    return res.status(200).json({
        result: {
            success: true,
            text: "Api health"
        },
        statusCode: 200
    });
});

// // Rota: POST para buscar a chave de api
// app.post('/api-key', (req, res) => {
//     const { email, password } = req.body;

//     if (!email || !password) {
//         return res.status(400).json({
//             error: {
//                 title: "Dados insuficientes",
//                 description: "O email e a senha são obrigatórios para realizar o login."
//             },
//             statusCode: 400
//         });
//     }

//     try {
//         const users = readJsonFile('users.json');
//         const user = users.find(u => u.email === email && u.password === password);

//         if (!user) {
//             return res.status(401).json({
//                 error: {
//                     title: "Credenciais Inválidas",
//                     description: "Email ou senha incorretos. Verifique seus dados e tente novamente."
//                 },
//                 statusCode: 401
//             });
//         }

//         // Remove a senha da resposta
//         const { password: _, ...userWithoutPassword } = user;

//         return res.status(200).json({
//             result: {
//                 user: userWithoutPassword,
//                 apiKey: "{SUA-CHAVE-DE-API-AQUI}"
//             },
//             statusCode: 200
//         });
//     } catch (err) {
//         return res.status(500).json({
//             error: {
//                 title: "Erro Interno",
//                 description: "Falha ao ler a base de dados de usuários."
//             },
//             statusCode: 500
//         });
//     }
// });

app.get('/stores', (req, res) => {
    try {
        const stores = readJsonFile('stores.json');
        return res.status(200).json({
            result: stores,
            statusCode: 200
        });
    } catch (err) {
        return res.status(500).json({
            error: {
                title: "Erro Interno",
                description: "Falha ao ler a base de dados de lojas."
            },
            statusCode: 500
        });
    }
});

app.listen(PORT, () => {
    console.log(`Rodando em http://localhost:${PORT}`);
});