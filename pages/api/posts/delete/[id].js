import db from '../../../../libs/db'

export default async function deleteHandler(req, res) {
    if (req.method !== 'DELETE') return res.status(405).end();

    const { id } = req.query

    await db('personal_data').where({ id }).del();
    
    res.status(200);
    res.json({
        message: 'Delete Successfully'
    })
}