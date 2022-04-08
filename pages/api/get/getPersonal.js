import db from '../../../libs/db'

export default async function getPersonal(req, res) {
    if (req.method !== 'GET') return res.status(405).end();

    const data = await db('personal_data');

    res.status(200);

    return res.json({
        message: 'get data',
        data
    })
}