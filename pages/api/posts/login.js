import db from '../../../libs/db'

export default async function login(req, res) {
    if (req.method !== 'POST') return res.status(405).end();

    const { username, password } = req.body;
    console.log(username);
    console.log(password);
    const checkUsername = await db('login').where({ username, password }).first();
    console.log(checkUsername);
    if (!checkUsername) return res.status(401).end();

    res.status(200);
    res.json({ message: 'Login Successfull' })
}